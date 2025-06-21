<?php
header("Content-Type: application/json");
include_once __DIR__ . './../config/database.php';

$method = $_SERVER['REQUEST_METHOD'];
$input = json_decode(file_get_contents('php://input'), true);

switch ($method) {
    case 'GET' : 
        handleGet($pdo);
        break;
}