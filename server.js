const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');
const axios = require("axios/index.js");
const url = "http://localhost/whatsapp_chats/api/whatsapp_chats_api_v2/public/index.php";
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
    if (false) {
        sincronizza_chat(chats);
    }
    downloadImages();
});

async function sincronizza_chat(chats) {
    var arrToSend = new Array();
    for (let index = 0; index < chats.length; index++) {
        const chat = chats[index];
        if (chat.isGroup == true || chat.isReadOnly == true) {
            continue;
        }
        let ar = {
            chats_id: chat.id._serialized,
            name: chat.name,
            timestamp_chat: chat.timestamp
        }
        arrToSend.push(ar);
    }

    let data = JSON.stringify(arrToSend);
    let buff = new Buffer(data);
    let base64data = buff.toString('base64');
    var g = await request(url + '/chats/checkChats', { chats: base64data }).then(function(ok) {
        var response = ok.data;
        response.forEach(chat_response => {
            client.getChatById(chat_response.chat)
                .then(function(chat) {
                    var messages = chat.fetchMessages().then(function(messages) {
                        var listMessage = new Array();
                        messages.forEach(message => {
                            listMessage.push({
                                fromMe: message.fromMe,
                                chats_id: chat.id._serialized,
                                body: message.body,
                                timestamp_message: message.timestamp,
                                hasMedia: message.hasMedia,
                                message_id: message.id._serialized
                            });
                        });

                        let data = JSON.stringify(listMessage);
                        let buff = new Buffer(data);
                        let base64data = buff.toString('base64');
                        request(url + "/chats/messages/insertNewMessage", { message: base64data }).catch(function(err) {
                            console.log(err);
                        }).then(function(ok) {
                            console.log("Successo");
                        });
                    });
                })
                .catch(function(err) {
                    console.log(err)
                });
        });
    }).catch(function(msg) {
        console.log(msg);
    });
}

async function downloadImages() {
    console.log(url + "/chats/messages/getMessageImage");
    var messageId = await request(url + "/chats/messages/getMessageImage", {}, 'get').then(function(ok) {
        return ok.data;
    }).catch(function(e) {
        console.log("Errore", e.arg1.response.message);
        return null;
    })
    console.log("Recuperati: "+messageId.length);
    for (let idy = 0; idy < messageId.length; idy++) {
        var mediaSend = new Array();
        const id = messageId[idy];
        console.log("Processo "+id.chats_id);
        var c = await client.getChatById(id.chats_id);
        var mexs = await c.fetchMessages({ searchOptions: { limit: 100 } });
        for (let idx = 0; idx < mexs.length; idx++) {
            const element = mexs[idx];
            if(element.id._serialized == id.message_id) {
                console.log("Id ricercato corrisponde ad id messaggio corrente");
                console.log("Scarico i media");                
                var media = await element.downloadMedia();
                console.log("Media scaricati, aggiungo all'array");
                mediaSend.push({chats_id: id.chats_id,messageId: id.message_id,base64data: media.data});
                console.log("Capienza array "+mediaSend.length);
            }
        }
        console.log("Base64 encode");
        let data = JSON.stringify(mediaSend);
        let buff = new Buffer(data);
        let base64data = buff.toString('base64');
        console.log(base64data);
        var r = await request(url + '/chats/messages/saveImageMessage',{data: base64data});
        console.log(r);
    }


}

client.on('message', async msg => {

    var msg = {
        fromMe: msg.fromMe,
        chats_id: msg.from,
        body: msg.body,
        timestamp_message: msg.timestamp,
        hasMedia: msg.hasMedia,
        message_id: msg.id._serialized,
        hasNewMex: 1
    }
    let data = JSON.stringify(msg);
    let buff = new Buffer(data);
    let base64data = buff.toString('base64');
    request(url + "/chats/messages/insertNewMessage", { message: base64data }).catch(function(err) {
        console.log("Errore", err);
    }).then(function(ok) {
        console.log("Successo");
    });
});
// Procedi a filtrare le chat per archiviazione per mancata risposta - oppure filtra per dissenso all'offerta*/