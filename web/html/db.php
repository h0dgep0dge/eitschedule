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

function getSessions($courses,$campus,$week) {
    global $dbconn;

    $slots = Array();

    $where = "WHERE TRUE";

    $parameters = Array();
    $i = 1;

    if(!is_null($week)) {
        $where .= ' AND week = $'.(string)$i++;
        $parameters[] = (string)$week;
    }

    if(is_array($courses) && count($courses) > 0){
        $where .= " AND (FALSE";
        foreach($courses as $course) {
            $where .= ' OR Courses.name = $'.(string)$i++;
            $parameters[] = $course;
        }
        $where .= ")";
    }

    if(is_string($campus) && $campus != '') {
        $where .= ' AND Courses.campus = $'.(string)$i++;
        $parameters[] = $campus;
    }

    $query = "SELECT Courses.name,Courses.lecturername,Lecturers.url,Slots.room,Slots.day,Sessions.week,Slots.slottime,Slots.slotlength FROM Sessions ".
             "JOIN Slots ON Sessions.slotID = Slots.slotID ".
             "JOIN Courses ON Slots.courseName = Courses.name AND Slots.campus = Courses.campus ".
             "LEFT JOIN Lecturers ON Courses.lecturername = Lecturers.name ".
             $where.
             " ORDER BY Slots.slottime;";
    
    $result = pg_query_params($dbconn, $query, $parameters) or die('Query failed: ' . pg_last_error());

    while($row = pg_fetch_array($result,null,PGSQL_ASSOC))
        $slots[] = $row;

    pg_free_result($result);

    return $slots;
}
?>