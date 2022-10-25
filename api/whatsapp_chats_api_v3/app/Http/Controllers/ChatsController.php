<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use App\Models\ChatInfo;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;

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
    public function allCountChat()
    {
        $chat = Chat::allCountChat();

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
                $chat['timestamp_chat'] = date("Y-m-d H:i:s",$chat['timestamp_chat']/1000);
                $idChat = Chat::insert($chat);
                $return[] = ['chat' => $chat['chats_id'], 'idChatDb' => $idChat];
            } else {
                $return[] = ['chat' => $chat['chats_id']];
            }
        }

        return $return;
    }

    public function getChatsInfo($chatId)
    {
        $return = [];
        $infoChat = DB::table('chats')->leftJoin('chatinfo', 'chats.id', '=', 'chatinfo.chat_id')->where('chats.id', '=', $chatId)->get(['chats.name as name_chat','chatinfo.name as name_info', 'chats.updated_at as lastUpdate', 'numero_formattato', 'url_image','chats.id as idChat'])->toArray();
        

        $allMexForChat = DB::table('chats')->join('chat_messages', 'chats.chats_id', '=', 'chat_messages.chats_id')->where('body', '!=', "")->where('chats.id', '=', $chatId)->get(['body', 'fromMe'])->toArray();

        if (!empty($infoChat)) {
            $return = [
                // 'name' => $infoChat[0]->name,
                'lastUpdate' => $infoChat[0]->lastUpdate,
                'numero_formattato' => $infoChat[0]->numero_formattato,
                'url_image' => $infoChat[0]->url_image,
                'chat_id' => $infoChat[0]->idChat
            ];
            if($infoChat[0]->name_info == null) {
                $return['name'] = $infoChat[0]->name_chat;
            } else {
                $return['name'] = $infoChat[0]->name_info;
            }
        }

        if (!empty($allMexForChat)) {
            $return['listMex'] = $allMexForChat;
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
            if ($existChat) {
                $existInfo = ChatInfo::findByChatId($existChat['id']);
            } else {
                $existInfo = -1;
            }

            if ($existChat && empty($existInfo)) {
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
            } else {
                $return[] = ['error' => true, 'chat_id' => $info_chat['chat_id']];
            }
        }
        return $return;
    }
}
