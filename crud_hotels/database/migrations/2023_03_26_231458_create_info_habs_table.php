<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('info_habs', function (Blueprint $table) {
            $table->id();
            $table->integer('id_hotel')->required();
            $table->integer('cantidad')->required();
            $table->string('tipoHab')->required();
            $table->string('acomodacion')->required();
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
        Schema::dropIfExists('info_habs');
    }
};
