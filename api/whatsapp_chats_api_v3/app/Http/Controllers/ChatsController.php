<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use App\Models\ChatInfo;
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

    public function listChats()
    {
        $chat = Chat::allChats();

        return $chat;
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

    public function updateChatsInfo(Request $request)
    {
        $chats = json_decode($request->input('info_chats'), true);

        $return = [];
        foreach ($chats as $info_chat) {
            // echo "Chat Id: " . $info_chat['chat_id'] . " ->";
            $existChat = Chat::findForChatsId($info_chat['chat_id']);
            $existInfo = ChatInfo::where("contatto_id", $info_chat['contatto_id'])->count();
            if ($existChat && !$existInfo) {
                $chat_info = new ChatInfo();
                $keys = array_keys($info_chat);
                for ($d = 0; $d < count($keys); $d++) {
                    if ($keys[$d] == "contatto_id") {
                        $chat_info->contatto_id = $info_chat['contatto_id']['_serialized'];
                    } else if ($keys[$d] == "chat_id") {
                        $chat_info->chat_id = $existChat['id'];
                    } else {
                        $chat_info->{$keys[$d]} = $info_chat[$keys[$d]];
                    }
                }
                $chat_info->save();
                $return[] = ['chat_id' => $chat_info['chat_id'], 'info_id' => $chat_info->id];
            }
        }
        return $return;
    }
}
