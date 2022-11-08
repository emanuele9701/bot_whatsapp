<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTablesReactions extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reactions', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->string("reaction_id")->nullable(false);
            $table->string("message_id")->nullable(false);
            $table->string("reaction");
            $table->dateTime("reaction_time");
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
        Schema::dropIfExists('reactions');
    }
}
