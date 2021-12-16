<?php
include '../Broker.php';
include '../servis/LaboratorijaServis.php';

$broker=Broker::getBroker();
$laboratorijaServis= new LaboratorijaServis($broker);

try {
    echo json_encode([
        "status"=>200,
        "body"=>$laboratorijaServis->vratiSve()
    ]);
} catch (\Exception $ex) {
    echo json_encode([
        "status"=>500,
        "error"=>$ex->getMessage()
    ]);
}
?>