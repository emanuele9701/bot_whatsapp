<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use Illuminate\Http\Request;

class ChatsController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    public function checkChats(Request $request)
    {
        $chats = json_decode(base64_decode($request->input('chats')), true);
        $return = [];
        foreach ($chats as $chat) {
            $myChat = Chat::findForChatsId($chat['chats_id']);
            // var_dump($myChat);die;
            if (!$myChat) {
                $idChat = Chat::insert($chat);
                $return[] = ['chat' => $chat['chats_id'], 'idChatDb' => $idChat];
            } else {
                $return[] = ['chat' => $chat['chats_id']];
            }
        }

        return $return;
    }
}
