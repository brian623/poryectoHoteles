<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InfoHabs extends Model
{
    use HasFactory;
    protected $fillable = ['id_hotel','cantidad','tipoHab','acomodacion'];
}
