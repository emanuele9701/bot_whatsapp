<?php

use App\Models\Chat;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChatMessages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chat_messages', function (Blueprint $table) {
            $table->id();
            $table->string("chats_id");
            $table->string("message_id");
            $table->text("body");
            $table->integer("timestamp_message");
            $table->boolean("fromMe")->default(0);
            $table->boolean("hasMedia")->default(0);
            $table->tinyInteger("hasNewMex")->default(0);
            $table->index('chats_id','idChat');
            $table->foreign('chats_id')->references('chats_id')->on('chats');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat_messages');
    }
}
