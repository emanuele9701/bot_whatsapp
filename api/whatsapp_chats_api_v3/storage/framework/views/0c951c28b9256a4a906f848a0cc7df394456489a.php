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
        .card {
            background-color: burlywood;
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
</head>

<body style="overflow: hidden">
    <div class="container" style="margin: 1rem; max-width: 98%;">
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
                -webkit-overflow-scrolling: touch;">
                    <?php $__currentLoopData = $messageList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $message): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        
                        <a class="list-group-item list-group-item-action flex-column align-items-start"
                            href="<?php echo e(route('show_chat', $message->chat_id)); ?>">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1"><?php echo e($message->name); ?></h5>
                                <small class="text-muted"><?php echo e($message->timestamp_message); ?></small>
                            </div>
                            <p class="mb-1"><?php echo e($message->body); ?></p>
                        </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
            <div class="col-xl list_message"
                style="margin-top: 3.4rem;
                max-height: 800px;
                max-width: 100%;
                border-style: solid;
                overflow:scroll;
                overflow-x: hidden;
                -webkit-overflow-scrolling: touch;">

                <div class="messages" id="mex_list">
                    <?php if(isset($messages)): ?>
                        <?php if($messages): ?>
                            <?php $__currentLoopData = $messages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $mex): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            
                                <?php if($mex->fromMe == 1): ?>
                                    <?php echo $__env->make('messages.message_from', [
                                        'text' => $mex->body,
                                        'data' => $mex->timestamp_message,
                                        'image' => $mex->stream,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                <?php else: ?>
                                    <?php echo $__env->make('messages.message_me', [
                                        'text' => $mex->body,
                                        'data' => $mex->timestamp_message,
                                        'image' => $mex->stream,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    <?php endif; ?>
                </div>
            </div>

        </div>
        <div class="row module_send">
            <div class="col col-11">
                <textarea id="makedMessage" style="width: 100%;" class="form-control"></textarea>
            </div>
            <div class="col col-1">
                <button class="btn btn-primary" onclick="sendMessage()">Invia</button>
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
        let currentChat = 0;

        function openChat(idChat) {
            currentChat = idChat;
            $.ajax({
                url: "<?php echo e(url('api/chats/messages/all/')); ?>/" + idChat,
                method: 'get',
                dataType: 'json',
                success: function(re) {

                }
            })
        }
        <?php if(isset($messages)): ?>
            function sendMessage() {
                var mx = $("#makedMessage").val();
                $.ajax({
                    url: "<?php echo e(route('responseMessage')); ?>",
                    data: {
                        chat_id: <?php echo e($chat_id); ?>,
                        message: mx
                    },
                    method: 'post',
                    dataType: 'json',
                    success: function(e) {
                        if (e.esito == true) {
                            $("#mex_list").append('<div class="row messagge_from"><p class="text-data-me">' +
                                mx +
                                '</p><small class="info-data-me">Oggi</small></div>');
                        }
                    }
                });
            }
        <?php endif; ?>
    </script>
</body>

</html>
<?php /**PATH C:\xampp\htdocs\bot_whatsapp\api\whatsapp_chats_api_v3\resources\views/home.blade.php ENDPATH**/ ?>