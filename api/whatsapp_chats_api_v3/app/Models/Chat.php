<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Chat extends Model
{
    protected $table = "chats";

    public static function findForChatsId($chat_id) {
        $chat = DB::table('chats')->where('chats_id','=',$chat_id)->get()->toArray();

        if(empty($chat)) {
            return false;
        } else {
            return json_decode(json_encode($chat[0]),true);
        }
    }

    public static function insert($chat) {
        return DB::table('chats')->insert($chat);
    }

    public static function updateFromChatId($chat_id,$values) {
        return DB::table('chats')->where('chats_id','=',$chat_id)->update($values);
    }

    /**
     * Restituisce la chat con l'ultimo messaggio
     */
    public static function getChatsLastMessagge() {
        $mx = DB::table('chats','c')->join('chat_messages','chat_messages.chats_id','=','c.chats_id')->orderBy('c.updated_at','desc')->orderBy('chat_messages.id','desc')->get(['c.name','body','c.chats_id','c.id','c.updated_at','timestamp_message']);
        return $mx;
    }
}
