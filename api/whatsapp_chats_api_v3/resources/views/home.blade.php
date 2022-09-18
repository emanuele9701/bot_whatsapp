<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <title>Home</title>
    <style>
        .messagge_me {
            text-align: left;
            background-color: burlywood;
            width: 30%;
            margin-right: 70%;
            margin-top: 1rem;
            margin-left: 1rem;
            border-radius: 25px
        }

        .messagge_from {
            text-align: right;
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
    </style>
</head>

<body style="overflow: hidden">
    <div class="container" style="margin: 1rem; max-width: 98%;">
        <div class="row">
            <div class="col-md" style="max-width: 31%;">
                <div class="row">
                    <div class="col-xl" style="margin-bottom: 1rem; position: left;margin-right: 30%">
                        <div class="form-group">
                            <input type="text" name="search_contact" id="search_contact" class="form-control"
                                placeholder="Ricerca chat" aria-describedby="helpId">
                        </div>
                    </div>
                </div>
                <div class="list-group"
                    style="max-height: 900px;
                    border-style: solid;
                margin-bottom: 10px;
                overflow:scroll;
                overflow-x: hidden;
                -webkit-overflow-scrolling: touch;">
                    @foreach ($messageList as $message)
                        {{-- @dump($message) --}}
                        <a class="list-group-item list-group-item-action flex-column align-items-start"
                            href="{{ route('show_chat', $message->id) }}" href="url('')">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">{{ $message->name }}</h5>
                                <small class="text-muted">{{ $message->updated_at }}</small>
                            </div>
                            <p class="mb-1">{{ $message->body }}</p>
                        </a>
                    @endforeach
                </div>
            </div>
            <div class="col-xl"
                style="margin-top: 3.4rem;
                max-height: 56.2rem;
                max-width: 100%;
                border-style: solid;
                overflow:scroll;
                overflow-x: hidden;
                -webkit-overflow-scrolling: touch;">
                @if ($messages)
                    @foreach ($messages as $mex)
                        @if ($mex->fromMe == 1)
                            @include('messages.message_from', [
                                'text' => $mex->body,
                                'data' => $mex->updated_at,
                            ])
                        @else
                            @include('messages.message_me', [
                                'text' => $mex->body,
                                'data' => $mex->updated_at,
                            ])
                        @endif
                    @endforeach
                @endif
                {{-- @include('messages.message_from', ['text' => 'pippo from', 'data' => '2022-01-01'])
                @include('messages.message_me', ['text' => 'pippo me', 'data' => '2022-01-01'])
                @include('messages.message_from', ['text' => 'pippo from', 'data' => '2022-01-01'])
                @include('messages.message_me', ['text' => 'pippo me', 'data' => '2022-01-01']) --}}
                <div class="row" style="position: absolute;bottom: 0px; margin-bottom: 1rem; width: 68% !important;">
                    <div class="col col-11">
                        <textarea id="makedMessage" style="width: 100%;" class="form-control"></textarea>
                    </div>
                    <div class="col col-1">
                        <button class="btn btn-primary">Invia</button>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        function openChat(idChat) {
            $.ajax({
                url: "{{ url('api/chats/messages/all/') }}/" + idChat,
                method: 'get',
                dataType: 'json',
                success: function(re) {

                }
            })
        }
    </script>
</body>

</html>
