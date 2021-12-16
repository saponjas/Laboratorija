<?php
class GradServis{
    private $broker;

    public function __construct($b){
        $this->broker=$b;
    }

    public function vratiSve(){
        return $this->broker->ucitajKolekciju('select * from grad');
    }
}

?>