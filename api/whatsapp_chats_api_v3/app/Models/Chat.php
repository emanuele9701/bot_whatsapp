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

        $chats = DB::table('chats')->join('chat_messages','chats.chats_id','=','chat_messages.chats_id')->leftJoin('chatinfo','chats.id','=','chatinfo.chat_id')->where('chats.isGroup','=',0)->where('body', '!=','')->orderByDesc('chat_messages.timestamp_message')->limit(100)->distinct()->get(['chats.chats_id', 'chats.id','body','chats.name','chatinfo.url_image']);
        // dd(DB::getQueryLog()[0]['query']);
        // die;
        $chats_ids = [];
        $processate = [];
        foreach ($chats as $k => $chat) {
            if(in_array($chat->chats_id,$processate)) {
                continue;
            }
            $processate[] = $chat->chats_id;
            $lastMessage = Chat::getChatsLastMessaggeByChatId($chat->chats_id);
            // $chats_ids[$k]['raw_time'] = $lastMessage[0]->raw_time;
            $chats_ids[$k]['timestamp_message'] = $lastMessage[0]->timestamp_message;
            $chats_ids[$k]['body'] = $lastMessage[0]->body;
            $chats_ids[$k]['hasNewMex'] = $lastMessage[0]->hasNewMex;
            $chats_ids[$k]['id'] = $chat->id;
            $chats_ids[$k]['chat_id'] = $chat->id;
            $chats_ids[$k]['name'] = $chat->name;
            $chats_ids[$k]['url_image'] = $chat->url_image;

        }

        // Ordino le chat in modo crescente dall'ultimo messaggio
        // $maxLength = sizeof($chats_ids);
        // for ($i = 0; $i < $maxLength; $i++) {
        //     for ($j = 1; $j < $maxLength; $j++) {
        //         if ($chats_ids[$i]['raw_time'] > $chats_ids[$j]['raw_time']) {
        //             $tmp = $chats_ids[$i];
        //             $chats_ids[$i] = $chats_ids[$j];
        //             $chats_ids[$j] = $tmp;
        //         }
        //     }
        // }



        return array_chunk($chats_ids, 50)[0];
    }

    public static function whereLike($what)
    {
        $chats = DB::table('chats')->join('chat_messages','chats.chats_id','=','chat_messages.chats_id')->where('isGroup','=',0)->where('body', '!=','')->where('c.name', 'like', "%$what%")->orderByDesc('chat_messages.timestamp_message')->limit(100)->distinct()->get(['chats.chats_id', 'chats.id','body','chats.name']);
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
            $message->raw_time = $message->timestamp_message;
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
