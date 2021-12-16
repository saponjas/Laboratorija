<?php
include '../Broker.php';
include '../servis/AnalizaServis.php';

$broker=Broker::getBroker();
$analizaServis= new AnalizaServis($broker);

try {
    $analizaServis->kreiraj($_POST);
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