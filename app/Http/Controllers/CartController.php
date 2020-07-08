<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Models\Cart;
use App\Http\Models\ProductCart as PCart;

class CartController extends Controller
{
    public function all()
    {
        $carts=Cart::all();
        return $carts;
    }

    public function total()
    {
        $total= \DB::table('product_carts')->join('carts', 'product_carts.cart_id', '=', 'carts.id')
        ->where('carts.status', '=', 'P')->sum('product_carts.quantity'); //->get();
        return $total;
    }

    public function listProduct()
    {
        $list=[];
        try {
                $cart=Cart::where('status', '=', 'P')->first();
                if($cart != null){ // cart  exist
                    $condition=[['product_carts.cart_id','=',$cart->id],['products.status','=','A']];
                    $list=\DB::table('product_carts')->join('products', 'product_carts.product_id', '=', 'products.id')
                    ->where($condition)->get();
                }
        } catch(\Exception $e) {
			$list=$e;
		}
        return $list;
    }

    public function addProduct(Request $request)
    {
        $product_id=$request->input("product");
        $isAdd=1;
        try {
                $cart=Cart::where('carts.status', '=', 'P')->first();
                if($cart == null){ // cart not  exist
                    $cart=new Cart;
                    $cart->status='P';
                    $cart->save();
                }
                $condition=[['cart_id','=',$cart->id],['product_id','=',$product_id]];
                $pCart=PCart::where($condition)->first();
                if($pCart == null){ // product_cart not  exist
                    $pCart=new PCart;
                    $pCart->cart_id=$cart->id;
                    $pCart->product_id=$product_id;
                    $pCart->quantity=1;
                    $pCart->save();
                } else { // product_cart exist
                    PCart::where($condition)->update(['quantity' => $pCart->quantity + 1]);
                }
        } catch(\Exception $e) {
			$isAdd=0;
		}
        return $isAdd;
    }


    public function updateProduct(Request $request)
    {
        $product_id=$request->input("product");
        $type=$request->input("type"); // A / R
        $isAdd=1;
        try {
                $cart=Cart::where('carts.status', '=', 'P')->first();
                if($cart == null){ // cart not  exist
                    $isAdd=0;
                } else {
                    $condition=[['cart_id','=',$cart->id],['product_id','=',$product_id]];
                    $pCart=PCart::where($condition)->first();
                    if($pCart == null){ // product_cart not  exist
                        $isAdd=0; 
                    } else { // product_cart exist
                        PCart::where($condition)->update(['quantity' => ($type=='A' ? $pCart->quantity + 1 : $pCart->quantity - 1)]);
                    }
                }
        } catch(\Exception $e) {
			$isAdd=0;
		}
        return $isAdd;
    }

    public function deleteProduct($product=0)
    {
        $isDel=1;
        try {
                $cart=Cart::where('carts.status', '=', 'P')->first();
                if($cart == null){ // cart not  exist
                    $isDel=0;
                } else {
                    $condition=[['cart_id','=',$cart->id],['product_id','=',$product]];
                    $pCart=PCart::where($condition)->first();
                    if($pCart == null){ // product_cart not  exist
                        $isDel=0; 
                    } else { // product_cart exist
                        PCart::where($condition)->delete();
                    }
                }
        } catch(\Exception $e) {
			$isDel=0;
		}
        return $isDel;
    }

    public function chechout(Request $request)
    {
        $data=$request->input("data");
        $isChechout=1;
        try {
                $cart=Cart::where('carts.status', '=', 'P')->first();
                if($cart == null){ // cart not  exist
                    $isChechout=0;
                } else {
                    Cart::where('id','=',$cart->id)->update(['status' => 'C']);
                }
        } catch(\Exception $e) {
			$isChechout=0;
		}
        return $isChechout;
    }

}
