<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnTypeMediaMessage extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('media_messages', function (Blueprint $table) {
            $table->enum("type",['image','audio','video'])->default('image')->nullable(false);
        });
    }
}
