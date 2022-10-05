<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

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
        }

        .card_from {
            background-color: azure;
            border: none;
            margin: 1rem;
        }

        body {
            background-color: rgb(60, 60, 60);
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
            max-height: 2000px
        }
    </style>
    <style>
        body {
            font-family: 'Nunito', sans-serif;
        }
    </style>
</head>

<body class="antialiased">
    <div class="container" id="app">

        <div class="row">
            <div class="col-md" style="max-width: 25%;">
                <div class="row">
                    <div class="col-xl" style="margin-bottom: 1rem; position: left;margin-right: 30%">
                        <div class="form-group">
                            <input type="text" name="search_contact" id="search_contact" class="form-control"
                                placeholder="Ricerca chat" aria-describedby="helpId">
                        </div>
                    </div>
                </div>
                <div class="list-group"
                    style="max-height: 866px;
                    border-style: solid;
                margin-bottom: 10px;
                overflow:scroll;
                overflow-x: hidden;
                -webkit-overflow-scrolling: touch;"
                    id="chatList">
                    <a v-for="chat in messageList"
                        class="list-group-item list-group-item-action flex-column align-items-start"
                        :href="'{{ route('show_chat') }}/' + chat.chat_id">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">@{{ chat.name }}</h5>
                            <small class="text-muted">@{{ chat.timestamp_message }}</small>
                        </div>
                        <p class="mb-1">@{{ chat.body }}</p>
                    </a>
                </div>
            </div>
            <div class="col-xl list_message"
                style="margin-top: 3.4rem;
                max-height: 800px;
                max-width: 100%;
                border-style: solid;
                overflow:scroll;
                overflow-x: hidden;
                -webkit-overflow-scrolling: touch;
                display: flex;
                flex-direction: column-reverse;">

                <div class="messages" id="mex_list" onload="scrollTo(0, 0);">
                    @include('messages.message_from')
                    @include('messages.message_me')
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
    <script>
        const {
            createApp
        } = Vue;

        createApp({
            data() {
                return {
                    message: 'Hello Vue!',
                    messages_from: [],
                    messages_to: [],
                    messageList: []
                }
            }
        }).mount('#app');
    </script>
</body>

</html>
