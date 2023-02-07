<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ListaContatti extends Model
{
    use HasFactory;

    protected $table = 'contacts_list';

    protected $fillable = [
        'contatto_numero',
        'contatto_nome',
    ];

    public function lista()
    {
        return $this->belongsTo(Lista::class, 'id_lista');
    }
}
