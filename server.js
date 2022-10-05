const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');

const url = "http://localhost/bot_whatsapp/api/whatsapp_chats_api_v3/public/index.php/api";
const delay = ms => new Promise(resolve => setTimeout(resolve, ms))

const extraFunctions = require('./functions');

const client = new Client({
    authStrategy: new LocalAuth(),
    puppeteer: { headless: false }
});

var listChatsMessage = new Array();

client.initialize();

client.on('qr', (qr) => {
    console.log('QR RECEIVED', qr);
});

client.on('authenticated', () => {
    console.log('AUTHENTICATED');
});

var chats = new Array();

client.on('ready', async c => {
    chats = await client.getChats();
    extraFunctions.renameChat(chats);
    console.log("Trovate " + chats.length + " chat");

    await extraFunctions.sincronizza_chat(chats);

    console.log("Scarico immagini");
    extraFunctions.downloadImages(chats);
});

client.on('message_create', async msg => {
    extraFunctions.salvaMessaggio(msg);
});



client.on('message', async msg => {
    extraFunctions.salvaMessaggio(msg);
});
// Procedi a filtrare le chat per archiviazione per mancata risposta - oppure filtra per dissenso all'offerta*/