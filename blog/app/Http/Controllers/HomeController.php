<?php

namespace App\Http\Controllers;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class HomeController extends Controller
{
    function home(request $Request){

        $posts = DB::table('posts')->get();
     
            //return $posts;

            foreach($posts as $post){
             echo $post->post_title;
        
             echo $post->post_content;
            }
            echo "\n\n";

 

    }
}
