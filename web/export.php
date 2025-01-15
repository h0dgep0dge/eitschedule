<?php

require_once("./icalendar/zapcallib.php");


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


    $event_dur = 'PT'.$h.'H'.$m.'M';;

    $eventobj = new ZCiCalNode("VEVENT", $icalobj->curnode);
    $eventobj->addNode(new ZCiCalDataNode("SUMMARY:" . $row['name']));
    $eventobj->addNode(new ZCiCalDataNode("DTSTART:" . ZDateHelper::toiCalDateTime($d)));
    $eventobj->addNode(new ZCiCalDataNode("DURATION:" . $event_dur));
    $eventobj->addNode(new ZCiCalDataNode("LOCATION:" . $row['room']));
    $uid = date('Y-m-d-H-i-s-') . (string)rand(100000,999999) . "@schedule.n0mad.nz";
    $eventobj->addNode(new ZCiCalDataNode("UID:" . $uid));
    $eventobj->addNode(new ZCiCalDataNode("DTSTAMP:" . ZCiCal::fromSqlDateTime()));
}

if(isset($_GET['courses']))
    $courses = $_GET['courses'];
else
    die("No courses selected");

if(isset($_GET['campus']))
    $campus = $_GET['campus'];
else
    die("No campus selected");
//$courses = Array('Advanced Object-Oriented Programming','Data Analytics','Enterprise Support And Infrastructure','Internship');
//$courses = Array('Advanced Object-Oriented Programming');

$dbconn = pg_connect("host=localhost dbname=schedule user=postgres password=tinykite04")
    or die('Could not connect: ' . pg_last_error());


$where = '';
if(is_array($courses) && count($courses) > 0) {
    $where .= "WHERE (FALSE";
    foreach($courses as $course)
        $where .= " OR Courses.name = '".$course."'";
    $where .= ") ";
} else die("Courses input is busted bro");

if(is_string($campus) && $campus != '') {
    $where .= " AND Courses.campus ='".$campus."' ";
}

$query = "SELECT Sessions.week,Slots.room,Slots.Day,Slots.slottime,Slots.slotlength,Courses.name FROM Sessions ".
"JOIN Slots ON Sessions.slotID = Slots.slotID ".
"JOIN Courses ON Slots.courseName = Courses.name AND Slots.campus = Courses.campus ".
"LEFT JOIN Lecturers ON Courses.lecturername = Lecturers.name ".
$where.
"ORDER BY Slots.slottime;";

$result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());

$icalobj = new ZCiCal();


while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    addEvent($icalobj,$line);
}

header('Content-Type: application/octet-stream');
header('Content-Transfer-Encoding: Binary');
header('Content-disposition: attachment; filename="BCS.ics"');
echo $icalobj->export();

pg_free_result($result);

pg_close($dbconn);
?>