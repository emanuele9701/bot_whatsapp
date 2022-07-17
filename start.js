const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');
var async = require("async");

const axios = require("axios/index.js");
var all_chat = filtered_chat = {};

async function post_request(request, data_post) {

    const params = new URLSearchParams();
    let auth_barer_js = JSON.stringify({ user: 'emanuele', password: 'Ciao1234.' });
    let buffer = Buffer.from(auth_barer_js);

    Object.entries(data_post).forEach(entry => {
        const [key, value] = entry;
        params.append(key, value);
    });

    return await axios({
        method: "post",
        // url: "https://gmapsextractor.altervista.org/bot_whatsapp/api/api.php?a=" + request,
        url: "http://localhost/bot_whatsapp/api/api.php?a=" + request,
        data: params,
        dataType: 'json'
    })
}



const client = new Client({
    authStrategy: new LocalAuth(),
    puppeteer: { headless: false }
});

var listChatsMessage = new Array();

client.initialize();

client.on('qr', (qr) => {
    // NOTE: This event will not be fired if a session is specified.
    console.log('QR RECEIVED', qr);
});

client.on('authenticated', () => {
    console.log('AUTHENTICATED');
});

const filtra = async(listaChat) => {
    var a = [];
    listaChat.forEach(chat => {
        if (chat.isGroup == false) {
            var isArchived = chat.archived;
            var timestamp = chat.timestamp;
            var unreadCount = chat.unreadCount;
            var name = chat.name;
            var id = chat.id._serialized;
            var isGroup = chat.isGroup;

            var toSend = {
                archived: isArchived,
                tempo: timestamp,
                unreadMessage: unreadCount,
                name: name,
                isGroup: isGroup,
                isReadOnly: chat.isReadOnly,
                chat_id: id
            };
            a.push(toSend);
        }
    });
    return a;
}


client.on('ready', async c => {

    console.log('Load chats');
    // Load all chat
    all_chat = await client.getChats();
    console.log('Chats loaded');
    // filtra_chat(all_chat);
    var sends = await filtra(all_chat);
    console.log('Chats send');
    post_request('save_chat', { chats: JSON.stringify(sends) });

    var mextochats = await recMex(all_chat);

    mextochats = chunkArrayInGroups(mextochats, 25);
    for (let index = 0; index < mextochats.length; index++) {
        const element = mextochats[index];
        var a = await post_request('storeMessage', { dati: JSON.stringify(element) });
        console.log(a);
    }
});

async function recMex(lista_chat) {
    var l = new Array
    for (let x = 0; x < lista_chat.length; x++) {
        const chat = lista_chat[x];
        if (chat.isGroup) {
            continue;
        }
        var h = await chat.fetchMessages();
        var listaMex = await mexToSend(h);
        l.push({
            chat_id: chat.id._serialized,
            messaggi: listaMex.mex,
            images: listaMex.img
        })
    }
    return l;
}

function chunkArrayInGroups(arr, size) {
    var myArray = [];
    for (var i = 0; i < arr.length; i += size) {
        myArray.push(arr.slice(i, i + size));
    }
    return myArray;
}

async function mexToSend(listaMex) {
    var toSend = new Array();
    var image = new Array();
    for (var x = 0; x < listaMex.length; x++) {
        const mex = listaMex[x];
        if (mex.hasMedia) {
            var media = await mex.downloadMedia()
            if (media != undefined) {
                rawMedia = media.data;
            } else {
                rawMedia = mex.rawData.body;
            }
            if (rawMedia == '') continue;
            mimetype = mex.rawData.mimetype;
            mediaKey = mex.rawData.mediaKey;
            size = mex.rawData.size;
            timestamp = mex.rawData.t;
            type = mex.rawData.type;
            image.push({
                body: rawMedia,
                mimetype: mimetype,
                mediaKey: mediaKey,
                size: size,
                timestamp: timestamp,
                message_id: mex.id._serialized,
                type: type
            })
        }
        toSend.push({
            from: mex.from,
            media: mex.hasMedia,
            timestamp: mex.timestamp,
            body: mex.body,
            ack: mex.ack,
            message_id: mex.id._serialized,
        });
    }
    return { mex: toSend, img: image };
}

client.on('message', async msg => {
        var c = await msg.getChat();

        var from = msg.id.remote;
        var isMe = msg.id.fromMe;
        var idUtente = msg.id.id;
        var ack = msg.ack;
        var media = msg.hasMedia;
        var image = null;
        if (media == true) {
            var immagine = await msg.downloadMedia();
            rawMedia = immagine.data;
        } else {
            rawMedia = mex.rawData.body;
        }
        if (rawMedia != '') {
            mimetype = msg.rawData.mimetype;
            mediaKey = msg.rawData.mediaKey;
            size = msg.rawData.size;
            timestamp = msg.rawData.t;
            type = msg.rawData.type;
            image = {
                body: rawMedia,
                mimetype: mimetype,
                mediaKey: msg.rawData.mediaKey,
                size: msg.rawData.size,
                timestamp: msg.rawData.t,
                type: msg.rawData.type
            }
        } else {
            image = null;
        }
        console.log(image);
        var body = msg.body;
        var timestamp = msg.timestamp;
        var isNewMessage = msg.isNewMsg;

        var result = await post_request('save_msg', {
            chat: JSON.stringify({
                chat_id: c.id._serialized,
                isGroup: c.isGroup,
                isReadOnly: c.isReadOnly,
                name: c.name,
                tempo: c.timestamp,
                unreadMessage: c.unreadCount
            }),
            from: from,
            media: media,
            timestamp: timestamp,
            ack: ack,
            body: body,
            message_id: msg.id._serialized,
            rawMedia: JSON.stringify(image)
        });
        console.log(result);
    })
    // Procedi a filtrare le chat per archiviazione per mancata risposta - oppure filtra per dissenso all'offerta*/