<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\InfoHotelsController;
use App\Http\Controllers\Api\InfoHabsController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::controller(InfoHotelsController::class)->group(function () {
    Route::get('/infoHotels', 'index');
    Route::post('/hotelNew', 'store');
    Route::get('/hotel/{id}', 'show');
    Route::put('/hotelUpdate/{id}', 'update');
    Route::delete('/hotelDelete/{id}', 'destroy');
});

Route::controller(InfoHabsController::class)->group(function () {
    Route::get('/infoHabs', 'index');
    Route::post('/habNew', 'store');
    Route::get('/hotelHabs/{id_hotel}', 'show');
    Route::put('/habsUpdate/{id}/', 'update');
});
