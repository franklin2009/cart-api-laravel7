<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//Route::middleware('auth:api')->get('/user', function (Request $request) {  return $request->user(); });

Route::group(['prefix' => 'v1'], function () {
    Route::get('/product', ['uses' => 'ProductController@all', 'as' => 'product.all']);
    Route::get('/cart/total', ['uses' => 'CartController@total', 'as' => 'cart.total']);
    Route::get('/cart/list-product', ['uses' => 'CartController@listProduct', 'as' => 'cart.listproduct']);
    Route::post('/cart/add-product', ['uses' => 'CartController@addProduct', 'as' => 'cart.addproduct']); //post
    Route::put('/cart/update-product', ['uses' => 'CartController@updateProduct', 'as' => 'cart.updateproduct']); //put
    Route::delete('/cart/delete-product/{product}', ['uses' => 'CartController@deleteProduct', 'as' => 'cart.deleteproduct']); //delete
    Route::post('/cart/chechout', ['uses' => 'CartController@chechout', 'as' => 'cart.chechout']); //post
});

