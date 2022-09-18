<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use App\Http\Controllers\ChatsController;
use App\Models\Chat;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

Route::prefix('home')->group(function () {
    Route::get('/', function () {
        $chat = Chat::getChatsLastMessagge();
        return view('home', [
            'messageList' => $chat
        ]);
    })->name('home');

    Route::get('/{chat_id}', function ($chat_id) {
        // Recupero le chat
        $search_chat = Chat::getChatsLastMessagge($chat_id);
        $chat = Chat::getChatsLastMessagge();
        return view('home', [
            'messageList' => $chat,
            'messages' => $search_chat
        ]);
    })->name('show_chat');
});


Route::get('/', function () {
    redirect('home');
});