<?php

namespace App\Http\Controllers;

use App\Models\Chat;
use App\Models\ChatInfo;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

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
                $chat['timestamp_chat'] = date("Y-m-d H:i:s", $chat['timestamp_chat'] / 1000);
                $idChat = Chat::insert($chat);
                $return[] = ['chat' => $chat['chats_id'], 'idChatDb' => $idChat];
            } else {
                $return[] = ['chat' => $chat['chats_id']];
            }
        }

        return $return;
    }

    public function getChatsInfo($chatId,$limit = 35,$onlyInfo = false)
    {
        $return = [];
        $infoChat = DB::table('chats')->leftJoin('chatinfo', 'chats.id', '=', 'chatinfo.chat_id')->where('chats.id', '=', $chatId)->get(['chats.name as name_chat', 'chatinfo.name as name_info', 'chats.updated_at as lastUpdate', 'numero_formattato', 'url_image', 'chats.id as idChat','chatinfo.haveWhatsApp','chatinfo.isBlocked'])->toArray();

        if($onlyInfo == false) {

            $allMexForChat = DB::table('chats')->join('chat_messages', 'chats.chats_id', '=', 'chat_messages.chats_id')->leftJoin("media_messages", 'media_messages.id', '=', 'chat_messages.mediaFile')->where('chats.id', '=', $chatId)->get(['body', 'fromMe', 'mediaFile','media_messages.name as nome_immagine','media_messages.type','chat_messages.timestamp_message'])->toArray();
            
        }

        if (!empty($infoChat)) {
            $return = [
                // 'name' => $infoChat[0]->name,
                'lastUpdate' => $infoChat[0]->lastUpdate,
                'numero_formattato' => $infoChat[0]->numero_formattato,
                'url_image' => $infoChat[0]->url_image,
                'haveWhatsApp' => $infoChat[0]->haveWhatsApp,
                'isBlocked' => $infoChat[0]->isBlocked,
                'chat_id' => $infoChat[0]->idChat
            ];
            if ($infoChat[0]->name_info == null) {
                $return['name'] = $infoChat[0]->name_chat;
            } else {
                $return['name'] = $infoChat[0]->name_info;
            }
        }

        if (!empty($allMexForChat) && $onlyInfo == false) {
            $messaggi = [];
            foreach ($allMexForChat as $key => $mex) {
                $messaggio = [];
                if(strlen($mex->body) == 0 && $mex->mediaFile == 0) {
                    continue;
                }
                $messaggio['body'] = $mex->body;
                $messaggio['fromMe'] = $mex->fromMe;
                $messaggio['mediaFile'] = $mex->mediaFile;
                $messaggio['timestamp_message'] = $mex->timestamp_message;
                $messaggio['mittente'] = $return['name'];
                $media = null;
                if (is_numeric($mex->mediaFile) && $mex->mediaFile > 0) {                    
                    $media['nome_immagine'] = $allMexForChat[$key]->nome_immagine;
                    if($allMexForChat[$key]->type == "audio") {
                        $media['stream'] = base64_encode(Storage::disk('local2')->get($allMexForChat[$key]->nome_immagine));
                    } else {
                        $media['stream'] = base64_encode(Storage::disk('local2')->get($allMexForChat[$key]->nome_immagine));
                    }
                    $media['tipo'] = $allMexForChat[$key]->type;
                }
                $messaggio['media'] = $media;
                $messaggi[] = $messaggio;
            }
            $return['listMex'] = $messaggi;
            $return['listMex'] = array_chunk($return['listMex'],$limit);
            $return['listMex'] = $return['listMex'][count($return['listMex']) - 1];
        }
        return $return;
    }

    public function updateChatsInfo(Request $request)
    {
        $chats = json_decode(base64_decode($request->input('info_chats')), true);
        
        $return = [];
        foreach ($chats as $info_chat) {
            // echo "Chat Id: " . $info_chat['chat_id'] . " ->";
            $existChat = Chat::findForChatsId($info_chat['chat_id']);
            if ($existChat) {
                $existInfo = ChatInfo::findByChatId($existChat['id']);
            } else {
                $existInfo = -1;
            }
            
            if (!empty($existChat) && $existInfo->count() == 0) {
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
