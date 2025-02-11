<?php

require_once('./db.php');

require_once("./icalendar/zapcallib.php");

date_default_timezone_set('UTC');

$days = Array('mon','tue','wed','thu','fri','sat','sun');

$dayToSeconds = Array();
for($i = 0;$i < 7;$i++)
    $dayToSeconds[$days[$i]] = $i*60*60*24;

function addEvent($icalobj,$row) {

    global $dayToSeconds;
    $week = (int)$row['week'];
    $time = (int)$row['slottime'];
    $day = $row['day'];
    $dur = (float)$row['slotlength'];

    $d=mktime(00, 00, 00, 2, 17, 2025); // The date of monday on week 8

    $d += ($week-8) * 60*60*24*7; // Offset the date by the number of weeks after week 8
    $d += $dayToSeconds[$day];
    $d += $time * 60 * 60;

    $h = (string)floor($dur);
    $m = (string)floor(($dur-$h)*60);


    $event_dur = 'PT'.$h.'H'.$m.'M';
    
    $eventobj = new ZCiCalNode("VEVENT", $icalobj->curnode);
    $eventobj->addNode(new ZCiCalDataNode("SUMMARY:" . $row['name']));
    $eventobj->addNode(new ZCiCalDataNode("DTSTART;TZID=Pacific/Auckland:" . ZDateHelper::toiCalDateTime($d)));
    $eventobj->addNode(new ZCiCalDataNode("DURATION:" . $event_dur));
    $eventobj->addNode(new ZCiCalDataNode("LOCATION:" . $row['room']));
    $uid = date('Y-m-d-H-i-s-') . (string)rand(100000,999999) . "@schedule.n0mad.nz";
    $eventobj->addNode(new ZCiCalDataNode("UID:" . $uid));
    $eventobj->addNode(new ZCiCalDataNode("DTSTAMP:" . ZCiCal::fromSqlDateTime()));
}

if(isset($_GET['courses']))
    $courses = $_GET['courses'];
else
    die("No courses selected. If you really REALLY want to export everything, go back and select everything");

if(isset($_GET['campus']))
    $campus = $_GET['campus'];
else
    die("No campus selected");
//$courses = Array('Advanced Object-Oriented Programming','Data Analytics','Enterprise Support And Infrastructure','Internship');
//$courses = Array('Advanced Object-Oriented Programming');

$sessions = getSessions($courses,$campus,NULL);

$icalobj = new ZCiCal();

foreach($sessions as $session) {
    addEvent($icalobj,$session);
}

header('Content-Type: application/octet-stream');
header('Content-Transfer-Encoding: Binary');
header('Content-disposition: attachment; filename="BCS.ics"');
echo $icalobj->export();

closeDB();
?>
