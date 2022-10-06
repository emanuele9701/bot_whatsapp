<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Response extends Model
{
    use HasFactory;

    protected $table = "response_message";


    public static function getResponseMessages() {
        $messages = DB::table("response_message",'rp')->join("chats",'chats.id','=','rp.chat_id')->where("flag_sended",'=',0)->get(['chats.chats_id','chats.name','rp.*'])->toArray();

        return $messages;
    }
}
