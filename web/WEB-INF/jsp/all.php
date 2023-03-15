<?php
require_once '_db.php';

// .events.load() passes start and end as query string parameters by default

$stmt = $db->prepare('SELECT * FROM events');


$stmt->execute();
$result = $stmt->fetchAll();

class Event {}
$events = array();
var_dump($result);