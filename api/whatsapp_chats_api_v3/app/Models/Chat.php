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

    public static function allChats($with = false, $sort = "asc")
    {

        $chats_ids = DB::table('chats', 'c')->join('chat_messages', 'c.chats_id', '=', 'chat_messages.chats_id')->where("body", '!=', "")->groupBy('c.chats_id')->orderByDesc('c.updated_at')->limit(100)->get(['c.id as chat_id', 'c.name', 'c.chats_id']);

        foreach ($chats_ids as $k => $chat) {
            $lastMessage = Chat::getChatsLastMessaggeByChatId($chat->chats_id);
            $chats_ids[$k]->timestamp_message = $lastMessage[0]->timestamp_message;
            $chats_ids[$k]->body = $lastMessage[0]->body;
            $chats_ids[$k]->hasNewMex = $lastMessage[0]->hasNewMex;
        }

        return $chats_ids;
    }

    public static function whereLike($what)
    {
        $chats = DB::table('chats', 'c')->join('chat_messages', 'c.chats_id', '=', 'chat_messages.chats_id')->where("body", '!=', "")->where('c.name', 'like', "%$what%")->groupBy('c.chats_id')->orderByDesc('c.updated_at')->limit(100)->get(['c.id as chat_id', 'c.name', 'c.chats_id']);
        foreach ($chats as $k => $chat) {
            $lastMessage = Chat::getChatsLastMessaggeByChatId($chat->chats_id);
            $chats[$k]->timestamp_message = $lastMessage[0]->timestamp_message;
            $chats[$k]->body = $lastMessage[0]->body;
            $chats[$k]->hasNewMex = $lastMessage[0]->hasNewMex;
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


    /**
     * Restituisce la chat con l'ultimo messaggio
     */
    public static function getChatsLastMessaggeByChatId($chatId, $sort = "asc")
    {
        $mx = [];
        $message = Message::findForChatsId($chatId, false, true);
        if ($message !== false) {
            $message->timestamp_message = date("Y-m-d H:i:s", $message->timestamp_message / 1000);
            $mx[] = $message;
        }
        return $mx;
    }

    public static function getAllMessages($chat_id)
    {

        $mx = DB::table('chat_messages', 'cm')->join('chats', 'cm.chats_id', '=', 'chats.chats_id')->leftJoin("media_messages", 'media_messages.id', '=', 'cm.mediaFile')->where("body", "!=", "")->where('chats.id', '=', $chat_id)->orderBy('cm.timestamp_message')->get(['cm.*', 'chats.updated_at', 'media_messages.name as nome_immagine']);

        foreach ($mx as $key => $m) {
            $mx[$key]->timestamp_message = date("Y-m-d H:i:s", $m->timestamp_message / 1000);
            $mx[$key]->stream = null;
            if ($mx[$key]->nome_immagine != null) {
                $mx[$key]->nome_immagine = $mx[$key]->nome_immagine;
                $mx[$key]->stream = base64_encode(Storage::disk('local2')->get($mx[$key]->nome_immagine));
            }
            
            Message::where("id", $m->id)->update(['hasNewMex' => 0]);
        }

        return $mx;
    }
}
