<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Message extends Model
{
    protected $table = "chat_messages";

    public static function findForChatsId($chat_id, $toArray = true, $classReturn = false)
    {

        if ($toArray) {
            $chat = DB::table('chats', 'c')->join('chat_messages as cm', 'cm.chats_id', '=', 'c.chats_id')->where('c.chats_id', '=', $chat_id)->where("cm.body",'<>','')->orderBy('cm.timestamp_message', 'desc')->limit(1)->get(['cm.*', 'c.name', 'c.updated_at','c.id as chat_id'])->toArray();

        } else {
            $chat = DB::table('chats', 'c')->join('chat_messages as cm', 'cm.chats_id', '=', 'c.chats_id')->where('c.chats_id', '=', $chat_id)->where("cm.body",'<>','')->orderBy('cm.timestamp_message', 'desc')->limit(1)->get(['cm.*', 'c.name', 'c.updated_at','c.id as chat_id']);
        }
        if (empty($chat) || $chat->count() <= 0) {
            return false;
        } elseif ($classReturn) {
            return $chat[0];
        } else {
            return json_decode(json_encode($chat[0]), true);
        }
    }



    public static function findForMessageId($message_id)
    {
        $message = DB::select("SELECT * FROM chat_messages WHERE message_id = '$message_id'");
        if (empty($message)) {
            return false;
        } else {
            return json_decode(json_encode($message[0]), true);
        }
    }

    public static function getImageMessages()
    {
        return DB::table('chat_messages')->where('hasMedia', '=', 1)->get(['chats_id', 'message_id'])->toArray();
    }

    public static function insert($message)
    {
        // Controllo se esiste la chat
        $chat = Chat::findForChatsId($message['chats_id']);
        if (!$chat) {
            Chat::insert(['chats_id' => $message['chats_id'], 'name' => $message['chats_id'], 'timestamp_chat' => $message['timestamp_message'], 'hasNewMex' => isset($chat['hasNewMex']) ? $chat['hasNewMex'] : 0]);
        } else {
            Chat::updateFromChatId($message['chats_id'], ['hasNewMex' => isset($chat['hasNewMex']) ? $chat['hasNewMex'] : 0]);
        }

        return DB::table('chat_messages')->insert($message);
    }
}
