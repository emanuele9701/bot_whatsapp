<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ContactsListTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('list', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nome_lista');
            $table->string('to_send');
            $table->timestamp('data_send')->nullable(true);
            $table->timestamp('data_sended')->nullable(true);
            $table->timestamps();
        });
        
        Schema::create('contacts_list', function (Blueprint $table) {
            $table->increments('id');
            $table->string('contatto_numero');
            $table->string('contatto_nome');
            $table->timestamp('data_send')->nullable(true);
            $table->timestamp('data_sended')->nullable(true);
            $table->timestamps();
            $table->unsignedInteger('id_lista');
            $table->foreign('id_lista')->references('id')->on('list');
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
