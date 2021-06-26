<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Models\User; 
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Log;
use App\Models\Dto;

use Validator;

class UserController extends Controller 
{
    public $successStatus = 200;
/** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(Request $request){ 
        //View request data on storage/logs/laravel.log
        //Log::debug($request);
        $login = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        if( !Auth::attempt( $login ) ){
            return response(['message' => 'Invalid login credentials.'], 401);
        }

        $accessToken = Auth::user()->createToken('authToken')->accessToken;

        return response(['user' => Auth::user(), 'access_token' => $accessToken]);
    }
/** 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(Request $request) 
    { 
        $validator = Validator::make($request->all(), [ 
            'name' => 'required', 
            'email' => 'required|email', 
            'password' => 'required', 
            'c_password' => 'required|same:password', 
        ]);

        if ($validator->fails()) { 
                    return response()->json(['error'=>$validator->errors()], 401);            
                }
            $input = $request->all(); 
                    $input['password'] = bcrypt($input['password']); 
                    $user = User::create($input); 
                    $success['token'] =  $user->createToken('MyApp')-> accessToken; 
                    $success['name'] =  $user->name;
            return response()->json(['success'=>$success], $this-> successStatus); 
    }
/** 
     * details api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function details() 
    {         
        $user = Auth::user(); 
        $dto = new Dto();
        $dto->name = $user->name;
        $dto->image =  '/storage/' . $user->avatar;
        $dto->image = str_replace("\\", "/",$dto->image);
        $dto->location = $user->location;
        $dishes = array();
        foreach($user->dishes as $dish){
            $dishDto = new Dto();
            $dishDto->id = $dish->id;
            $dishDto->image =  '/storage/' . $dish->image;
            $dishDto->image = str_replace("\\", "/",$dishDto->image);
            array_push($dishes, $dishDto);
        }
        $dto->dishes = $dishes;

        return response()->json($dto, $this-> successStatus); 
    } 
}


