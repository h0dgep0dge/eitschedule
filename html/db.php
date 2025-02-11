<?php

$dbconn = new SQLite3('./schedule.db')
or die('Could not connect');

function getCampuses() {
    global $dbconn;

    $campuses = Array();

    $query = "SELECT Courses.campus FROM Courses GROUP BY Courses.campus ORDER BY campus ASC;";
    $result = $dbconn->query($query) or die('Query failed');

    while ($row = $result->fetchArray(SQLITE3_ASSOC))
        $campuses[] = $row["campus"];
    
    $result->finalize();
    
    return $campuses;
}

function getAllCourses() {
    global $dbconn;

    $courses = Array();

    $query = "SELECT Courses.name FROM Courses GROUP BY Courses.name;";
    $result = $dbconn->query($query) or die('Query failed');

    while ($row = $result->fetchArray(SQLITE3_ASSOC))
        $courses[] = $row["name"];
    
    $result->finalize();

    return $courses;
}

function getWeeks() {
    global $dbconn;

    $courses = Array();

    $query = "SELECT week FROM Sessions GROUP BY week ORDER BY week;";
    $result = $dbconn->query($query) or die('Query failed');

    while ($row = $result->fetchArray(SQLITE3_ASSOC))
        $courses[] = $row["week"];
    
    $result->finalize();

    return $courses;
}

function closeDB() {
    // I guess you don't have to do this?
}

function getSessions($courses,$campus,$week) {
    global $dbconn;
    
    $slots = Array();

    $where = "WHERE TRUE";

    $parameters = Array();
    $i = 1;

    if(!is_null($week)) {
        $where .= " AND week = '".SQLite3::escapeString($week)."'";
    }

    if(is_array($courses) && count($courses) > 0){
        $where .= " AND (FALSE";
        foreach($courses as $course) {
            $where .= " OR Courses.name = '".SQLite3::escapeString($course)."'";
        }
        $where .= ")";
    }

    if(is_string($campus) && $campus != '') {
        $where .= " AND Courses.campus = '".SQLite3::escapeString($campus)."'";
    }

    $query = "SELECT Courses.name,Courses.lecturername,Lecturers.url,Slots.room,Slots.day,Sessions.week,Slots.slottime,Slots.slotlength FROM Sessions ".
             "JOIN Slots ON Sessions.slotID = Slots.slotID ".
             "JOIN Courses ON Slots.courseName = Courses.name AND Slots.campus = Courses.campus ".
             "LEFT JOIN Lecturers ON Courses.lecturername = Lecturers.name ".
             $where.
             " ORDER BY Slots.slottime;";
             
    $result = $dbconn->query($query) or die('Query failed');
    
    while($row = $result->fetchArray(SQLITE3_ASSOC))
        $slots[] = $row;

    $result->finalize();

    return $slots;
}
?>