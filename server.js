const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');
const axios = require("axios/index.js");
const url = "http://localhost/whatsapp_chats/api/whatsapp_chats_api_v3/public/index.php/api";
const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
async function request(url_request, data_post = {}, method = 'post') {

    const params = new URLSearchParams();

    Object.entries(data_post).forEach(entry => {
        const [key, value] = entry;
        params.append(key, value);
    });

    return await axios({
        method: method,
        // url: "https://gmapsextractor.altervista.org/bot_whatsapp/api/api.php?a=" + request,
        url: url_request,
        data: params,
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



client.on('ready', async c => {
    var chats = await client.getChats();

    console.log("Trovate " + chats.length + " chat");

    sincronizza_chat(chats);
    // downloadImages();
});

async function sincronizza_chat(chats) {
    console.log("Sicronizza chat");
    var listChats = new Array();
    var listMessage = new Array();
    for (let index = 0; index < chats.length; index++) {
        console.log(index + " of " + chats.length);
        const chat = chats[index];
        if (chat.isGroup == true || chat.isReadOnly == true) {
            continue;
        }
        listChats.push({
            chats_id: chat.id._serialized,
            name: chat.name,
            timestamp_chat: chat.timestamp*1000
        });

        await chat.fetchMessages({ limit: 1000 }).catch((error) => {
            console.log(" ----------- Errore in fetch message -------------");
            console.log(error);
        }).then((messages) => {
            for (let x = 0; x < messages.length; x++) {
                const message = messages[x];
                listMessage.push({
                    fromMe: message.fromMe,
                    chats_id: chat.id._serialized,
                    body: message.body,
                    timestamp_message: message.timestamp*1000,
                    hasMedia: message.hasMedia,
                    message_id: message.id._serialized
                });
            }
        });
    }

    var h = Buffer.from(JSON.stringify(listChats));

    await request(url + "/chats/checkChats", { chats: h.toString('base64') }).then((res) => {
        if (res.data.length <= 0) {
            console.log("Non ha aggiunto nessuna chat, chat totali da aggiungere: " + listChats.length);
        } else {
            console.log("Ha aggiunto chat " + res.data.length + ", chat totali da aggiungere: " + listChats.length);
        }
    }).catch((err) => {
        console.log("Errore nell'aggiunta delle chat");
        console.log(err);
    })

    await request(url + "/chats/messages/insertMultiNewMessage", { message: Buffer.from(JSON.stringify(listMessage)).toString('base64') }).then((res) => {
        if (res.data.esito == true) {
            console.log("Messaggio aggiunto");
        } else {
            console.log(res.msg);
        }
    }).catch((err) => {
        console.log("Errore nell'aggiunta del mex");
        console.log(err);
    })
}

async function downloadImages() {
    console.log(url + "/chats/messages/getMessageImage");
    var messageId = await request(url + "/chats/messages/getMessageImage", {}, 'get').then(function(ok) {
        return ok.data;
    }).catch(function(e) {
        console.log("Errore downlaod image");
        return null;
    })
    console.log("Recuperati: " + messageId.length);
    for (let idy = 0; idy < messageId.length; idy++) {
        var mediaSend = new Array();
        const id = messageId[idy];
        console.log("Processo " + id.chats_id);
        var c = await client.getChatById(id.chats_id);
        var mexs = await c.fetchMessages({ searchOptions: { limit: 100 } });
        for (let idx = 0; idx < mexs.length; idx++) {
            const element = mexs[idx];
            if (element.id._serialized == id.message_id) {
                console.log("Id ricercato corrisponde ad id messaggio corrente");
                console.log("Scarico i media");
                element.downloadMedia().then(function(media) {
                    mediaSend.push({
                        chats_id: new Buffer.from(id.chats_id).toString('base64'),
                        messageId: new Buffer.from(id.message_id).toString('base64'),
                        base64data: new Buffer.from(media.data).toString('base64')
                    });
                }).catch(function(error) {
                    console.log("Errore download media");
                    console.log(error);
                });
                delay(500);
            }

        }
        console.log("Base64 encode");
        let data = JSON.stringify(mediaSend);

        var r = await request(url + '/chats/messages/saveImageMessage', { data: data });
        console.log(r);
    }


}

client.on('message', async msg => {

    var msg = {
        fromMe: msg.fromMe,
        chats_id: msg.from,
        body: msg.body,
        timestamp_message: msg.timestamp*1000,
        hasMedia: msg.hasMedia,
        message_id: msg.id._serialized,
        hasNewMex: 1
    }
    let data = JSON.stringify(msg);
    let buff = new Buffer.from(data);
    let base64data = buff.toString('base64');
    request(url + "/chats/messages/insertNewMessage", { message: base64data }).catch(function(err) {
        console.log("Errore", err);
    }).then(function(ok) {
        console.log("Successo");
    });
});
// Procedi a filtrare le chat per archiviazione per mancata risposta - oppure filtra per dissenso all'offerta*/