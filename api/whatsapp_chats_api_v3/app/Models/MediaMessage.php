<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class MediaMessage extends Model
{
    use HasFactory;

    protected $table = 'media_messages';

    public static function findFromMessageId($messageId) {
        return DB::table('media_messages')->where('message_id','=',$messageId)->get()->toArray();
    }
}

