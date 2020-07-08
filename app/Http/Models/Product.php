<?php

namespace App\Http\Models;

class Product extends ModelBase
{
	protected $table = 'products';
	protected $fillable = ['id','sku','name','description', 'price'];
	protected $hidden = ['created_at', 'updated_at', 'status'];

}