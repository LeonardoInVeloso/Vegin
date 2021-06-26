<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth; 
use App\Models\Product;
use App\Models\Dto\ProductLessDto;
use App\Models\Dto;


class ProductApiController extends Controller
{
    public function index(Request $request)
    {
        if($request->name != '' && $request->name != null){
            $products = Product::where('status', 2)->where('name', 'LIKE', '%'.$request->name.'%')->get();
        }else{
            $products = Product::where('status', 2)->take(20)->get();
        }
        $productsDto = array();
        foreach($products as $product){

            $dto = new ProductLessDto();
            $dto->id = $product->id;
            $dto->name = $product->name;            
            $dto->image = '/storage/' . $product->image;
            $dto->image = str_replace("\\", "/",$dto->image);
            $dto->notes = $product->notes;         
            $dto->companyName = $product->company->name;

            array_push($productsDto,$dto);
        }
        return response()->json($productsDto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function show($id)
    {
        $product = Product::find($id);
        if($product == null){
            return response()->noContent();
        } else {    
            $dto = new ProductLessDto();
            $dto->id = $product->id;
            $dto->name = $product->name;            
            $dto->image = '/storage/' . $product->image;
            $dto->image = str_replace("\\", "/",$dto->image);
            $dto->notes = $product->notes;
            $dto->animal_ing = $product->animal_ing;
            $dto->animal_event = $product->company->animal_event;
            $dto->animal_tests = $product->company->animal_tests;
            $dto->companyName = $product->company->name; 
            $dto->lastUpdate = $product->updated_at->toDateString(); 

        return response()->json($dto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
        }
    }
    public function scan(Request $request)
    {
        try {
            //Log::debug($request);
            $product = Product::where('barcode_id', $request->barcode_id)->where('barcode_format', $request->barcode_format)->where('status', 2)->first();
            if($product == null){
                $dto = new Dto();
                $dto->id = 0;                
                return response()->json($dto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
            } else {   
                $dto = new Dto();
                $dto->id = $product->id;

            return response()->json($dto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
            }
        }
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Scan error');
        }
    }
    public function create(Request $request)
    {
        try {
            //Log::debug($request);
             $user = Auth::user(); 
             $imagePath = 'products/June2021/clubsocial.png';
            //  if($request->hasFile('image') && $request->image->isValid()){
            //     $imagePath = $request->image->store('public/storage/uploaded');
            //  }
             $report = Product::create([
                 'name' => $request->name,
                 'user_id' => $user->id,
                 'company_id' => $request->company_id,
                 'status' => 0,
                 'notes' => $request->notes,
                 'animal_ing' => $request->animal_ing,
                 'barcode_id' => $request->barcode_id,
                 'barcode_format' => $request->barcode_format,
                 'image' => $imagePath,

             ]);
             return response()->noContent(201);     
        }
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Create error');
        }
    }
}
