<?php

/*if(isset($_GET['courses']))
    $courses = $_GET['courses'];
else
    die("No courses selected");*/
#$courses = Array('Advanced Object-Oriented Programming','Data Analytics','Enterprise Support And Infrastructure','Internship');
$courses = Array('Advanced Object-Oriented Programming');

$dbconn = pg_connect("host=localhost dbname=schedule user=postgres password=tinykite04")
    or die('Could not connect: ' . pg_last_error());


$where = '';
if(is_array($courses) && count($courses) > 0) {
    $where .= "WHERE (FALSE";
    foreach($courses as $course)
        $where .= " OR Courses.name = '".$course."'";
    $where .= ") ";
    echo $where;
} else die("Courses input is busted bro");

$query = "SELECT Sessions.week,Slots.room,Slots.Day,Slots.slottime,Slots.slotlength,Courses.name,Courses.lecturername,Lecturers.url FROM Sessions ".
"JOIN Slots ON Sessions.slotID = Slots.slotID ".
"JOIN Courses ON Slots.courseName = Courses.name ".
"JOIN Lecturers ON Courses.lecturername = Lecturers.name ".
$where.
"ORDER BY Slots.slottime;";

$result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());



while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    var_dump($line);
}

pg_free_result($result);

pg_close($dbconn);
?>