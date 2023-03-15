<?php

$db_exists = file_exists("daypilot.sqlite");

$db = new PDO('sqlite:daypilot.sqlite');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (!$db_exists) {
  //create the database
  $db->exec("CREATE TABLE IF NOT EXISTS events (
                        id INTEGER PRIMARY KEY, 
                        name TEXT, 
                        start_s DATETIME, 
                        end DATETIME,
                        color VARCHAR(30))");

  $items = array(
      array('name' => 'Event 1',
          'start_s' => '2021-08-09T10:00:00',
          'end' => '2021-08-09T12:00:00',
          'color' => '')
  );

  $insert = "INSERT INTO events (name, start_s, end, color) VALUES (:name, :start_s, :end, :color)";
  $stmt = $db->prepare($insert);

  $stmt->bindParam(':name', $name);
  $stmt->bindParam(':start_s', $start_s);
  $stmt->bindParam(':end', $end);
  $stmt->bindParam(':color', $color);

  foreach ($items as $it) {
    $name = $it['name'];
    $start_s = $it['start_s'];
    $end = $it['end'];
    $color = $it['color'];
    $stmt->execute();
  }

}
