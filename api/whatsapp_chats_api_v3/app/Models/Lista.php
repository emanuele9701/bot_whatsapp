<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lista extends Model
{
    use HasFactory;

    protected $table = 'list';

    protected $fillable = [
        'nome_lista'
    ];

    public function contatti()
    {
        return $this->hasMany(ListaContatti::class, 'id_lista');
    }
}
