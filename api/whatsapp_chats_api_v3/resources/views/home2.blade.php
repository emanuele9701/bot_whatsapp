<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- Styles -->
    <style>
        .card_to {
            background-color: burlywood;
            border: none;
            margin: 1rem;
            width: 93%;
        }

        .card_from {
            background-color: azure;
            border: none;
            margin: 1rem;
        }

        body {
            background-color: rgb(60, 60, 60);
            font-family: 'Nunito', sans-serif;
            overflow-x: hidden;
        }

        .messagge_me {
            background-color: burlywood;
            width: 30%;
            margin-right: 70%;
            margin-top: 1rem;
            margin-left: 1rem;
            border-radius: 25px
        }

        .messagge_from {
            /* text-align: right; */
            background-color: azure;
            width: 30%;
            margin-left: 70%;
            margin-top: 1rem;
            margin-right: 1rem;
            border-radius: 25px
        }

        .info-data-me {
            text-align: right;
            font-size: 10px
        }

        .info-data-from {
            text-align: left;
            font-size: 10px
        }

        .text-data-from {
            font-family: 'Courier New', Courier, monospace
        }

        .text-data-me {
            font-family: 'Courier New', Courier, monospace
        }

        .messages {
            margin-bottom: 1rem;
        }

        .module_send {
            position: absolute;
            bottom: 0px;
            width: 68% !important;
            margin-top: 1rem;
            max-width: 1000px;
            left: 40%;
        }

        .list_message {
            margin-top: 3.4rem;
            max-height: 800px;
            max-width: 1430px;
            border-style: solid;
            overflow: scroll;
            overflow-x: hidden;
            overflow-y: auto;
            -webkit-overflow-scrolling: touch;
            display: flex;
            flex-direction: column-reverse;
        }
    </style>
</head>

<body class="antialiased">
    <div id="app" style="margin: 1rem;">

        <div class="row">
            <div class="col-md" style="max-width: 25%;">
                <div class="row">
                    <div class="col-xl" style="margin-bottom: 1rem; position: left;margin-right: 30%">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Ricerca chat"
                                aria-describedby="helpId" v-model="textSearch" v-on:keyup.enter="search">
                        </div>
                    </div>
                </div>
                <div class="list-group"
                    style="max-height: 866px;
                    height: 100%;
                    border-style: solid;
                margin-bottom: 10px;
                overflow:scroll;
                overflow-x: hidden;
                -webkit-overflow-scrolling: touch;"
                    id="chatList">
                    <a v-for="chat in listaChat"
                        class="list-group-item list-group-item-action flex-column align-items-start"
                        v-on:click="openChat(chat.chat_id)">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">@{{ chat.name }}</h5>
                            <small class="text-muted">@{{ chat.timestamp_message }}</small>
                        </div>
                        <p class="mb-1">@{{ chat.body }}</p>
                    </a>
                </div>
            </div>
            <div class="col-xl list_message">

                <div class="messages" id="mex_list" onload="scrollTo(0, 0);">
                    <div class="row" v-for="message in messages">
                        <div v-if="message.fromMe">
                            <div class="card card_to" style="width: 20%;" v-if="message.stream">
                                <img class="card-img-top" :src="'data:image/jpeg;base64,' + message.stream"
                                    style="width: auto;">
                                <div class="card-body" style="width: 100%;">
                                    <p class="card-text">@{{ message.body }}</p>
                                    <small class="info-data-me">@{{ message.timestamp_message }}</small>
                                </div>
                            </div>
                            <div v-else class="row message_from"
                                style="background-color: burlywood;
                            width: 30%;
                            margin-right: 70%;
                            margin-top: 1rem;
                            margin-left: 1rem;
                            border-radius: 25px;">
                                <p class="text-data-me">@{{ message.body }}</p>
                                <small class="info-data-me">@{{ message.timestamp_message }}</small>
                            </div>
                        </div>
                        <div v-else-if="!message.fromMe"
                            style="background-color: azure;
                        width: 30%;
                        margin-left: 68%;
                        margin-top: 1rem;
                        margin-right: 1rem;
                        border-radius: 25px;">
                            <div class="card card_from" style="width: 18rem;" v-if="message.stream">
                                <img class="card-img-top" :src="'data:image/jpeg;base64,' + message.stream"
                                    style="width: 250px !important;">
                                <div class="card-body" style="width: 100%;">
                                    <p class="card-text">@{{ message.body }}</p>
                                    <small class="info-data-from">@{{ message.timestamp_message }}</small>
                                </div>
                            </div>
                            <div v-else-if="!message.stream">
                                <p class="text-data-from">@{{ message.body }}</p>
                                <small class="info-data-from">@{{ message.timestamp_message }}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row module_send">
                <div class="col col-11">
                    <textarea id="makedMessage" v-model="textResponseChat" style="width: 100%;" class="form-control"></textarea>
                </div>
                <div class="col col-1">
                    <button class="btn btn-primary" v-on:click="sendMessage">Invia</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        const {
            createApp
        } = Vue;

        createApp({
            data() {
                return {
                    messages: [],
                    listaChat: [],
                    backupListaChat: [],
                    textSearch: "",
                    textResponseChat: "",
                    chat_selected: 0
                }
            },
            methods: {
                openChat(chat_id) {
                    axios.get("{{ route('list_all_messages') }}/" + chat_id).then(result => {
                        this.messages = result.data;
                    });
                    this.chat_selected = chat_id;
                },
                sendMessage() {
                    axios.post("{{ route('responseMessage') }}", {
                        chat_id: this.chat_selected,
                        message: this.textResponseChat
                    }).then(function(response) {
                        if(response.esito == true) {
                            openChat(this.chat_selected);
                        }
                    }).catch(function(error) {
                        console.log(error);
                    });
                },
                search() {
                    var chatSearched = new Array();
                    this.listaChat = this.backupListaChat;
                    if (this.textSearch.length > 0) {
                        this.listaChat.forEach(chat => {
                            if (chat.name.indexOf(this.textSearch) > -1) {
                                chatSearched.push(chat);
                            }
                        });
                        if (chatSearched.length < 1) {
                            // Ricerco nel db
                            axios.get("{{ route('search_chat') }}/" + this.textSearch).then(result => {
                                this.listaChat = result.data;
                            });
                        } else {
                            this.listaChat = chatSearched;
                        }
                    }
                }
            },
            mounted() {
                axios.get("{{ route('list_all_chats') }}").then(result => {
                    this.listaChat = result.data;
                    this.backupListaChat = this.listaChat;
                });
                // $.ajax({
                //     url:"{{ route('list_all_chats') }}",
                //     async: false,
                //     method:'get',
                //     lista_chat = result.data;
                //     result: function (result) {

                //     }
                // })
            },
        }).mount('#app');
    </script>
</body>

</html>
