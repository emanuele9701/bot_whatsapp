const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');

const url = "http://127.0.0.1:8080/bot_whatsapp/api/whatsapp_chats_api_v3/public/index.php/api";
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
client.on('qr', async(qr) => {
    console.log('QR RECEIVED');
    QRCode.toString(qr, { type: 'terminal' }, function(err, url) {
        console.log(url)
    })
});
client.on('authenticated', () => {
    console.log('AUTHENTICATED');
    console.log(LocalAuth);
});
client.initialize()