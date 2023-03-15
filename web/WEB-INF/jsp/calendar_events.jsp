<%

String start=request.getParameter("start_s");String end=request.getParameter("end");
//Gson gos=new Gson();
%>
<?php
require_once '_db.php';

// .events.load() passes start_s and end as query string parameters by default
$start_s = $_GET["start_s"];
$end = $_GET["end"];
    
$stmt = $db->prepare('SELECT * FROM events WHERE NOT ((end <= :start_s) OR (start_s >= :end))');

$stmt->bindParam(':start_s', $start_s);
$stmt->bindParam(':end', $end);

$stmt->execute();
$result = $stmt->fetchAll();

class Event {}
$events = array();

foreach($result as $row) {
  $e = new Event();
  $e->id = $row['id'];
  $e->text = $row['name'];
  $e->start_s = $row['start_s'];
  $e->end = $row['end'];
  $e->backColor = $row['color'];
  $events[] = $e;
}

header('Content-Type: application/json');
echo json_encode($events);
