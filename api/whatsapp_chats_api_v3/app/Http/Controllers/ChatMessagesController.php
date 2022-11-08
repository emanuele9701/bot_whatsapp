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
        $strEvt = "";
        if (isset($messages['fromMe'])) {
            $x = Chat::where("chats_id", $messages['chats_id'])->count();
            if ($x > 0) {
                $idChat = Chat::where("chats_id", $messages['chats_id'])->get("id");
                $strEvt = "App\Events\NewMessage_" . $idChat[0]->id;
            }
            // var_dump($idChat[0]);die;
            $probMex = Message::findForMessageId($messages['message_id']);
            // var_dump($probMex);die;
            if (!$probMex) {
                Message::insert($messages);
                if($messages['fromMe'] == false) {
                    Chat::updateFromChatId($messages['chats_id'], ['hasNewMex' => 1]);
                }
                if ($messages['fromMe'] == false) {
                    @ChatMessagesController::evtNewMessage("messages", $strEvt, ['chatId' => $idChat[0]->id]);
                    @ChatMessagesController::evtNewMessage("messages", "App\Events\NewMessage");
                }
            }
        } else {
            foreach ($messages as $message) {
                $x = Chat::where("chats_id", $messages['chats_id'])->count();
                if ($x > 0) {
                    $idChat = Chat::where("chats_id", $messages['chats_id'])->get("id");
                    $strEvt = "App\Events\NewMessage_" . $idChat[0]->id;
                }
                $probMex = Message::findForMessageId($message['message_id']);
                if (!$probMex) {
                    Message::insert($message);
                    if ($message['fromMe'] == false) {
                        Chat::updateFromChatId($messages['chats_id'], ['hasNewMex' => 1]);
                        @ChatMessagesController::evtNewMessage("messages", $strEvt, ['chatId' => $idChat[0]->id]);
                        @ChatMessagesController::evtNewMessage("messages", "App\Events\NewMessage");
                    }
                }
            }
        }
        return ['esito' => true, 'msg' => 'Ok'];
    }

    static function evtNewMessage($channel = "messages", $event, $data = [])
    {
        $options = array(
            'cluster' => getenv("PUSHER_APP_CLUSTER"),
            'useTLS' => true
        );
        $pusher = new Pusher(
            getenv("PUSHER_APP_KEY"),
            getenv("PUSHER_APP_SECRET"),
            getenv("PUSHER_APP_ID"),
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
            $probMex = Message::findForMessageId($mex['message_id']);
            if (!$probMex) {
                Message::insert($mex);
                if ($mex['fromMe'] == false) {
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

    public function setReadMessage(Request $request)
    {
        $idMessaggio = $request->input("message_id");

        $findMex = Message::where("message_id", $idMessaggio)->count() > 0 ? true : false;

        if ($findMex) {
            Message::where("message_id", $idMessaggio)->update(['read' => 1, 'hasNewMex' => 0]);
            return ['esito' => true];
        }

        return ['esito' => false];
    }

    public function saveMessageImage(Request $request)
    {
        // $bs64dc = explode("}]", base64_decode($request->input('data')))[0] . "}]";
        $imagesMessages = json_decode(base64_decode($request->input('data')), true);

        $message_id = $imagesMessages['messageId']; // Messaggio a cui agganciare l'immagine
        $bs64img = $imagesMessages['base64data'];
        $mime = $imagesMessages['mime'];
        // $chats_id = $imagesMessages[0]['chats_id']; // Chat a cui agganciare 
        $messaggioCercato = MediaMessage::findFromMessageId($message_id);
        if (!empty($messaggioCercato)) {
            return response()->json(['esito' => false, 'msg' => "Nessun messaggio a cui agganciarsi"]);
        }
        $findChat = DB::table("chat_messages")->join('chats', 'chats.chats_id', '=', 'chat_messages.chats_id')->where("chat_messages.message_id", '=', $message_id)->get(['chat_messages.*', 'chats.id as idChat'])->toArray();
        $chats_id = null;
        if (!empty($findChat)) {
            $chats_id = $findChat[0]->chats_id;
        }

        if ($chats_id == null) {
            return response(json_encode(['esito' => false, 'msg' => "Chat non trovata"]), 500, ['Content-Type' => 'application/json']);
        }
        // Recupero tipo di media
        $mimeToType = DB::table("conv_media_type")->where("mime", '=', $mime)->get(['mime', 'type']);
        $imageName = "";
        $type = "";
        if (!empty($mimeToType)) {
            switch ($mimeToType[0]->type) {
                case 'image':
                    $imageName = uniqid() . ".jpeg";
                    $type = "image";
                    break;
                case 'audio':
                    $imageName = uniqid() . ".ogg";
                    $type = "audio";
                    break;
                case 'video':
                    $imageName = uniqid() . ".mp4";
                    $type = "video";
                    break;
            }
        }


        if (Storage::disk('local2')->put($imageName, base64_decode($bs64img))) {
            $media = new MediaMessage();
            $media->name = $imageName;
            $media->message_id = $message_id;
            $media->chats_id = $chats_id;
            $media->type = $type;
            $media->save();

            Message::where('message_id', $message_id)->update(['mediaFile' => $media->id, 'hasMedia' => false]);
            $strEvt = "App\Events\NewMessage_" . $findChat[0]->idChat;
            ChatMessagesController::evtNewMessage("messages", $strEvt, ['chatId' => $findChat[0]->idChat]);
            ChatMessagesController::evtNewMessage("messages", "App\Events\NewMessage");
        }
        return ['esito' => true];
    }
}
