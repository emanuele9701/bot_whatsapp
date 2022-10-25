const url = "http://localhost/bot_whatsapp/api/whatsapp_chats_api_v3/public/index.php/api";
const axios = require("axios/index.js");
const fs = require('fs');
const { Client } = require("whatsapp-web.js");
async function request(url_request, data_post = {}, method = 'post') {

    const params = new URLSearchParams();

    Object.entries(data_post).forEach(entry => {
        const [key, value] = entry;
        params.append(key, value);
    });

    return await axios({
        method: method,
        maxContentLength: Infinity,
        maxBodyLength: Infinity,
        // url: "https://gmapsextractor.altervista.org/bot_whatsapp/api/api.php?a=" + request,
        url: url_request,
        data: params,
    })
}

async function getMessagesToSend() {
    var result = await request(url + "/response/getListMessages", {}, 'get');
    return result.data;
}

async function sendInfoChat(chats) {
    var chats_info = new Array();

    for (let x = 0; x < chats.length; x++) {
        const element = chats[x];
        var contatto = await element.getContact();
        if (contatto != undefined) {
            chats_info.push({
                contatto_id: contatto.id,
                numero: contatto.number,
                chat_id: element.id._serialized,
                numero_formattato: await contatto.getFormattedNumber(),
                name: contatto.name,
                short_name: contatto.shortName,
                public_name: contatto.pushname,
                haveWhatsApp: contatto.isWAContact,
                isGroup: contatto.isGroup,
                isBlocked: contatto.isBlocked,
                url_image: await contatto.getProfilePicUrl(),
            });
        }
        if ((x % 3 == 0) && chats_info.length > 0) {
            var json = JSON.stringify(chats_info);
            await request(url + '/chats/updateChatsInfo', { info_chats: json }).then(function(success) {
                // console.log(success);
                writeSuccessLog("Info chat salvate");
            }).catch(function(error) {
                // console.log(error);
                writeErrorLog("Info chat non salvate");
            });
            chats_info = new Array();
        }
    }
}

async function renameChat(chats) {
    var rename = new Array();
    chats.forEach(chat => {
        var id = chat.id._serialized;
        var name = chat.name;

        rename.push({ id_chat: id, new_name: name });
    });
    await request(url + '/chats/renameChats', { chat: JSON.stringify(rename) }).then(function(success) {
        console.log(success);
    }).catch(function(error) {
        console.log(error);
    });
}

async function inviaMessaggio(client, chat_id, text = "Pippo") {
    var messageSended = await client.sendMessage(chat_id, text);
    console.log("Messaggio inviato");
    var messageSendedId = messageSended.id._serialized;
    var saved = await salvaMessaggio(messageSended);
    return saved == true ? messageSendedId : null;
}

async function writeSendRequestLog(stringa) {
    // console.log("SEND REQUEST: " + stringa);
    fs.appendFileSync('request_log_sended.log', stringa + "\n", function(err) {
        if (err) return console.log(err);
    });
}

async function flagSendMex(mex_id, id_mex_saved) {
    var response = await request(url + '/response/setSended', { response_message_id: mex_id, messagedSavedId: id_mex_saved }).then(function(e) {
        return e.data;
    }).catch(function(err) {
        return false;
    });
    return response;
}

async function sincronizza_chat(chats) {
    // console.log("Sicronizza chat");
    var listChats = new Array();
    var listMessage = new Array();
    for (let index = 0; index < chats.length; index++) {
        // console.log(index + " of " + chats.length);
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
            if(messages != undefined) {

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
            }
        });
    }
    writeSuccessLog("Controllo chats");
    var h = Buffer.from(JSON.stringify(listChats));

    await request(url + "/chats/checkChats", { chats: h.toString('base64') }).then((res) => {
        if (res.data.length <= 0) {
            // console.log("Non ha aggiunto nessuna chat, chat totali da aggiungere: " + listChats.length);
        } else {
            console.log("Ha aggiunto chat " + res.data.length + ", chat totali da aggiungere: " + listChats.length);
        }
    }).catch((err) => {
        console.log("Errore nell'aggiunta delle chat");
        console.log(err);
    })

    await request(url + "/chats/messages/insertMultiNewMessage", { message: Buffer.from(JSON.stringify(listMessage)).toString('base64') }).then((res) => {
        if (res.data.esito == true) {
            console.log("Messaggi aggiunti");
        } else {
            console.log(res.msg);
        }
    }).catch((err) => {
        console.log("Errore nell'aggiunta del mex");
        console.log(err);
    })
    return true;
}


