<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DishApiController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Api\ProductApiController;
use App\Http\Controllers\Api\CompanyApiController;
use App\Http\Controllers\Api\ReportApiController;
use App\Http\Controllers\Api\EstablishmentApiController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


/* Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
}); */

//Dishes
Route::get('/dishes', [DishApiController::Class, 'index']);
Route::post('/image',[DishApiController::Class, 'image']);
Route::get('/dish/{id}',[DishApiController::Class, 'show']);
Route::get('/dish/comments/{id}',[DishApiController::Class, 'getComments']);

//Products
Route::get('/products', [ProductApiController::Class, 'index']);
Route::get('/product/{id}',[ProductApiController::Class, 'show']);
Route::get('/products/scan', [ProductApiController::Class, 'scan']);

//Companies
Route::get('/companies', [CompanyApiController::Class, 'index']);
Route::get('/companies/list', [CompanyApiController::Class, 'list']);
Route::get('/company',[CompanyApiController::Class, 'show']);

//Establishments
Route::get('/establishments', [EstablishmentApiController::Class, 'index']);
Route::get('/establishment',[EstablishmentApiController::Class, 'show']);

//SignIn and LogIn
Route::post('login', [UserController::Class, 'login']);
Route::post('register',[UserController::Class, 'register']);

Route::group(['middleware' => 'auth:api'], function(){
Route::get('details', [UserController::Class, 'details']);
Route::post('dish/comment', [DishApiController::Class, 'makeComment']);
Route::post('report/product', [ReportApiController::Class, 'productReport']);
Route::post('report/company', [ReportApiController::Class, 'companyReport']);
Route::post('report/establishment', [ReportApiController::Class, 'establishmentReport']);
Route::post('/establishment/rate',[EstablishmentApiController::Class, 'rate']);
Route::post('/dish/rate',[DishApiController::Class, 'rate']);
Route::post('products', [ProductApiController::Class, 'create']);
Route::post('dishes', [DishApiController::Class, 'create']);



});