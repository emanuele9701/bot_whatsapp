<?php

use App\Http\Controllers\ChatMessagesController;
use App\Http\Controllers\ChatsController;
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


Route::middleware([LogRoute::class])->group(function () use ($router) {
    Route::group(['prefix' => 'chats'], function () use ($router) {
        Route::get("/ping", function () use ($router) {
            return ["Ping ok"];
        });
        Route::post('checkChats', [ChatsController::class, 'checkChats']);
        Route::group(['prefix' => 'messages'], function () use ($router) {
            Route::post('insertNewMessage', [ChatMessagesController::class, 'insertNewMessage'])->name("insertNewMessage");
            Route::post('insertMultiNewMessage', [ChatMessagesController::class, 'insertMultiNewMessage'])->name("insertMultiNewMessage");
            Route::post('responseMessage', [ChatMessagesController::class, 'responseMessage'])->name("responseMessage");
            Route::get('getMessageImage', [ChatMessagesController::class, 'getMessageImage']);
            Route::get('all/{idChat}', [ChatMessagesController::class, 'all']);
            Route::post('saveImageMessage', [ChatMessagesController::class, 'saveMessageImage']);
            Route::get("listMessages/{id_chat?}",[ChatMessagesController::class, 'listMessages'])->name("list_all_messages");
        });
        Route::get('search/{what?}',[ChatsController::class,'search_chat'])->name('search_chat');
        Route::post('renameChats',[ChatsController::class,'renameChats'])->name('rinomina_chat');
        Route::get("listChats",[ChatsController::class, 'listChats'])->name("list_all_chats");
    });
});
