<?php

$dbconn = pg_connect("host=db dbname=schedule user=postgres")
or die('Could not connect: ' . pg_last_error());

function getCampuses() {
    global $dbconn;

    $campuses = Array();

    $query = "SELECT Courses.campus FROM Courses GROUP BY Courses.campus ORDER BY campus ASC;";
    $result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_array($result, null, PGSQL_ASSOC))
        $campuses[] = $row["campus"];
    
    pg_free_result($result);
    
    return $campuses;
}

function getAllCourses() {
    global $dbconn;

    $courses = Array();

    $query = "SELECT Courses.name FROM Courses GROUP BY Courses.name;";
    $result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_array($result, null, PGSQL_ASSOC))
        $courses[] = $row["name"];
    
    pg_free_result($result);

    return $courses;
}

function getWeeks() {
    global $dbconn;

    $weeks = Array();

    $query = "SELECT week FROM Sessions GROUP BY week ORDER BY week;";
    $result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());

    while($row = pg_fetch_array($result,null,PGSQL_ASSOC))
        $weeks[] = $row["week"];

    pg_free_result($result);

    return $weeks;
}

function closeDB() {
    global $dbconn;
    pg_close($dbconn);
}

?>