<?php
include '../Broker.php';
include '../servis/GradServis.php';

$broker=Broker::getBroker();
$gradServis= new GradServis($broker);

try {
    echo json_encode([
        "status"=>200,
        "body"=>$gradServis->vratiSve()
    ]);
} catch (\Exception $ex) {
    echo json_encode([
        "status"=>500,
        "error"=>$ex->getMessage()
    ]);
}
?>