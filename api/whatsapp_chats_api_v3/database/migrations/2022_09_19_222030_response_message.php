<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ResponseMessage extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('response_message', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('chat_id');
            $table->string("text_message");
            $table->integer("flag_sended")->default(0);
            $table->integer("chat_messages_id")->default(NULL)->nullable()->comment("Valorizzato solo se c'è una risposta salvata");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('response_message');
    }
}
