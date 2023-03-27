<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\infoHabs;

class InfoHabsController extends Controller
{
    public function index()
    {
        $infoHabs =  infoHabs::all();
        return $infoHabs;
    }

    public function store(Request $request)
    {
        $habNew = new infoHabs;
        $habNew->id_hotel = $request->id_hotel;
        $habNew->cantidad = $request->cantidad;
        $habNew->tipoHab = $request->tipoHab;
        $habNew->acomodacion = $request->acomodacion;

        $habNew->save();
        return $habNew;
    }

    public function show(Request $request, $id_hotel)
    {
        $hotelHabs = infoHabs::where('id_hotel', $id_hotel)->get();
        return $hotelHabs;
    }

    public function update(Request $request, $id)
    {
        $habsUpdate = infoHabs::findOrFail($id);
        $habsUpdate->id_hotel = $request->id_hotel;
        $habsUpdate->cantidad = $request->cantidad;
        $habsUpdate->tipoHab = $request->tipoHab;
        $habsUpdate->acomodacion = $request->acomodacion;

        $habsUpdate->save();
        return $habsUpdate;
    }

}
