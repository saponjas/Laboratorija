<?php
include '../Broker.php';
include '../servis/LaboratorijaServis.php';

$broker=Broker::getBroker();
$laboratorijaServis= new LaboratorijaServis($broker);

try {
    $laboratorijaServis->obrisi($_POST['id']);
    echo json_encode([
        "status"=>200
    ]);
} catch (\Exception $ex) {
    echo json_encode([
        "status"=>500,
        "error"=>$ex->getMessage()
    ]);
}
?>