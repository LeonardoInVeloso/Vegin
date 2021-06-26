<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth; 
use App\Models\Company;
use App\Models\Product;
use App\Models\CompanyGroup;
use App\Models\Dto\CompanyLessDto;
use App\Models\Dto;

class CompanyApiController extends Controller
{
    public function index(Request $request)
    {
        if($request->name != '' && $request->name != null){
            $companies = Company::where('status', 2)->where('name', 'LIKE', '%'.$request->name.'%')->get();
            $companyGroups = CompanyGroup::where('status', 2)->where('name', 'LIKE', '%'.$request->name.'%')->get();
        }else{
            $companies = Company::take(20)->get();
            $companyGroups = CompanyGroup::where('status', 2)->take(20)->get();
        }
        $CompaniesDto = array();
        foreach($companies as $company){

            $Dto = new CompanyLessDto();
            $Dto->id = $company->id;
            $Dto->name = $company->name;            
            $Dto->image = '/storage/' . $company->image;
            $Dto->image = str_replace("\\", "/",$Dto->image);
            if($company->companyGroup != null){
                $Dto->companyGroup = $company->companyGroup->name;
            }
            array_push($CompaniesDto,$Dto);
        }
        foreach($companyGroups as $company){

            $Dto = new CompanyLessDto();
            $Dto->id = $company->id;
            $Dto->name = $company->name;            
            $Dto->image = '/storage/' . $company->image;
            $Dto->image = str_replace("\\", "/",$Dto->image);
            $Dto->companyGroup = "Grupo de Empresas";

            array_push($CompaniesDto,$Dto);
        }
        return response()->json($CompaniesDto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function show(Request $request)
    {
        if($request->group == 'false') {
            $company = Company::find($request->id);
        } else{
            $company = CompanyGroup::find($request->id);    
        }
        if($company == null){
            return response()->noContent();
        } else {    
            $dto = new Dto();
            $dto->id = $company->id;
            $dto->name = $company->name;            
            $dto->image = '/storage/' . $company->image;
            $dto->image = str_replace("\\", "/",$dto->image);
            $dto->notes = $company->notes;
            $dto->animal_event = $company->animal_event;
            $dto->animal_tests = $company->animal_tests;
            $dto->lastUpdate = $company->updated_at->toDateString(); 
            if($request->group == 'false') {                
                if($company->groupId != null){
                    $dto->animal_event = $company->companyGroup->animal_event;
                    $dto->animal_tests = $company->companyGroup->animal_tests;
                    $dto->companyGroupName = $company->companyGroup->name;
                }
                $dto->animal_ing = $company->animal_prod;
                $dtoProducts = array();
                $products = $company->products->all();
                foreach($products as $product){
                    $productDto = new Dto();
                    $productDto->id = $product->id;
                    $productDto->image = '/storage/' . $product->image;
                    $productDto->image = str_replace("\\", "/",$productDto->image);
                    array_push($dtoProducts,$productDto);
                }
                $dto->items = $dtoProducts;
            }else{
                $companies = array();
                $comps = $company->companies->all();
                foreach($comps as $comp){
                    $compDto = new Dto();
                    $compDto->id = $comp->id;
                    $compDto->image = '/storage/' . $comp->image;
                    $compDto->image = str_replace("\\", "/",$compDto->image);
                    array_push($companies,$compDto);
                }
                $dto->items = $companies;
            }
        }  
        return response()->json($dto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);        
    }

    public function list()
    {
        try {
            $companies = Company::where('status', 2)->get();
            $companiesDto = array();
            foreach($companies as $company){
                $dto = new CompanyLessDto();
                $dto->id = $company->id;
                $dto->name = $company->name;
                array_push($companiesDto,$dto);
            }
            
            return response()->json($companiesDto,200,['Content-type'=>'application/json;charset=utf-8'],JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);        
            
        }
        catch (Exception $ex) { // Anything that went wrong
            return abort(500, 'Create error');
        }
    }
}
