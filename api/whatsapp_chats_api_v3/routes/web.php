<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use App\Events\NewMessage;
use App\Http\Controllers\ChatsController;
use App\Models\Chat;
use App\Models\Message;
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
        $chat = Chat::allChats();
        // echo "<pre>";
        // var_dump($chat);die;
        return view('home2');
    })->name('home');
});

Route::prefix('test')->group(function () {
    Route::get('pusher', function () {
        event(new NewMessage(1));
        return "Event has been sent!";
    });
    Route::get('chatLastMex/{id}', function ($id) {
        echo "<pre>";
        var_dump(Chat::getChatsLastMessaggeByChatId($id));
        die;
    });
});

Route::get('/', function () {
    return redirect('home');
});
