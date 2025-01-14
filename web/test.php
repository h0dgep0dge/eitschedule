<?php

$days = Array('mon','tue','wed','thu','fri','sat','sun');

$dayToSeconds = Array();
for($i = 0;$i < 7;$i++)
    $dayToSeconds[$days[$i]] = $i*60*60*24;

$week = 9;
$time = 13;
$day = 'wed';

$d=mktime(00, 00, 00, 2, 17, 2025); // The date of monday on week 8

$d += ($week-8) * 60*60*24*7; // Offset the date by the number of weeks after week 8
$d += $dayToSeconds[$day];
$d += $time * 60 * 60;

echo "Created date is " . date("Y-m-d h:i:sa", $d) . PHP_EOL;


?>