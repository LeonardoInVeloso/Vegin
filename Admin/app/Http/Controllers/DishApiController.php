<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dish;
use App\Models\User;
use App\Models\Comment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth; 
use App\Models\ParsedDish;
use App\Models\ParsedDishInfo;
use App\Models\ParsedComment;
use App\Models\DishRating;

class DishApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $dishes = Dish::take(20)->get();
        $parsedDishs = array();
        foreach($dishes as $dish){

            $parsed = new ParsedDish();
            $parsed->id = $dish->id;
            $parsed->name = $dish->name;            
            $parsed->image = '/storage/' . $dish->image;
            $parsed->image = str_replace("\\", "/",$parsed->image);
            $parsed->description = $dish->description;
            $parsed->restaurant = $dish->establishment->name;
            $parsed->restaurantImg = 'storage/' . $dish->establishment->image;
            $parsed->restaurantImg = str_replace("\\", "/",$parsed->restaurantImg);
            $parsed->user = $dish->user->name;
            $parsed->userImg = '/storage/' . $dish->user->avatar;
            $parsed->userImg = str_replace("\\", "/",$parsed->userImg);
            $parsed->nComments = $dish->comments->Count();
            $parsed->rating = $dish->rating;

            array_push($parsedDishs,$parsed);
        }
        return response()->json($parsedDishs,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function image($request){

        $path = public_path().$request->filePath;

        return Response::download($path);   

    }

    public function getComments($id){

        $dish = Dish::find($id);
        $comments = array();
        foreach($dish->comments as $comment){
            $parsed = new ParsedComment();
            $user = User::Find($comment->user_id);
            $parsed->userName = $user->name;
            $parsed->userImg = '/storage/' . $user->avatar;
            $parsed->userImg = str_replace("\\", "/",$parsed->userImg);
            $parsed->content = $comment->content;
            $parsed->id = $comment->id;

            array_push($comments,$parsed);
        }
        return response()->json($comments,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function makeComment(Request $request){

        $user = Auth::user(); 
        $comment = Comment::create([
            'content' => $request->content,
            'user_id' => $user->id,
            'dish_id' => $request->dish_id,
        ]); 
        $parsedComment = new ParsedComment();    
        $parsedComment->userName = $user->name;
        $parsedComment->userImg = '/storage/' . $user->avatar;
        $parsedComment->userImg = str_replace("\\", "/",$parsedComment->userImg);
        $parsedComment->content = $comment->content;
        $parsedComment->id = $comment->id;           

        return response()->json($parsedComment,201,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function store(Request $request)
    {
        /**
         *$dish = Dish::Create([
         *   'name' => $request->name,     
         *   'image' => $request->image,
         *   'description' => $request->description,
         *   'establishment_id' => $request->establishment_id
         *]);
         */
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $dish = Dish::find($id);    
        $parsedDish = new ParsedDishInfo();
        $parsedDish->id = $dish->id;
        $parsedDish->name = $dish->name;            
        $parsedDish->image = '/storage/' . $dish->image;
        $parsedDish->image = str_replace("\\", "/",$parsedDish->image);
        $parsedDish->description = $dish->description;
        $parsedDish->user = $dish->user->name;
        $parsedDish->userImg = '/storage/' . $dish->user->avatar;
        $parsedDish->userImg = str_replace("\\", "/",$parsedDish->userImg);
        $parsedDish->nComments = $dish->comments->Count();
        $parsedDish->rating = $dish->rating;
        $parsedComments = array();
        $comments = $dish->comments->take(3);
        //Putting img and name on comments
        foreach($comments as $comment){
            $parsed = new ParsedComment();
            $user = User::Find($comment->user_id);
            $parsed->userName = $user->name;
            $parsed->userImg = '/storage/' . $user->avatar;
            $parsed->userImg = str_replace("\\", "/",$parsed->userImg);
            $parsed->content = $comment->content;
            $parsed->id = $comment->id;

            array_push($parsedComments,$parsed);
        }

        $parsedDish->comments = $parsedComments;

        return response()->json($parsedDish,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
  
    }

    public function rate(Request $request)
    {        
        Log::debug($request);
        try{
            $user = Auth::user(); 
            DishRating::where('user_id', $user->id)->where('dish_id', $request->dish_id)->delete();            
            DishRating::create(
                ['user_id' => $user->id, 
                'dish_id' => $request->dish_id,
                'value' => $request->value]
            );
            //Update Establishment Rating
            $count = DishRating::where('dish_id', $request->dish_id)->count();
            $ratings = DishRating::where('dish_id', $request->dish_id)->get();
            $sum = 0;
            foreach($ratings as $rate){
                $sum += $rate->value;
            }
            $newRating = $sum / $count;
            Dish::find($request->dish_id)->update(['rating' => $newRating]);
            return response()->noContent(201);            
        } catch (Exception $ex) { 
            return abort(500, 'Could not rate');
        }
    }

    public function create(Request $request)
    {
        try {
            Log::debug($request);
             $user = Auth::user(); 
             $imagePath = 'dishes/May2021/pizza-vegana.jpg';
            //  if($request->hasFile('image') && $request->image->isValid()){
            //     $imagePath = $request->image->store('public/storage/uploaded');
            //  }
             $report = Dish::create([
                 'name' => $request->name,
                 'user_id' => $user->id,
                 'establishment_id' => $request->establishment_id,
                 'description' => $request->notes,
                 'image' => $imagePath,

             ]);
             return response()->noContent(201);     
        }
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Create error');
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
