<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class LinkRefReactionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('reactions', function (Blueprint $table) {
            $table->index('message_id');
            $table->foreign('message_id')->references('message_id')->on('chat_messages');
        });
    }
}
