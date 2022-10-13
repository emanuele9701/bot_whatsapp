<?php

namespace App\Http\Controllers;

use App\Events\NewMessage;
use App\Http\Controllers\Controller;
use App\Models\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ResponseMessageController extends Controller
{
    //

    public function __construct()
    {
    }

    public function getListMessages()
    {
        return Response::getResponseMessages();
    }

    public function setSended(Request $r)
    {
        $idMex = $r->input('response_message_id');
        $idMexSaved = $r->input('messagedSavedId');
        $idMessaggio = DB::table("chat_messages")->where("message_id", '=', $idMexSaved)->get(['id'])->toArray();
        if (!empty($idMessaggio)) {
            $idMexSaved = $idMessaggio[0]->id;
        }
        $esitoUpd = Response::where("id", $idMex)->update(['flag_sended' => 1, 'chat_messages_id' => $idMexSaved]);
        event(new NewMessage(1));
        return ['esito' => $esitoUpd === 1 ? true : false];
    }
}
