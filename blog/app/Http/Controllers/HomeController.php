<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    function home(request $Request){

        $post=DB::table('posts')->where('pageName','=','projects')->first();
        return view('pages.projects',['seo'=>$seo]);

 

    }
}
