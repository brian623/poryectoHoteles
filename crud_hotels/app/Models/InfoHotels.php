<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InfoHotels extends Model
{
    use HasFactory;
    protected $fillable = ['nombre','cuidad','dirección','nit','numHabitaciones'];
}
