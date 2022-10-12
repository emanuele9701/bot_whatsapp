<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ProfilePhoto extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ChatInfo', function (Blueprint $schema) {
            $schema->increments('id');
            $schema->string('contatto_id')->unique();
            $schema->string('numero');
            $schema->string('numero_formattato');
            $schema->string('name');
            $schema->string('short_name');
            $schema->string('public_name');
            $schema->boolean('isGroup');
            $schema->boolean('isBlocked');
            $schema->boolean('haveWhatsApp');
            $schema->string('url_image');
            $schema->index(['contatto_id', 'chat_id']);
            $schema->foreignId('chat_id')->references('id')->on('chats');
            $schema->timestamps();
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
    }
}
