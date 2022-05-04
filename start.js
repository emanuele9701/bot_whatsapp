const { Client, Location, List, Buttons, LocalAuth, Message } = require('./node_modules/whatsapp-web.js/index');


const axios = require("axios/index.js");
var all_chat = filtered_chat = {};

async function post_request(request, data_post) {

    const params = new URLSearchParams();
    let auth_barer_js = JSON.stringify({ user: 'emanuele', password: 'Ciao1234.' });
    let buffer = Buffer.from(auth_barer_js);

    Object.entries(data_post).forEach(entry => {
        const [key, value] = entry;
        params.append(key, value);
    });

    return await axios({
        method: "post",
        url: "http://localhost/bot_whatsapp/api/api.php?a=" + request,
        data: params,
        dataType: 'json'
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


client.on('ready', async() => {
    console.log('Load chats');
    // Load all chat
    all_chat = await client.getChats();
    console.log('Chats loaded\nNext step - filter chats');
    filtra_chat(all_chat);
    console.log('End filtering chat');
});

async function filtra_chat(lista_chat) {
    for (let index = 10; index < lista_chat.length; index++) {
        const chat = lista_chat[index];

        if (chat.archived == true) {
            // console.log("is already archived");
            if (filtered_chat['archived'] == undefined) {
                filtered_chat['archived'] = new Array();
            }
            filtered_chat['archived'].push(chat);
        } else {
            let list_message = await chat.fetchMessages();

            if (list_message.length < 1) {
                // console.log("Chat haven't messages");
                if (filtered_chat['no_message'] == undefined) {
                    filtered_chat['no_message'] = new Array();
                }
                filtered_chat['no_message'].push(chat);

            } else if (list_message['fromMe'] == true) {
                // console.log("type last message is\n\t" + list_message[0]['type'] + "\n\t body is " + list_message[0]['body']);
                let type_message = list_message[0]['type'];
                let body = list_message[0]['body'];
                let nr_msgs = list_message.length;
                if (type_message == "chat") {
                    // Check message
                    let buffer = Buffer.from(body);

                    let response = await post_request("checkMessage", { message: buffer.toString('base64'), numero_telefono: chat['id']['user'] })

                    if (response.data[0]['stop_msg'] == true) {
                        // console.log(" Stop! ");
                    } else if (response.data[0]['ricalco'] == true) {
                        // console.log(" Ricalco - Identifico ricalco! ");
                    } else {
                        // console.log(" Non ho trovato corrispondenza! ");
                        break;
                    }
                }
            } else {
                // console.log(" Il messaggio viene dal cliente! ");
            }
        }
    }
}


async function archiving_chats(list_chat_archive) {
    let counter = ncounter = 0;
    for (let index = 0; index < list_chat_archive.length; index++) {
        const chat = list_chat_archive[index];
        // console.log(chat);
        var archived = await chat.archive();
        if (archived) {
            var result = await post_request('toArchiveChat', { numero_telefono: chat['id']['user'] });
            counter++;
            // console.log(chat['id']['user'] + " Archiviata");
        } else {
            // console.log(chat['id']['user'] + " non archiviata");
            ncounter++;
        }
    }
    return { v: counter, x: ncounter };
}

async function parse_list_chats(chat_list) {
    var list_chats_to_archive = new Array();
    for (let index = 0; index < chat_list.length; index++) {
        // console.log("Chat nr: " + index);
        const chat = chat_list[index];
        if (chat.archived == true) {
            continue;
        }
        // console.log("Chat: " + chat.name);
        // if(chat.name != "Veneto Pizzeria D'asporto Tricolore") continue;
        let list_message = await chat.fetchMessages();
        // console.log("Ci sono: " + list_message.length + " messaggi");
        var result_check = await check_delivery_read_messages(list_message);
        switch (result_check['sts']) {
            case 1:
                break;
            case 2:
                // Controllare l'ultimo messaggio
                if (result_check['to_archive'] == true) {
                    list_chats_to_archive.push(chat);
                }
                break;
            case 3:
                break;
        }
        // break;
    }
    return list_chats_to_archive;
}

async function check_delivery_read_messages(list_message) {
    var esito = new Array();
    let hours = 36;
    for (let index = 0; index < list_message.length; index++) {
        const message = list_message[index];
        var time_stamp = new Date(message.timestamp * 1000);
        var today = new Date(new Date().setHours(new Date().getHours() - hours));
        var messageInfo = await message.getInfo();
        var id_message_det = messageInfo.id;
        if (messageInfo.id['fromMe'] == true) {
            if (messageInfo.playedRemaining == 1 && messageInfo.read.length > 0) {
                // Messaggio letto
                // console.log("Messaggio letto");
                esito = { sts: 1, to_archive: false };
                break;
            } else if (messageInfo.delivery.length == 0 && messageInfo.played.length == 0 && messageInfo.read.length == 0) {
                // console.log("Messaggio inviato ma non consegnato");
                if (today.getTime() > time_stamp.getTime()) {
                    esito = { sts: 2, to_archive: true };
                    // console.log("Ora invio del mex: " + time_stamp + " orario check " + today + " - Passate più di " + hours + " ore - archiviare");
                } else {
                    // console.log("Ora invio del mex: " + time_stamp + " orario check " + today + " - Passate meno di " + hours + " ore - non archiviare");
                    esito = { sts: 2, to_archive: false };
                }
                break;
            } else if (messageInfo.delivery.length > 0 && messageInfo.playedRemaining != 0 && messageInfo.readRemaining != 0) {
                // console.log("Messaggio consegnato in attesa di lettura");
                esito = { sts: 3, to_archive: false };
                break;
            } else {
                esito = { sts: 4, to_archive: false };
                // console.log(messageInfo);
                break;
            }
        } else {
            // console.log("Messaggio inviato dal destinatario");

            esito = { sts: -1, to_archive: false };
            break;
        }
    }
    return esito;
}
var last_archive_chat = null;
client.on('message', async msg => {
    //
    if (msg.from == "393348261327@c.us") {

        if (msg.body.toLowerCase().indexOf("answer:") >= 0 && msg.body.toLowerCase().indexOf("message:") >= 0) {
            var info_mex = get_info_answer(msg.body);
            var info = await post_request('get_info_message', { id_msg: info_mex.id_msg });
            if (info.data.esito == true) {
                var msg_from_response = info.data.from;
                var result_store = false;
                try {
                    client.sendMessage(msg_from_response, info_mex.body);
                    await post_request('store_answer', { id_msg_from: info_mex.id_msg, answer_body: info_mex.body });
                    result_store = true;
                    client.sendMessage(msg.from, "Risposta inviata");
                } catch (error) {
                    if (!result_store) {
                        // Risposta non inviata
                        console.log(error);
                    }
                }
            } else {
                client.sendMessage(msg.from, info.data.msg);
            }
        } else {
            client.sendMessage(msg.from, 'Ciao, elaboro la richiesta');
            if (msg.body == "gen_archivia") {
                client.sendMessage(msg.from, 'Richiesta in corso..');
                const listChats = await client.getChats();
                client.sendMessage(msg.from, "Trovate: " + listChats.length);
                client.sendMessage(msg.from, "Procedo a filtrare le chat per rilevare quelle da archiviare");

                var lista_chat_archiviare = await parse_list_chats(listChats);
                client.sendMessage(msg.from, "Ci sono " + lista_chat_archiviare.length + " chat da archiviare");
                last_archive_chat = lista_chat_archiviare;
                client.sendMessage(msg.from, 'Richiesta terminata');
            } else if (msg.body == "non interessati") {
                client.sendMessage(msg.from, 'Richiesta in corso..');
                var listChats = await client.getChats();

                listChats = delete_conctat_from_list_chat(listChats);

                var non_interessati = await get_non_interessati(listChats);

                client.sendMessage(msg.from, "Non interessati " + non_interessati.length);
                var response = await post_request("non_interessati", { 'dati': JSON.stringify(non_interessati) });
                var dati = response.data;

                var cnt_ok = cnt_ko = 0;
                for (let idx = 0; idx < dati.length; idx++) {
                    const element = dati[idx];
                    if (element.esito == true) {
                        cnt_ok++;
                    } else if (element.esito == false) {
                        cnt_ko++;
                    }
                }
                var string_response = "Chat fleggate con successo a non interessato: " + cnt_ok + "\nChat non fleggate: " + cnt_ko;
                client.sendMessage(msg.from, string_response);
                client.sendMessage(msg.from, "Procedura terminata");
            } else if (msg.body == "toArchive") {
                client.sendMessage(msg.from, 'Richiesta in corso..');
                if (last_archive_chat == null) {
                    client.sendMessage(msg.from, "Nessuna chat da archiviare, utilizza gen_archivia per generare un elenco");
                } else {
                    client.sendMessage(msg.from, "Procedo ad archiviare le chat");
                    var counter_chat_archiviate = await archiving_chats(last_archive_chat);
                    client.sendMessage(msg.from, "Archiviate " + counter_chat_archiviate['v'] + " chats");
                    client.sendMessage(msg.from, "Non archiviate " + counter_chat_archiviate['x'] + " chats");
                }
                client.sendMessage(msg.from, 'Richiesta terminata');
            } else if (msg.body == "random_archive") {
                client.sendMessage(msg.from, 'Richiesta in corso..');
                if (last_archive_chat == null) {
                    client.sendMessage(msg.from, "Nessuna chat da archiviare, utilizza gen_archivia per generare un elenco");
                } else {
                    var random_idx = Math.floor((Math.random() * last_archive_chat.length) + 1)
                    var time_stamp = new Date(last_archive_chat[random_idx].timestamp * 1000);
                    client.sendMessage(msg.from, "Random chat da archiviare: " + last_archive_chat[random_idx].name + ", ultimo messaggio: " + time_stamp.getDate() + "/" + time_stamp.getMonth());
                }
                client.sendMessage(msg.from, 'Richiesta terminata');
            } else if (msg.body == "un_archive_all") {
                client.sendMessage(msg.from, 'Richiesta in corso..');
                for (let idx = 0; idx < all_chat.length; idx++) {
                    const chat = all_chat[idx];
                    if (chat.archived == false || chat.archived == undefined) {
                        continue;
                    }
                    var un_archive = await chat.unarchive();
                }
                client.sendMessage(msg.from, 'Richiesta terminata');
            } else if (msg.body == "archive_all") {
                client.sendMessage(msg.from, 'Richiesta in corso..');
                for (let idx = 0; idx < all_chat.length; idx++) {
                    const chat = all_chat[idx];
                    if (chat.archived == true || chat.archived == undefined) {
                        continue;
                    }
                    var un_archive = await chat.archive();
                }
                client.sendMessage(msg.from, 'Richiesta terminata');
            } else if (msg.body == "new_chat") {
                new_chat = [];
                for (let idx = 0; idx < all_chat.length; idx++) {
                    const element = all_chat[idx];
                    var date_chat = new Date(element.timestamp * 1000);
                    var date_min = new Date("2022-05-03 00:00:00");
                    var date_max = new Date();
                    if (date_chat >= date_min && date_chat <= date_max) {
                        new_chat.push(element.name);
                    }
                }
                var rs = await post_request('new_chat', { numeri: new_chat });
                client.sendMessage(msg.from,rs.data);
            } else {
                client.sendMessage(msg.from, 'Impossibile elaborare la richiesta');
            }
        }
    } else {
        // salvo il msg in db
        var msg_body = Buffer.from(msg.body, 'utf-8');
        var result = await post_request("store_message", { from: msg.from, body: msg_body.toString('base64') })
        var string = "";
        if (result.data.esito == true) {
            string = "Nuovo messaggio da: " + msg.from;
            string += "\nId Messaggio: " + result.data.id_msg;
            string += "Per rispondere al messaggio scrivere: \nanswer: <Id Messaggio>\nmessage: <testo_messaggio>";
        } else {
            string += "Hai un nuovo messaggio, ma non è possibile rispondere da questa chat";
        }
        client.sendMessage("393348261327@c.us", string);
    }

});

function get_info_answer(body) {
    var suddivisione = body.split('\n');
    var id_messaggio_raw = suddivisione[0].replace('answer:', '').trim();
    var testo_messaggio_raw = suddivisione[1].replace('message:', '').trim();

    return { id_msg: id_messaggio_raw, body: testo_messaggio_raw };
}

function delete_conctat_from_list_chat(lista_chat) {
    var my_chats = [];

    for (let i = 0; i < lista_chat.length; i++) {
        const element = lista_chat[i];
        if (element.name == "Emanuele Lucchese") {
            continue;
        }
        my_chats.push(element);
    }

    return my_chats;

}

async function get_non_interessati(lista_chat) {
    var non_interessati = [];

    for (let i = 0; i < lista_chat.length; i++) {
        var chat = lista_chat[i];
        var messages = await chat.fetchMessages();

        if (messages.length == 0) {
            continue;
        }
        if (messages[0].hasMedia == true && messages[0].fromMe == false) {
            continue;
        }
        if (messages[0].type == 'chat') {
            var body_mex = messages[0].body;
            body_mex = body_mex.toLowerCase();
            if (body_mex.indexOf("buona giornata") >= 0) {
                non_interessati.push(messages[0].id);
            }
        }
    }
    return non_interessati;
}

// Procedi a filtrare le chat per archiviazione per mancata risposta - oppure filtra per dissenso all'offerta*/