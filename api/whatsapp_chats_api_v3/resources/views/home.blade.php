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
</head>

<body style="overflow: hidden">
    <div class="container" style="margin: 1rem;">
        <div class="row">
            <div class="col-md">
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
                margin-bottom: 10px;
                overflow:scroll;
                overflow-x: hidden;
                -webkit-overflow-scrolling: touch;">
                    @foreach ($messageList as $message)
                        <a class="list-group-item list-group-item-action flex-column align-items-start"
                            onclick="openChat({{ $message->id }})">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">{{ $message->name }}</h5>
                                <small class="text-muted">{{ $message->updated_at }}</small>
                            </div>
                            <p class="mb-1">{{ $message->body }}</p>
                        </a>
                    @endforeach
                </div>
            </div>
            <div class="col-xl">

            </div>

        </div>
    </div>


    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous">
    </script>
    <script>
        function openChat(idChat) {
            alert("Apro chat "+idChat);
        }
    </script>
</body>

</html>
