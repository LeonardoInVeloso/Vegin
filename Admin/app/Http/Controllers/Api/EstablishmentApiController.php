<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use App\Exceptions\Handler;
use App\Models\Establishment;
use App\Models\Location;
use App\Models\Dto;
use App\Models\EstablishmentRating;


class EstablishmentApiController extends Controller
{
    public function index(Request $request)
    {
        $data = Location::get();
        $establishments = array();
        foreach($data as $location){
            if($location->establishment->status == 2){
                $Dto = new Dto();
                $Dto->id = $location->establishment->id;
                $Dto->name = $location->establishment->name;            
                $Dto->image = '/storage/' . $location->establishment->image;
                $Dto->image = str_replace("\\", "/",$Dto->image);
                $Dto->dishes = $location->establishment->dishes->count();
                $Dto->location = $location->id;
                $Dto->coordinates = $location->getCoordinates()[0];
                array_push($establishments,$Dto);
            }
        }
        return response()->json($establishments,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function show(Request $request)
    {
        $establishment = Establishment::find($request->id);
        if($establishment == null){
            return response()->noContent();
        }
        $Dto = new Dto();
        $Dto->id = $establishment->id;
        $Dto->name = $establishment->name;            
        $Dto->image = '/storage/' . $establishment->image;
        $Dto->image = str_replace("\\", "/",$Dto->image);
        $Dto->type = $establishment->type; 
        $Dto->notes = $establishment->notes; 
        $Dto->rating = $establishment->rating; 
        $Dto->lastUpdate = $establishment->updated_at->toDateString(); 
        $dishes = $establishment->dishes->all();
        $dtoDishes = array();
        foreach($dishes as $dish){
            $dishDto = new Dto();
            $dishDto->id = $dish->id;
            $dishDto->image = '/storage/' . $dish->image;
            $dishDto->image = str_replace("\\", "/",$dishDto->image);
            array_push($dtoDishes,$dishDto);
        }
        $Dto->dishes = $dtoDishes;
        $Dto->coordinates = Location::find($request->location)->getCoordinates()[0];
        return response()->json($Dto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function rate(Request $request)
    {        
        //Log::debug($request);
        try{
            $user = Auth::user(); 
            EstablishmentRating::where('user_id', $user->id)->where('establishment_id', $request->establishment_id)->delete();            
            EstablishmentRating::create(
                ['user_id' => $user->id, 
                'establishment_id' => $request->establishment_id,
                'value' => $request->value]
            );
            //Update Establishment Rating
            $count = EstablishmentRating::where('establishment_id', $request->establishment_id)->count();
            $ratings = EstablishmentRating::where('establishment_id', $request->establishment_id)->get();
            $sum = 0;
            foreach($ratings as $rate){
                $sum += $rate->value;
            }
            $newRating = $sum / $count;
            Establishment::find($request->establishment_id)->update(['rating' => $newRating]);
            return response()->noContent(201);            
        } catch (Exception $ex) { 
            return abort(500, 'Could not rate');
        }
    }

    public function create(Request $request)
    {
        try {
            //Log::debug($request);
             $user = Auth::user(); 
             
             $report = Establishment::create([
                 'name' => $request->name,
                 'status' => 0,
                 'notes' => $request->notes,
                 'type' => $request->type,
                 'image' => $request->image,
             ]);
             return response()->noContent(201);     
        }
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Create error');
        }
    }
    
}
