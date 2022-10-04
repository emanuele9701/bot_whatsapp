<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class Chat extends Model
{
    protected $table = "chats";

    public static function findForChatsId($chat_id)
    {
        $chat = DB::table('chats')->where('chats_id', '=', $chat_id)->get()->toArray();

        if (empty($chat)) {
            return false;
        } else {
            return json_decode(json_encode($chat[0]), true);
        }
    }

    public static function allChats($sort = "asc")
    {
        $chats = DB::table("chats", "c")->join("chat_messages", "c.chats_id", "=", "chat_messages.chats_id")->where("body", '!=', "")->orderByDesc("chat_messages.timestamp_message")->groupByRaw('chat_id')->limit(50)->get(['c.id as chat_id', 'c.*', 'chat_messages.*']);
        foreach ($chats as $k => $chat) {
            $chats[$k]->timestamp_message = date("Y-m-d H:i:s", $chat->timestamp_message / 1000);
        }

        return $chats;
    }

    public static function insert($chat)
    {
        return DB::table('chats')->insert($chat);
    }

    public static function updateFromChatId($chat_id, $values)
    {
        return DB::table('chats')->where('chats_id', '=', $chat_id)->update($values);
    }

    /**
     * Restituisce la chat con l'ultimo messaggio
     */
    public static function getChatsLastMessagge($sort = "asc")
    {
        $mx = [];
        $allChat = Chat::all('chats_id');
        foreach ($allChat as $chat) {
            $message = Message::findForChatsId($chat->chats_id, false, true);
            if ($message !== false) {
                $message->timestamp_message = date("Y-m-d H:i:s", $message->timestamp_message / 1000);
                $mx[] = $message;
            }
        }
        return $mx;
    }


    public static function getAllMessages($chat_id)
    {
        $mx = DB::table('chat_messages', 'cm')->join('chats', 'cm.chats_id', '=', 'chats.chats_id')->leftJoin("media_messages", 'media_messages.message_id', '=', 'cm.message_id')->where('chats.id', '=', $chat_id)->orderBy('cm.timestamp_message')->get(['cm.*', 'chats.updated_at', 'media_messages.name as nome_immagine']);

        foreach ($mx as $key => $m) {
            $mx[$key]->timestamp_message = date("Y-m-d H:i:s", $m->timestamp_message / 1000);
            $mx[$key]->stream = null;
            if ($mx[$key]->nome_immagine != null) {
                $mx[$key]->nome_immagine = $mx[$key]->nome_immagine;
                $mx[$key]->stream = base64_encode(Storage::disk('local2')->get($mx[$key]->nome_immagine));
            }
        }
        return $mx;
    }
}
