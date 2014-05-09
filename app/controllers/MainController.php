<?php

class MainController extends BaseController {

    protected $layout = 'layout';

    public function index()
    {
        $this->layout->title = 'Passed in';
    }
}
