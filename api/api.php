<?php

require_once __DIR__ . "/load.php";

$action = (isset($_GET['a']) && strlen($_GET['a']) > 0) ? $_GET['a'] : false;
if (!$action) {
    echo json_encode(['esito' => false, 'msg' => "No action"]);
    die;
}
file_put_contents("file.json", json_encode($_POST));
switch ($action) {
    case 'new_chat':
        $tbl_new_nums = new Table($conn, "tmp_nums");
        $result = [];
        $result['esito'] = null;
        $result['msg'] = [];
        $new_chat = explode(",", $_POST['numeri']);
        foreach ($new_chat as $key => $value) {
            if (strpos($value, '+39 ') !== false) {
                // Numero non salvato
                try {
                    $tbl_new_nums->insert(['numero' => str_replace(["+39", " "], "", $value)]);
                } catch (PDOException $pdo) {
                    $result['esito'] = true;
                    $result['msg'][] = "$value: " . $pdo->getMessage() . "\n";
                }
            }
        }
        echo json_encode($result);
        break;
    case 'store_message':
        $message = $_POST;
        $to_insert = [
            'msg_from' => $message['from'],
            'msg_body' => utf8_encode(base64_decode($message['body']))
        ];

        try {
            $tbl_msg = new Table($conn, "history_msg");
            $id_msg = $tbl_msg->insert($to_insert);
            echo json_encode(['esito' => true, 'id_msg' => $id_msg]);
        } catch (PDOException $pdo) {
            echo json_encode(['esito' => false, 'msg' => $pdo->getMessage()]);
            die;
        }

        break;
    case 'get_info_message':

        $info = $_POST;
        $msg = get_info_msg($info['id_msg']);
        if (!empty($msg)) {
            echo json_encode(['esito' => true, 'from' => $msg[0]['msg_from'], 'body' => $msg[0]['msg_body']]);
        } else {
            echo json_encode(['esito' => false, 'msg' => "Nessun messaggio corrisponde all'ID " . $info['id_msg']]);
        }
        die;
        break;
    case 'store_answer':
        $answer = $_POST;

        $id_msg_from = $answer['id_msg_from'];
        $answer = utf8_encode($answer['answer_body']);

        $info_msg_from = get_info_msg($id_msg_from);

        if (!empty($info_msg_from)) {
            // Store answer
            $tbl_answers = new Table($conn, 'history_msg_answer');
            $answer_id = $tbl_answers->insert(['id_msg_from' => $id_msg_from, 'answer' => $answer]);
            if ($answer_id > 0) {
                echo json_encode(['esito' => true, 'msg' => "Risposta salvata"]);
            } else {
                echo json_encode(['esito' => false, 'msg' => "Risposta non salvata"]);
            }
        } else {
            echo json_encode(['esito' => false, 'msg' => "Nessun messaggio corrisponde all'ID " . $info['id_msg']]);
        }
        break;
    case 'save_msg':
        // Controllo se esiste la chat
        $tbChat = new Table($conn, "chats");
        $tbMsg = new Table($conn, "messaggi");
        $tbIma = new Table($conn, "media_from_message");

        $chat = json_decode($_POST['chat'], true);
        $chat_id = 0;
        $checkChat = $tbChat->select("WHERE chat_id = ?", ['*'], [$chat['chat_id']]);
        if (empty($checkChat)) {
            // Creo la chat
            $chat_id = $tbChat->insert($chat);
        } else {
            $chat_id = $checkChat[0]['chat_id'];
            $tbChat->update(['unreadMessage' => $chat['unreadMessage'], 'isGroup' => $chat['isGroup'], 'isReadOnly' => $chat['isReadOnly'], 'tempo' => $chat['tempo']], ['chat_id' => $chat_id]);
        }
        $idIma = null;
        $toInsert = [
            'chat_id' => $chat_id,
            'msg_from' => $_POST['from'],
            'media' => $_POST['media'],
            'timestamps' => $_POST['timestamp'],
            'body' => $_POST['body'],
            'ack' => $_POST['ack']
        ];

        $sqlInsert = "INSERT INTO messaggi (" . implode(",", array_keys($toInsert)) . ") VALUES ('" . implode("','", $toInsert) . "')";

        $ans = $tbMsg->insert($toInsert);
        if ($_POST['media'] != "false" && $_POST['media'] != false) {
            // Rintraccio il media
            if (empty($tbIma->select("WHERE media_key = ?", null, [$_POST['rawMedia']['mediaKey']]))) {

                $_POST['rawMedia'] = json_decode($_POST['rawMedia'], true);
                $streamImage = $_POST['rawMedia']['body']; // Base 64 encode
                $mimetype = $_POST['rawMedia']['mimetype'];
                $size = $_POST['rawMedia']['size'];
                $type = $_POST['rawMedia']['type'];
                $timestamps = $_POST['rawMedia']['timestamp'];
                $mediaKey = $_POST['rawMedia']['mediaKey'];
                $toInsertImage = [
                    'message_id' => $ans,
                    'media_key' => $mediaKey,
                    'mimetype' => $mimetype,
                    'type' => $type,
                    'size' => $size,
                    'stream' => $streamImage,
                    'timestams' => $timestamps
                ];
   
                $idIma = $tbIma->insert($toInsertImage);
            }
        }
        echo json_encode(['esito' => true, 'id' => $ans, 'img_id' => $idIma]);

        break;
    default:
        echo json_encode(['esito' => false, 'msg' => "Action is not exist"]);
        break;
}
die;

function get_info_msg($id_msg)
{
    global $conn;
    try {
        $tbl_msg = new Table($conn, "history_msg");
        $msg = $tbl_msg->select("where id = ?", null, [$id_msg]);
        return $msg;
    } catch (PDOException $pdo) {
        return false;
    }
}
