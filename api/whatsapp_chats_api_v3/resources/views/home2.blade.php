<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home</title>

    <!-- Fonts -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- Styles -->
    <style>
        body {
            background-color: #f4f7f6;
            margin-top: 20px;
        }

        .card {
            background: #fff;
            transition: .5s;
            border: 0;
            margin-bottom: 30px;
            border-radius: .55rem;
            position: relative;
            width: 100%;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
        }

        .chat-app {
            max-height: 1000px;
            height: 95%;
        }

        .chat-app .people-list {
            width: 280px;
            position: absolute;
            left: 0;
            top: 0;
            padding: 20px;
            z-index: 7;
            height: 100%;
        }

        .chat-app .chat {
            margin-left: 280px;
            border-left: 1px solid #eaeaea
        }

        .people-list {
            -moz-transition: .5s;
            -o-transition: .5s;
            -webkit-transition: .5s;
            transition: .5s
        }

        .people-list .chat-list li {
            padding: 10px 15px;
            list-style: none;
            border-radius: 3px
        }

        .people-list .chat-list li:hover {
            background: #efefef;
            cursor: pointer
        }

        .people-list .chat-list li.active {
            background: #efefef
        }

        .people-list .chat-list li .name {
            font-size: 15px
        }

        .people-list .chat-list img {
            width: 45px;
            border-radius: 50%
        }

        .people-list img {
            float: left;
            border-radius: 50%
        }

        .people-list .about {
            float: left;
            padding-left: 8px
        }

        .people-list .status {
            color: #999;
            font-size: 13px
        }

        .chat .chat-header {
            padding: 15px 20px;
            border-bottom: 2px solid #f4f7f6
        }

        .chat .chat-header img {
            float: left;
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-header .chat-about {
            float: left;
            padding-left: 10px
        }

        .chat .chat-history {
            padding: 20px;
            border-bottom: 2px solid #fff
        }

        .chat .chat-history ul {
            padding: 0
        }

        .chat .chat-history ul li {
            list-style: none;
            margin-bottom: 30px
        }

        .chat .chat-history ul li:last-child {
            margin-bottom: 0px
        }

        .chat .chat-history .message-data {
            margin-bottom: 15px
        }

        .chat .chat-history .message-data img {
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-history .message-data-time {
            color: #434651;
            padding-left: 6px
        }

        .chat .chat-history .message {
            color: #444;
            padding: 18px 20px;
            line-height: 26px;
            font-size: 16px;
            border-radius: 7px;
            display: inline-block;
            position: relative
        }

        .chat .chat-history .message:after {
            bottom: 100%;
            left: 7%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #fff;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .my-message {
            background: #efefef
        }

        .chat .chat-history .my-message:after {
            bottom: 100%;
            left: 30px;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #efefef;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .other-message {
            background: #e8f1f3;
            text-align: right
        }

        .chat .chat-history .other-message:after {
            border-bottom-color: #e8f1f3;
            left: 93%
        }

        .chat .chat-message {
            padding: 20px
        }

        .online,
        .offline,
        .me {
            margin-right: 2px;
            font-size: 8px;
            vertical-align: middle
        }

        .online {
            color: #86c541
        }

        .offline {
            color: #e47297
        }

        .me {
            color: #1d8ecd
        }

        .float-right {
            float: right
        }

        .clearfix:after {
            visibility: hidden;
            display: block;
            font-size: 0;
            content: " ";
            clear: both;
        }

        @media only screen and (max-width: 767px) {
            .chat-app .people-list {
                height: 465px;
                /* width: 30%; */
                overflow-x: auto;
                background: #fff;
                /* left: -400px; */
                /* display: none */
            }

            .chat-app .people-list.open {
                left: 0
            }

            .chat-app .chat {
                /* margin: 0 */
            }

            .chat-app .chat .chat-header {
                border-radius: 0.55rem 0.55rem 0 0
            }

            .chat-app .chat-history {
                height: 300px;
                overflow-x: auto
            }
        }

        @media only screen and (min-width: 768px) and (max-width: 992px) {
            .chat-app .chat-list {
                height: 650px;
                overflow-x: auto
            }

            .chat-app .chat-history {
                height: 600px;
                overflow-x: auto
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
            .chat-app .chat-list {
                height: 480px;
                overflow-x: auto
            }

            .chat-app .chat-history {
                height: calc(100vh - 350px);
                overflow-x: auto
            }
        }

        .mexOther {
            background-color: #1d8ecd !important;
        }
    </style>
</head>

<body class="antialiased">

    <div id="app" style="margin: 1rem;">

        <div class="row clearfix" style="height: 100vh;">
            <div class="col-lg-12">
                <div class="card chat-app">
                    <div id="plist" class="people-list" style="overflow-y: scroll;">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Ricerca chat"
                                aria-describedby="helpId" v-model="textSearch" v-on:keyup.enter="search">
                        </div>
                        <ul class="list-unstyled chat-list mt-2 mb-0">
                            <li v-for="(chat,index) in listaChat" v-on:click="openChat(index)">
                                {{-- Ciclo vue --}}
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="avatar">
                                <div class="name">@{{ chat.name }}</div>
                                <div class="status"> @{{ chat.timestamp_message }}</div>
                            </li>
                        </ul>
                    </div>
                    <div class="chat">
                        <div class="chat-header clearfix">
                            <div class="row">
                                <div class="col-lg-6">
                                    <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
                                    </a>
                                    <div class="chat-about">
                                        <h6 class="m-b-0">@{{ name_chat_header }}</h6>
                                        <small>@{{ last_message_date }}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="chat-history" style="overflow-y: auto; max-height: 770px; height: 100% !important;">
                            <ul class="m-b-0">
                                {{-- Messaggio mio --}}
                                <li class="clearfix" v-for="message in messages">

                                    <div v-if="message.fromMe">
                                        <div class="message-data text-right" style="text-align: right;">
                                            <span class="message-data-time">@{{ message.timestamp_message }}</span>
                                        </div>
                                        <div class="message other-message float-right mexOther">
                                            @{{ message.body }}</div>
                                    </div>
                                    <div class="mexMe" v-if="!message.fromMe">
                                        <div class="message-data">
                                            <span class="message-data-time">@{{ message.timestamp_message }}</span>
                                        </div>
                                        <div class="message other-message float-left">
                                            @{{ message.body }}</div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="chat-message clearfix">
                            <div class="row">
                                <div class="col">
                                    <input type="text" v-model="textResponseChat" class="form-control"
                                        placeholder="Scrivi messaggio">
                                </div>
                                <div class="col">
                                    <button class="btn btn-primary" v-on:click="sendMessage">Invia</button>
                                </div>
                            </div>

                        </div>
                    </div>
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
    <script src="https://js.pusher.com/7.2/pusher.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.0.0/axios.js"
        integrity="sha512-HHy6oUGCSBNnEOOG5qtKfLj/ROEAUdbVkznx6Y7x9+qBOvL3PE+oEBSliM5dcOlqMxiuXqca58WbFPXimX11LQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        const createApp = new Vue({
            el: '#app',
            data: {
                messages: [],
                listaChat: [],
                backupListaChat: [],
                textSearch: "",
                textResponseChat: "",
                chat_selected: 0,
                name_chat_header: "",
                last_message_date: ""
            },
            methods: {
                openChat(chat_id) {
                    axios.get("{{ route('list_all_messages') }}/" + this.listaChat[chat_id].chat_id).then(
                        result => {
                            this.messages = result.data;
                            this.name_chat_header = this.listaChat[chat_id].name;
                            this.last_message_date = this.listaChat[chat_id].timestamp_message;
                            this.chat_selected = this.listaChat[chat_id].chat_id;
                        });
                },
                sendMessage() {
                    axios.post("{{ route('responseMessage') }}", {
                        chat_id: this.chat_selected,
                        message: this.textResponseChat
                    }).then(function(response) {
                        if (response.esito == true) {
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
                },
                reload() {
                    axios.get("{{ route('list_all_chats') }}").then(result => {
                        this.listaChat = result.data;
                        this.backupListaChat = this.listaChat;
                    });
                }

            },

            mounted: function() {
                axios.get("{{ route('list_all_chats') }}").then(result => {
                    this.listaChat = result.data;
                    this.backupListaChat = this.listaChat;
                });
            },
        });
        var pusher = new Pusher('456ef6b739ac3e6f465b', {
            cluster: 'eu'
        });

        var channel = pusher.subscribe('messages');
        channel.bind('App\\Events\\NewMessage', function(data) {
            // channel.bind('newMessage', function(data) {
            createApp.reload()
        });

        // createApp({
        //     data() {
        //         return {

        //         }
        //     },
        //     methods: {

        //     },

        // }).mount('#app');
    </script>
</body>

</html>
