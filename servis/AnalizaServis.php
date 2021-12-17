<?php
class AnalizaServis{
    private $broker;

    public function __construct($b){
        $this->broker=$b;
    }

    public function vratiSve(){
        return $this->broker->ucitajKolekciju('select * from analiza');
    }

    public function obrisi($id){
        $this->broker->izmeni("delete from analiza where id=".$id);
    }
    public function kreiraj($analiza){
        $this->broker->izmeni("insert into analiza (naziv) values ('".$analiza['naziv']."')");
    }
    public function izmeni($id,$analiza){
        $this->broker->izmeni("update analiza set naziv='".$analiza['naziv']."' where id=".$id);
    }
}

?>