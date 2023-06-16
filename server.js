const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');

const url = "http://bot.whatsapp.local/api";
const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
const axios = require("axios/index.js");
const fs = require("fs");
const extraFunctions = require('./functions');
const QRCode = require('qrcode')
console.log('init');

const client = new Client({
    authStrategy: new LocalAuth(),
    puppeteer: { headless: false }
});
console.log("lets go")
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

client.on('message_ack', async(msg) => {
    var idmex = msg.id._serialized;
    var ack = msg.ack;
    if (ack == 3) {
        // Letto
        await extraFunctions.request(url + "/chats/messages/setRead", { message_id: idmex }).then(function(esito) {
            console.log("Set Read Successo");
        }).catch(function(error) {
            console.log("Set Read Error");
            console.log(error);
        });
    }
});

client.on('message_reaction', async(reaction) => {
    console.log("Reazione");
    extraFunctions.salvaReazione(reaction);
})

client.on('ready', async c => {
    // recuperoListe();
    // return;
    chats = await client.getChats();
    console.log("Trovate " + chats.length + " chat");
    for (let index = 0; index < chats.length; index++) {
        const element = chats[index];
        const contact = await element.getContact();
        if (contact.isBlocked == true) {
            console.log(contact.number + " blocked");
        }
    }
    extraFunctions.downloadImages(chats);
    extraFunctions.sendInfoChat(chats);
    extraFunctions.sincronizza_chat(chats);
    return;
});

async function recuperoListe() {
    var list_message = await extraFunctions.request(url + '/list/list_to_send', {}, 'get');
    console.log(list_message)
    if (list_message.nLists > 0) {
        var liste = list_message.dettaglio_liste;
        for (let jdx = 0; jdx < liste.length; jdx++) {
            const lista = liste[jdx];
            var contatti = lista.contatti;
            console.log("Nome lista: " + lista.lista);
            for (let index = 0; index < contatti.length; index++) {
                const contatto = contatti[index];
                var id = await client.getNumberId(contatto.contatto_numero.replace("+39", ""));
                var chat = await client.getChatById(id._serialized);
                await new Promise(resolve => setTimeout(resolve, 2000));
                var message = await chat.sendMessage("Non ti preoccupare, questo è un messaggio di test dal mio bot. Presto sarà pronto");
                if (message instanceof Message) {
                    // Invio segnale di invio effettuato alla lista
                }
            }
        }
    }
}

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