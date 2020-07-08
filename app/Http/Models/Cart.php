<?php

namespace App\Http\Models;

class Cart extends ModelBase
{
	protected $table = 'carts';
	protected $fillable = ['id'];
	protected $hidden = ['created_at', 'updated_at', 'status'];

}