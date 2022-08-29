<?php

/** @var \Laravel\Lumen\Routing\Router $router */

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
    return $router->app->version();
});

$router->get("/ping", function () use ($router) {
    return "Ping ok";
});

$router->group(['prefix' => 'chats'], function () use ($router) {
    $router->post('checkChats', 'ChatsController@checkChats');
    $router->group(['prefix' => 'messages'], function () use ($router) {
        $router->post('insertNewMessage','ChatMessagesController@insertNewMessage');
        $router->get('getMessageImage','ChatMessagesController@getMessageImage');
    });
});
