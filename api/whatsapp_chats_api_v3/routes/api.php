<?php

use App\Http\Controllers\ChatMessagesController;
use App\Http\Controllers\ChatsController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\ReactionController;
use App\Http\Controllers\ResponseMessageController;
use App\Http\Middleware\LogActivity;
use App\Http\Middleware\LogRoute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


// Route::group(function () use ($router) {
Route::group(['prefix' => 'chats'], function () use ($router) {
    Route::middleware(LogActivity::class)->group(function () {
        Route::get("/ping", function () {
            return ["Ping ok"];
        })->middleware("log");
    });
    Route::post('checkChats', [ChatsController::class, 'checkChats']);
    Route::group(['prefix' => 'messages'], function () use ($router) {
        Route::post('insertNewMessage', [ChatMessagesController::class, 'insertNewMessage'])->name("insertNewMessage");
        Route::post('insertMultiNewMessage', [ChatMessagesController::class, 'insertMultiNewMessage'])->name("insertMultiNewMessage");
        Route::post('responseMessage', [ChatMessagesController::class, 'responseMessage'])->name("responseMessage");
        Route::get('getMessageImage', [ChatMessagesController::class, 'getMessageImage']);
        Route::get('all/{idChat}', [ChatMessagesController::class, 'all']);
        Route::post('saveMediaMessage', [ChatMessagesController::class, 'saveMessageImage']);
        Route::get("listMessages/{id_chat?}", [ChatMessagesController::class, 'listMessages'])->name("list_all_messages");
        Route::post("setRead",[ChatMessagesController::class, 'setReadMessage'])->name("set_read_message");
    });
    Route::get('search/{what?}', [ChatsController::class, 'search_chat'])->name('search_chat');
    Route::post('renameChats', [ChatsController::class, 'renameChats'])->name('rinomina_chat');
    Route::get("listChats", [ChatsController::class, 'listChats'])->name("list_all_chats");
    Route::get("allCountChat", [ChatsController::class, 'allCountChat'])->name("countAllChat");
    Route::post("updateChatsInfo", [ChatsController::class, 'updateChatsInfo'])->name("update_info_chats");
    Route::get("getChatsInfo/{chatId}/{limit?}/{onlyInfo?}", [ChatsController::class, 'getChatsInfo'])->name("getChatsInfo");
});
Route::group(['prefix' => "reactions"], function () use ($router) {
    Route::post("newReaction", [ReactionController::class, 'newReaction'])->name('new_reaction');
});
Route::group(['prefix' => "response"], function () use ($router) {
    Route::get("getListMessages", [ResponseMessageController::class, 'getListMessages'])->name('list_messages_to_send');
    Route::post("setSended", [ResponseMessageController::class, 'setSended'])->name('flag_sended_mex');
});
Route::group(['prefix' => "media"], function () use ($router) {
    Route::group(['prefix' => "audio"], function () use ($router) {
        Route::get("play/{idAudio}", [MediaController::class, 'playAudio'])->name('play_audio');
    });
});
// });
