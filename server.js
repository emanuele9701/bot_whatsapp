const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');
const axios = require("axios/index.js");
const url = "http://localhost/bot_whatsapp/api/whatsapp_chats_api_v3/public/index.php/api";
const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
const fs = require('fs');
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

var chats = new Array();

client.on('ready', async c => {
    chats = await client.getChats();

    console.log("Trovate " + chats.length + " chat");

    sincronizza_chat(chats);
    downloadImages();
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
            timestamp_chat: chat.timestamp * 1000
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
                    timestamp_message: message.timestamp * 1000,
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

function getChatById(idChat) {
    var chatSearched = null;
    chats.forEach(chat => {
        if (chat.id._serialized == idChat) {
            chatSearched = chat;
        }
    });
    return chatSearched;
}

async function downloadImages() {

    var messageId = await request(url + "/chats/messages/getMessageImage", {}, 'get').then(function(ok) {
        writeSuccessLog("Recuperati " + ok.data.length + " messaggi da analizzare");
        return ok.data;
    }).catch(function(e) {
        writeErrorLog("Errore recupero messaggi da analizzare " + e);
        return null;
    })
    if (messageId == null) {
        return false;
    }

    var mediaToDownload = new Array();
    for (let idy = 0; idy < messageId.length; idy++) {
        var mediaSend = new Array();
        const id = messageId[idy];
        writeSuccessLog("Processo chat: " + id.chats_id);
        var c = getChatById(id.chats_id);
        if (c == null) {
            writeErrorLog("Chat non trovata, chat id: " + id.chats_id);
            continue;
        }
        await c.fetchMessages({ limit: 1000 }).then(function(messaggi) {
            writeSuccessLog("Recuperati: " + messaggi.length);
            messaggi.forEach(function(messaggio) {
                writeSuccessLog("Cerco messaggio: " + id.message_id);
                if (messaggio.id._serialized == id.message_id) {
                    writeSuccessLog("Trovato, scarico i media");
                    // Scarico i media
                    mediaToDownload.push({
                        chat_id: id.chats_id,
                        message_id: id.message_id,
                        ws_messaggio: messaggio
                    });
                }
            });
        }).catch(function(error) {
            writeErrorLog(getDateitalianFormat() + error + " - Errore nel recupero messaggi per la chat: " + id.chats_id);
        });
    }

    for (let x = 0; x < mediaToDownload.length; x++) {
        const element = mediaToDownload[x];
        var messaggio = element.ws_messaggio;
        writeSuccessLog("Scarico media per " + element.message_id);
        await messaggio.downloadMedia().then(function(media) {
            mediaSend.push({
                chats_id: element.chats_id,
                messageId: element.message_id,
                base64data: new Buffer.from(media.data).toString('base64')
            });
            writeSuccessLog(getDateitalianFormat() + " Scaricato media per " + element.message_id);
        }).catch(function(error) {
            writeErrorLog(getDateitalianFormat() + error + " - Errore nel download media per il messaggio: " + element.message_id);
        });

        if (x == 0) {
            continue;
        }
        var modRes = mediaSend.length % 5;
        if (modRes == 0) {
            writeSuccessLog("Preparo invio con ws " + url + '/chats/messages/saveImageMessage');
            writeSendRequestLog("Salvo immagini: "+new Buffer.from(JSON.stringify(mediaSend)).toString('base64'));
            await request(url + '/chats/messages/saveImageMessage', { data: new Buffer.from(JSON.stringify(mediaSend)).toString('base64') }).then(function(succes) {
                writeSuccessLog("Inviati con successo!");
            }).catch(function(error) {
                writeErrorLog("Errore nell'invio. " + error);
            });
            mediaSend = new Array();
        }
    }

}

function getDateitalianFormat() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth();
    var day = date.getDay();
    var hour = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();

    return day + "/" + month + "/" + year + " " + hour + ":" + minutes + ":" + seconds;
}

async function writeSendRequestLog(stringa) {
    console.log("ERRORE: " + stringa);
    fs.appendFileSync('request_log_sended.log', stringa + "\n", function(err) {
        if (err) return console.log(err);
    });
}

async function writeErrorLog(stringa) {
    console.log("ERRORE: " + stringa);
    fs.appendFileSync('error.log', stringa + "\n", function(err) {
        if (err) return console.log(err);
    });
}

async function writeSuccessLog(stringa) {
    console.log("SUCCESSO: " + stringa);
    fs.appendFileSync('success.log', stringa + "\n", function(err) {
        if (err) return console.log(err);
    });
}

client.on('message', async msg => {

    var msg = {
        fromMe: msg.fromMe,
        chats_id: msg.from,
        body: msg.body,
        timestamp_message: msg.timestamp * 1000,
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