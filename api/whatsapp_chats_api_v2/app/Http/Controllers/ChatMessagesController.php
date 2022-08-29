<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use App\Models\Message;
use Illuminate\Http\Request;

class ChatMessagesController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    public function insertNewMessage(Request $request)
    {
        $messages = json_decode(base64_decode($request->input('message')), true);
        if(empty($messages)) {
            return ['esito' => false,'msg' => 'No message!'];
        }
        if(isset($messages['fromMe'])) {
            $probMex = Message::findForMessageId($messages['message_id']);
            if (!$probMex) {
                Message::insert($messages);
            }
        } else {
            foreach ($messages as $message) {
                $probMex = Message::findForMessageId($message['message_id']);
                if (!$probMex) {
                    Message::insert($message);
                }
            }
        }
        return ['esito' => true, 'msg' => 'Ok'];
    }


    /**
     * Ritorna i messaggi che contengono un immagine
     */
    public function getMessageImage() {
        $idMessaggi = Message::getImageMessages();
        return $idMessaggi;
    }

    public function saveMessageImage(Request $request) {
        $imagesMessages = base64_decode($request->input('data'));
        var_dump($imagesMessages);
    }
}
