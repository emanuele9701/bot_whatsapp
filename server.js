const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');
const axios = require("axios/index.js");

async function post_request(url_request, data_post) {

    const params = new URLSearchParams();

    Object.entries(data_post).forEach(entry => {
        const [key, value] = entry;
        params.append(key, value);
    });

    return await axios({
        method: "post",
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
    var g = await post_request('http://localhost/whatsapp_chats/api/whatsapp_chats_api/public/index.php/chats/checkChats', { chats: base64data }).then(function(ok) {
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
                        post_request("http://localhost/whatsapp_chats/api/whatsapp_chats_api/public/index.php/chats/messages/insertNewMessage", { message: base64data }).catch(function (err) {
                            console.log(err);
                        }).then(function (ok) {
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
    post_request("http://localhost/whatsapp_chats/api/whatsapp_chats_api/public/index.php/chats/messages/insertNewMessage", { message: base64data }).catch(function (err) {
        console.log("Errore",err);
    }).then(function (ok) {
        console.log("Successo");
    });
});
// Procedi a filtrare le chat per archiviazione per mancata risposta - oppure filtra per dissenso all'offerta*/