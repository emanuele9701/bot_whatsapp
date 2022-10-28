<?php

namespace App\Http\Controllers;

use App\Events\NewMessage;
use App\Models\Chat;
use App\Models\MediaMessage;
use App\Models\Message;
use App\Models\Response;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Pusher\Pusher;

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

    public function listMessages($id_chat)
    {
        if (empty($id_chat)) {
            return ['esito' => false, 'msg' => "No chat id"];
        }
        return Chat::getAllMessages($id_chat);
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
        // var_dump(base64_decode($request->input('message')));die;
        if (empty($messages)) {
            return ['esito' => false, 'msg' => 'No message!'];
        }
        $idChat = [];
        if (isset($messages['fromMe'])) {
            $x = Chat::where("chats_id", $messages['chats_id'])->count();
            if ($x > 0) {
                $idChat = Chat::where("chats_id", $messages['chats_id'])->get("id");
            }
            // var_dump($idChat[0]);die;
            $probMex = Message::findForMessageId($messages['message_id']);
            if (!$probMex) {
                Message::insert($messages);
                Chat::updateFromChatId($messages['chats_id'], ['hasNewMex' => 1]);
                if ($messages['fromMe'] == false) {
                    $strEvt = "App\Events\NewMessage_" . $idChat[0]->id;
                    ChatMessagesController::evtNewMessage("messages", $strEvt, ['chatId' => $idChat[0]->id]);
                    ChatMessagesController::evtNewMessage("messages", "App\Events\NewMessage");
                }
            }
        } else {
            foreach ($messages as $message) {
                $x = Chat::where("chats_id", $messages['chats_id'])->count();
                if ($x > 0) {
                    $idChat = Chat::where("chats_id", $messages['chats_id'])->get("id");
                }
                $probMex = Message::findForMessageId($message['message_id']);
                if (!$probMex) {
                    Message::insert($message);
                    Chat::updateFromChatId($messages['chats_id'], ['hasNewMex' => 1]);
                    if ($message['fromMe'] == false) {
                        $strEvt = "App\Events\NewMessage_" . $idChat[0]->id;
                        ChatMessagesController::evtNewMessage("messages", $strEvt, ['chatId' => $idChat[0]->id]);
                        ChatMessagesController::evtNewMessage("messages", "App\Events\NewMessage");
                    }
                }
            }
        }
        return ['esito' => true, 'msg' => 'Ok'];
    }

    static function evtNewMessage($channel = "messages", $event, $data = [])
    {
        $options = array(
            'cluster' => env("PUSHER_APP_CLUSTER"),
            'useTLS' => true
        );
        $pusher = new Pusher(
            env("PUSHER_APP_KEY"),
            env("PUSHER_APP_SECRET"),
            env("PUSHER_APP_ID"),
            $options
        );

        $toSend = $data;
        if (strlen($event) <= 0) {
            return false;
        }

        $pusher->trigger($channel, $event, $toSend);
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
        if (isset($imagesMessages[0])) {
            $message_id = $imagesMessages[0]['messageId']; // Messaggio a cui agganciare l'immagine
            $bs64img = $imagesMessages[0]['base64data'];
        } else {
            $message_id = $imagesMessages['messageId']; // Messaggio a cui agganciare l'immagine
            $bs64img = $imagesMessages['base64data'];
        }

        // $chats_id = $imagesMessages[0]['chats_id']; // Chat a cui agganciare 
        $messaggioCercato = MediaMessage::findFromMessageId($message_id);
        if (!empty($messaggioCercato)) {
            return ['esito' => false, 'msg' => "Già inserita"];
        }
        $findChat = DB::table("chat_messages")->join('chats','chats.chats_id','=','chat_messages.chats_id')->where("chat_messages.message_id", '=', $message_id)->get(['chat_messages.*','chats.id as idChat'])->toArray();
        $chats_id = null;
        if (!empty($findChat)) {
            $chats_id = $findChat[0]->chats_id;
        }

        if ($chats_id == null) {
            return response(json_encode(['esito' => false, 'msg' => "Chat non trovata"]), 500, ['Content-Type' => 'application/json']);
        }
        $imageName = uniqid() . ".jpeg";
        if (Storage::disk('local2')->put($imageName, base64_decode($bs64img))) {
            $media = new MediaMessage();
            $media->name = $imageName;
            $media->message_id = $message_id;
            $media->chats_id = $chats_id;
            $media->save();

            Message::where('message_id', $message_id)->update(['mediaFile' => $media->id, 'hasMedia' => false]);
            $strEvt = "App\Events\NewMessage_" . $findChat[0]->idChat;
            ChatMessagesController::evtNewMessage("messages", $strEvt, ['chatId' => $findChat[0]->idChat]);
            ChatMessagesController::evtNewMessage("messages", "App\Events\NewMessage");
            return ['esito' => true, 'imamgine_id' => $media->id];
        }
        return ['esito' => false, 'msg' => "Errore"];
    }
}
