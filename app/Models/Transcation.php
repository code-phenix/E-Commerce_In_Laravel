<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transcation extends Model
{
    use HasFactory;

    protected $table= "transcations";

    public function order(){
        return $this->belongsTo(Order::class);
    }
}
