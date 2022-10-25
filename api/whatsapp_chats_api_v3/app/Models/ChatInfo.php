<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ChatInfo extends Model
{
    use HasFactory;


    protected $table = "chatinfo";

    public static function findByChatId($chatId) {
        return DB::table('chatinfo','cInfo')->where('chat_id','=',$chatId);
    }
}
