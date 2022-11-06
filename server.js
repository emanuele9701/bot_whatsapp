const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');

const url = "http://localhost/bot_whatsapp/api/whatsapp_chats_api_v3/public/index.php/api";
const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
const axios = require("axios/index.js");
const fs = require("fs");
const extraFunctions = require('./functions');
const QRCode = require('qrcode')


const client = new Client({
    authStrategy: new LocalAuth(),
    puppeteer: { headless: false }
});

var listChatsMessage = new Array();

client.initialize();

client.on('qr', async(qr) => {
    console.log('QR RECEIVED');
    QRCode.toString(qr, { type: 'terminal' }, function(err, url) {
        console.log(url)
    })
});

client.on('authenticated', () => {
    console.log('AUTHENTICATED');
});

var chats = new Array();

client.on('ready', async c => {
    waitForMessage();
    chats = await client.getChats();
    console.log("Trovate " + chats.length + " chat");
    extraFunctions.sincronizza_chat(chats);
    extraFunctions.sendInfoChat(chats);
    // console.log("Scarico immagini");
    // extraFunctions.downloadImages(chats);
});

client.on('message_create', async msg => {
    console.log("message_create");
    if (msg.fromMe) {
        const chat = await msg.getChat();
        console.log("Creato messaggio per: " + chat.name);
        if (!chat.isGroup) {
            extraFunctions.salvaMessaggio(msg);
        }
    }
});



client.on('message', async msg => {
    const chat = await msg.getChat();
    console.log("Nuovo messaggio da: " + chat.name);
    if (!chat.isGroup) {
        extraFunctions.salvaMessaggio(msg);
    }
});

async function waitForMessage() {
    var toSend = false;
    while (true) {
        await sleep(10000);
        if (toSend == false) {
            console.log("Recupero messaggi da trasmettere");
            toSend = true;
            var listaMessaggi = await extraFunctions.getMessagesToSend().then(function(res) {
                return res;
            }).catch(function(err) {
                console.log("Recupero mex errore - " + err);
            });
            if (listaMessaggi != undefined && listaMessaggi.length > 0) {
                console.log("Ci sono dei messaggi");
                for (let x = 0; x < listaMessaggi.length; x++) {
                    const messaggio = listaMessaggi[x];
                    console.log("Invio messaggio " + messaggio.id);
                    var inviato = await extraFunctions.inviaMessaggio(client, messaggio.chats_id, messaggio.text_message);

                    if (inviato != null) {
                        console.log("Inviato");
                        var flagged = await extraFunctions.flagSendMex(messaggio.id, inviato);
                        console.log("Flaggato " + flagged);
                    } else {
                        console.log("Non inviato");
                    }
                }
            } else {
                console.log("Non ci sono dei messaggi");
            }
            toSend = false;
        }
    }
}

function sleep(ms) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    });
}