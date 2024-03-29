const url = "http://bot.whatsapp.local/api";
const axios = require("axios/index.js");
const rateLimit = require('axios-rate-limit');
const limitedAxios = rateLimit(axios.create(), { maxRequests: 10, perMilliseconds: 15000 });
const fs = require('fs');
const { Client } = require("whatsapp-web.js");
var justCalled = false;
async function request(url_request, data_post = {}, method = 'post') {
    await sleep(getRandomNum());
    const params = new URLSearchParams();

    Object.entries(data_post).forEach(entry => {
        const [key, value] = entry;
        params.append(key, value);
    });

    if (method == 'post') {

        var result = await limitedAxios.post(url_request, params)
            .then(response => {
                return response.data;
            })
            .catch(error => {
                return error.response;
            });
    } else {
        var result = await limitedAxios.get(url_request, params)
            .then(response => {
                return response.data;
            })
            .catch(error => {
                return error.response;
            });
    }
    // var result = await axios({
    //     method: method,
    //     maxContentLength: Infinity,
    //     maxBodyLength: Infinity,
    //     // url: "https://gmapsextractor.altervista.org/bot_whatsapp/api/api.php?a=" + request,
    //     url: url_request,
    //     data: params,
    // })
    return result;
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
                about: await contatto.getAbout()
            });
        }
    }
    var json = new Buffer.from(JSON.stringify(chats_info));
    await request(url + '/chats/updateChatsInfo', { info_chats: json.toString('base64') }).then(function(success) {
        // console.log(success);
        writeSuccessLog("Info chat salvate");
    }).catch(function(error) {
        // console.log(error);
        writeErrorLog("Info chat non salvate");
    });
    chats_info = new Array();
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

async function salvaReazione(reazione) {
    var toSend = Buffer.from(JSON.stringify({
        reaction_id: reazione.id._serialized,
        message_id: reazione.msgId._serialized,
        reaction: reazione.reaction,
        reaction_time: reazione.timestamp * 1000
    }));
    var toSendBase64 = toSend.toString('base64');
    await request(url + "/reactions/newReaction", { data: toSendBase64 }).then(function(result) {
        writeSuccessLog("Salvata reazione correttamente");
    }).catch(function(error) {
        writeErrorLog("Errore salvataggio reazione");
    });
}

async function sincronizza_chat(chats) {

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
            if (messages != undefined) {

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
    })

    await request(url + "/chats/messages/insertMultiNewMessage", { message: Buffer.from(JSON.stringify(listMessage)).toString('base64') }).then((res) => {
        if (res.data.esito == true) {
            console.log("Messaggi aggiunti");
        } else {
            console.log(res.msg);
        }
    }).catch((err) => {
        console.log("Errore nell'aggiunta del mex");
    })

    sendInfoChat(chats);

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

    var mediaNonTrovati = new Array();
    var mediaSend = new Array();
    for (let idy = 0; idy < messageId.length; idy++) {
        const id = messageId[idy];
        writeSuccessLog("Processo chat: " + id.chats_id);
        var c = getChatById(id.chats_id, chats);
        if (c == null) {
            writeErrorLog("Chat non trovata, chat id: " + id.chats_id);
            continue;
        }
        var messaggi = await c.fetchMessages({ limit: 100 });
        var trovato = false;
        for (let idx = 0; idx < messaggi.length; idx++) {
            const messaggio = messaggi[idx];
            if (messaggio.id._serialized == id.message_id) {
                writeSuccessLog("Trovato, scarico i media");
                var media = await messaggio.downloadMedia();
                if (media != undefined) {
                    mediaSend.push({
                        chats_id: id.chats_id,
                        messageId: id.message_id,
                        base64data: media.data,
                        mime: media.mimetype
                    });
                    trovato = true;
                    break;
                }
            }
        }
        if (!trovato) {
            mediaNonTrovati.push(id.message_id);
        }
    }


    if (mediaSend.length > 0) {
        var toSend = new Array();
        for (let index = 0; index < mediaSend.length; index++) {
            const element = mediaSend[index];
            toSend.push(element);
            if (((index + 1) % 50) == 0) {
                var json = Buffer.from(JSON.stringify(toSend));
                await request(url + '/chats/messages/saveMediaMessage', { data: json.toString('base64') }).then(function(succes) {
                    writeSuccessLog("Inviati con successo!");
                }).catch(function(error) {
                    writeErrorLog("Errore nell'invio. " + error);
                });
                toSend = new Array();
            }
        }
        if (toSend.length > 0) {
            var json = Buffer.from(JSON.stringify(toSend));
            await request(url + '/chats/messages/saveMediaMessage', { data: json.toString('base64') }).then(function(succes) {
                writeSuccessLog("Inviati con successo!");
            }).catch(function(error) {
                writeErrorLog("Errore nell'invio. " + error);
            });
        }

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
        // console.log("Errore", err);
        error = true;
    }).then(function(ok) {
        console.log("Successo");
    });

    if (msg.hasMedia) {
        // Download media
        var mediaFile = null;
        await msg.downloadMedia().then(function(mediaScaricato) {
            mediaFile = {
                chats_id: msg.from,
                messageId: msg.id._serialized,
                base64data: mediaScaricato.data,
                mime: mediaScaricato.mimetype
            }
            writeSuccessLog("Salvataggio messaggio: Media scaricato");
        }).catch(function(error) {

            error = true;
            writeErrorLog("Salvataggio messaggio: Media non scaricato per " + error);
        })

        if (mediaFile != null) {
            var json = new Buffer.from(JSON.stringify(mediaFile));
            await request(url + '/chats/messages/saveMediaMessage', { data: json.toString('base64') }).then(function(succes) {
                writeSuccessLog("Salvataggio messaggio: Inviati con successo!");
            }).catch(function(error) {
                writeErrorLog("Salvataggio messaggio: Errore nell'invio. " + error);
                error = true;
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
    // console.log("ERRORE: " + stringa);
    fs.appendFileSync('error.log', stringa + "\n", function(err) {
        if (err) return console.log(err);
    });
}

async function writeSuccessLog(stringa) {
    // console.log("SUCCESSO: " + stringa);
    fs.appendFileSync('success.log', stringa + "\n", function(err) {
        if (err) return console.log(err);
    });
}

function sleep(ms) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    });
}

function getRandomNum() {
    return Math.floor(Math.random() * 1000);
}

module.exports = { renameChat, request, salvaReazione, sincronizza_chat, sendInfoChat, downloadImages, salvaMessaggio, flagSendMex, getMessagesToSend, inviaMessaggio };