async function downloadImages(chats) {

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
        var c = getChatById(id.chats_id, chats);
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
        await sleep(500);
    }

    for (let x = 0; x < mediaToDownload.length; x++) {
        const element = mediaToDownload[x];
        var messaggio = element.ws_messaggio;
        writeSuccessLog("Scarico media per " + element.message_id);
        await messaggio.downloadMedia().then(function(media) {
            mediaSend.push({
                chats_id: element.chats_id,
                messageId: element.message_id,
                base64data: media.data
            });
            writeSuccessLog(getDateitalianFormat() + " Scaricato media per " + element.message_id);
        }).catch(function(error) {
            writeErrorLog(getDateitalianFormat() + error + " - Errore nel download media per il messaggio: " + element.message_id);
        });

        if (mediaSend.length > 3) {
            writeSuccessLog("Preparo invio con ws " + url + '/chats/messages/saveImageMessage');
            writeSendRequestLog("Salvo immagini");
            await request(url + '/chats/messages/saveImageMessage', { data: JSON.stringify(mediaSend) }).then(function(succes) {
                writeSuccessLog("Inviati con successo!");
            }).catch(function(error) {
                writeErrorLog("Errore nell'invio. " + error);
            });
            mediaSend = new Array();
        }
        await sleep(1000);
    }

}

async function salvaMessaggio(msg) {

    var error = false;
    var msgSend = {
        fromMe: msg.fromMe,
        chats_id: msg.from,
        body: msg.body,
        timestamp_message: msg.timestamp * 1000,
        hasMedia: msg.hasMedia,
        message_id: msg.id._serialized,
        hasNewMex: 1
    }

    if (msg.fromMe) {
        msgSend['chats_id'] = msg.to;
    }
    let data = JSON.stringify(msgSend);
    let buff = new Buffer.from(data);
    let base64data = buff.toString('base64');
    await request(url + "/chats/messages/insertNewMessage", { message: base64data }).catch(function(err) {
        console.log("Errore", err);
        error = true;
    }).then(function(ok) {
        // console.log("Successo");
    });

    if (msg.hasMedia) {
        // Download media
        var mediaFile = null;
        await msg.downloadMedia().then(function(mediaScaricato) {
            mediaFile = {
                chats_id: msg.from,
                messageId: msg.id._serialized,
                base64data: mediaScaricato.data
            }
            writeSuccessLog("Salvataggio messaggio: Media scaricato");
        }).catch(function(error) {

            error = true;
            writeErrorLog("Salvataggio messaggio: Media non scaricato per " + error);
        })
        if (mediaFile != null) {
            await request(url + '/chats/messages/saveImageMessage', { data: JSON.stringify(mediaFile) }).then(function(succes) {
                writeSuccessLog("Salvataggio messaggio: Inviati con successo!");
            }).catch(function(error) {
                error = true;
                writeErrorLog("Salvataggio messaggio: Errore nell'invio. " + error);
            });
        }
    }
    return !error;
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

function getChatById(idChat, chats) {
    var chatSearched = null;
    chats.forEach(chat => {
        if (chat.id._serialized == idChat) {
            chatSearched = chat;
        }
    });
    return chatSearched;
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

function sleep(ms) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    });
}

module.exports = { renameChat, sincronizza_chat, sendInfoChat, downloadImages, salvaMessaggio, flagSendMex, getMessagesToSend, inviaMessaggio };