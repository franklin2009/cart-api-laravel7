<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Models\Product;

class ProductController extends Controller
{
    public function all()
    {
        $products=Product::where('status','=','A')->get();
        return $products;
    }
}
