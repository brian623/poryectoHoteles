<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\SaveHotelsRequest;
use App\Models\infoHotels;

class InfoHotelsController extends Controller
{

    public function index()
    {
        $infoHotels =  infoHotels::all();
        return $infoHotels;
    }

    public function store(SaveHotelsRequest $request)
    {
        $hotelNew = new infoHotels();
        $hotelNew->nombre = $request->nombre;
        $hotelNew->cuidad = $request->cuidad;
        $hotelNew->direccion = $request->direccion;
        $hotelNew->nit = $request->nit;
        $hotelNew->numHabitaciones = $request->numHabitaciones;

        $hotelNew->save();
        return $hotelNew;
    }

    public function show($id)
    {
        $hotel = infoHotels::find($id);
        return $hotel;
    }

    public function update(Request $request, $id)
    {
        $hotelUpdate = infoHotels::findOrFail($id);
        $hotelUpdate->nombre = $request->nombre;
        $hotelUpdate->cuidad = $request->cuidad;
        $hotelUpdate->direccion = $request->direccion;
        $hotelUpdate->nit = $request->nit;
        $hotelUpdate->numHabitaciones = $request->numHabitaciones;

        $hotelUpdate->save();
        return $hotelUpdate;
    }

    public function destroy($id)
    {
        $hotelDelete = infoHotels::destroy($id);
        return $hotelDelete;
    }
}
