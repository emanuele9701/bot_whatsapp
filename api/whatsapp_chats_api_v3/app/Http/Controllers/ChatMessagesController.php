<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use App\Models\MediaMessage;
use App\Models\Message;
use App\Models\Response;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Storage;

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

    public function all($idChat)
    {
        $allMex = Chat::getChatsLastMessagge($idChat);
        return $allMex;
    }

    public function responseMessage(Request $request)
    {
        $message = $request->input('message');
        if (empty($message)) {
            return ['esito' => false, 'msg' => 'No message!'];
        }

        $new_response = new Response();
        $new_response->chat_id = $request->input('chat_id');
        $new_response->text_message = $request->input('message');
        $new_response->flag_sended = 0;
        $new_response->save();

        return ['esito' => true, 'id' => $new_response->id];
    }

    public function insertNewMessage(Request $request)
    {
        $messages = json_decode(base64_decode($request->input('message')), true);
        if (empty($messages)) {
            return ['esito' => false, 'msg' => 'No message!'];
        }
        if (isset($messages['fromMe'])) {
            $probMex = Message::findForMessageId($messages['message_id']);
            if (!$probMex) {
                Message::insert($messages);
                Chat::updateFromChatId($messages['chats_id'], ['hasNewMex' => 1]);
            }
        } else {
            foreach ($messages as $message) {
                $probMex = Message::findForMessageId($message['message_id']);
                if (!$probMex) {
                    Message::insert($message);
                    Chat::updateFromChatId($messages['chats_id'], ['hasNewMex' => 1]);
                }
            }
        }
        return ['esito' => true, 'msg' => 'Ok'];
    }

    public function insertMultiNewMessage(Request $request)
    {
        $messages = json_decode(base64_decode($request->input('message')), true);
        if (empty($messages)) {
            return ['esito' => false, 'msg' => 'No message!'];
        }
        foreach ($messages as $mex) {

            if (isset($mex['fromMe'])) {
                $probMex = Message::findForMessageId($mex['message_id']);
                if (!$probMex) {
                    Message::insert($mex);
                    Chat::updateFromChatId($mex['chats_id'], ['hasNewMex' => 1]);
                }
            } else {
                $probMex = Message::findForMessageId($mex['message_id']);
                if (!$probMex) {
                    Message::insert($mex);
                    Chat::updateFromChatId($mex['chats_id'], ['hasNewMex' => 1]);
                }
            }
        }
        return ['esito' => true, 'msg' => 'Ok'];
    }


    /**
     * Ritorna i messaggi che contengono un immagine
     */
    public function getMessageImage()
    {
        $idMessaggi = Message::getImageMessages();
        return $idMessaggi;
    }

    public function saveMessageImage(Request $request)
    {
        $imagesMessages = json_decode(str_replace("\\", "", $request->input('data')), true);
        $stream64Image = base64_decode($imagesMessages[0]['base64data']);
        $chats_id = base64_decode($imagesMessages[0]['chats_id']); // Chat a cui agganciare 
        $message_id = base64_decode($imagesMessages[0]['messageId']); // Messaggio a cui agganciare l'immagine
        if (!empty(MediaMessage::findFromMessageId($message_id))) {
            return ['esito' => false, 'msg' => "Già inserita"];
        }
        $imageName = uniqid() . ".jpeg";
        if (Storage::disk('local')->put($imageName, $stream64Image)) {
            $media = new MediaMessage();
            $media->name = uniqid() . ".jpeg";
            $media->message_id = $message_id;
            $media->chats_id = $chats_id;
            $media->save();
            return ['esito' => true, 'imamgine_id' => $media->id];
        }
        return ['esito' => false, 'msg' => "Errore"];
    }
}
