<?php
require_once '_db.php';

$json = file_get_contents('php://input');
$params = json_decode($json);

$insert = "INSERT INTO events (name, start_s, end) VALUES (:name, :start_s, :end)";

$stmt = $db->prepare($insert);

$stmt->bindParam(':start_s', $params->start_s);
$stmt->bindParam(':end', $params->end);
$stmt->bindParam(':name', $params->text);

$stmt->execute();

class Result {}

$response = new Result();
$response->result = 'OK';
$response->id = $db->lastInsertId();
$response->message = 'Created with id: '.$db->lastInsertId();

header('Content-Type: application/json');
echo json_encode($response);
