<?php
class LaboratorijaServis{
    private $broker;

    public function __construct($b){
        $this->broker=$b;
    }

    public function vratiSve(){
        return $this->broker->ucitajKolekciju("select l.*, g.naziv as 'naziv_grada' from laboratorija l inner join grad g on (l.grad=g.id)");
    }
    public function vratiJednu($id){
        $res=$this->broker->ucitajKolekciju("select l.*, g.naziv as 'naziv_grada' from laboratorija l inner join grad g on (l.grad-g.id) where l.id=".$id);
        if(count($res)==0){
            throw new Exception('Laboratorija ne postoji');
        }
        $analize="select la.*, a.naziv from laboratorija_analiza la inner join analiza a where la.laboratorija=".$id;
        $lab=$res[0];
        $lab['analize']=$analize;
        return $lab;
    }
    public function obrisi($id){
        $this->broker->izmeni("delete from laboratorija where id=".$id);
    }
    public function kreiraj($lab){
        $this->broker->izmeni("insert into laboratorija (naziv,adresa,grad) values ('".
                        $lab['naziv']."','".$lab['adresa']."',".$lab['grad'].")");
    }
    
    public function izmeni($id,$lab){
        $this->broker->izmeni("update laboratorija set naziv='".
                        $lab['naziv']."', adresa='".$lab['adresa']."', grad=".$lab['grad']." where id=".$id);
    }

    public function obrisiLA($labId,$aId){
        $this->broker->izmeni("delete from laboratorija_analiza where laboratorija=".$labId." and analiza=".$aId);
    }

    public function kreirajLA($laDto){
        $this->broker->izmeni("insert into laboratorija_analiza(laboratorija,analiza,cena,trajanje) values ("
                            .$laDto['laboratorija'].",".$laDto['analiza'].",".$laDto['cena'].",".$laDto['trajanje'].")");
    }
}

?>