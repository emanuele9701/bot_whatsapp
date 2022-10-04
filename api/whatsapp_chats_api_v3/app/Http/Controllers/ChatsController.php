<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class ChatsController extends BaseController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    public function search_chat($what = "")
    {
        $chats = Chat::whereLike($what);

        return $chats;
    }

    public function renameChats(Request $request)
    {
        $chatsJson = $request->input('chat');

        $chats = json_decode($chatsJson, true);
        foreach ($chats as $chat) {
            Chat::where('chats_id', $chat['id_chat'])->update(['name' => $chat['new_name']]);
        }
        return ['result' => 'ok'];
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
