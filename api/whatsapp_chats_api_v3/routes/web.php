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

$router->get('/', function () use ($router) {
    // Recupero le chat
    $chat = Chat::getChatsLastMessagge();
    return view('home',[
        'messageList' => $chat
    ]);
});

