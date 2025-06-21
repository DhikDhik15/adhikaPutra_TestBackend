<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: GET, POST, PATCH, DELETE');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once __DIR__ . './../config/database.php';
include_once __DIR__ . '/routes/ItemRoute.php';

$database = new Database();
$db = $database->getConnection();

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode('/', $uri);

// /items will be the endpoint
if (isset($uri[1]) && $uri[1] == 'items') {
    $itemRoute->handleRequest();
} else {
    header("HTTP/1.1 404 Not Found");
    echo json_encode(["message" => "Endpoint not found"]);
}
