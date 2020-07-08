<?php

namespace App\Http\Models;

class ProductCart extends ModelBase
{
    protected $table = 'product_carts';
    const UPDATED_AT = null;
	protected $fillable = ['product_id','cart_id','quantity'];
    protected $hidden = ['created_at'];

}