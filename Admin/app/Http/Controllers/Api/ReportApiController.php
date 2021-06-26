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
use App\Models\ProductReport;
use App\Models\CompanyReport;
use App\Models\CompanyGroupReport;
use App\Models\EstablishmentReport;


class ReportApiController extends Controller
{
    public function productReport(Request $request){

        try 
        {
            //Log::debug($request);
            $user = Auth::user(); 
            $report = ProductReport::create([
                'description' => $request->content,
                'user_id' => $user->id,
                'product_id' => $request->product_id,
                'status' => 0
            ]);
            return response()->noContent(201);            
        } 
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Could not create report');
        }
    }

    public function companyReport(Request $request){

        try 
        {
            //Log::debug($request);
            $user = Auth::user(); 
            if($request->group == true){
                $report = CompanyGroupReport::create([
                    'description' => $request->content,
                    'user_id' => $user->id,
                    'company_group_id' => $request->company_id,
                    'status' => 0
                ]);
            }else{
                $report = CompanyReport::create([
                    'description' => $request->content,
                    'user_id' => $user->id,
                    'company_id' => $request->company_id,
                    'status' => 0
                ]);
            }
            return response()->noContent(201);            
        } 
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Could not create report');
        }
    }

    public function establishmentReport(Request $request){

        try 
        {
            //Log::debug($request);
            $user = Auth::user(); 
            $report = EstablishmentReport::create([
                'description' => $request->content,
                'user_id' => $user->id,
                'establishment_id' => $request->establishment_id,
                'status' => 0
            ]);
            return response()->noContent(201);            
        } 
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Could not create report');
        }
    }
}
