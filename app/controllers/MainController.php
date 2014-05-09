<?php

class MainController extends BaseController {

    public function index(){
        $data = array(
            'title'=> 'Main Page'
        );

        return View::make('pages.home', $data);
    }

    public function about(){
        $data = array(
            'title'=> 'About Us Page'
        );

        return View::make('pages.about', $data);
    }

    public function portfolio(){
        $data = array(
            'title'=> 'Portfolio Page'
        );

        return View::make('pages.portfolio', $data);

    }

    public function contact(){
        $data = array(
            'title'=> 'Contact Us Page'
        );

        return View::make('pages.contact', $data);
    }

}
