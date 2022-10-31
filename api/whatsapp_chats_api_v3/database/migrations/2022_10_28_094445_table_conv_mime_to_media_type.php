<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TableConvMimeToMediaType extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('conv_media_type', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->string('mime');
            $table->enum("type",['image','audio','video'])->default('image')->nullable(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('media_type', function (Blueprint $table) {});
    }
}
