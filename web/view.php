<!DOCTYPE html>
<head>
    <style>
        table, th, td {
        border: 1px solid;
        }

        th {
            text-align: left;
        }
    </style>
</head>
<body>
<?php
function get_schedule($conn,$day,$week,$courses) {

    $where = "WHERE Sessions.week = ".(string)$week." AND Slots.day = '".$day."' ";
    if(is_array($courses) && count($courses) > 0){
        $where .= "AND (FALSE";
        foreach($courses as $course)
            $where .= " OR Courses.name = '".$course."'";
        $where .= ") ";
    }
    $query = "SELECT Courses.name,Slots.room,Slots.slottime,Slots.slotlength FROM Sessions ".
             "JOIN Slots ON Sessions.slotID = Slots.slotID ".
             "JOIN Courses ON Slots.courseName = Courses.name ".
             $where.
             "ORDER BY Slots.slottime;";
    $result = pg_query($conn, $query) or die('Query failed: ' . pg_last_error());
    
    $slots = Array();

    $schedule = Array();

    while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
        $slots[] = Array($line["name"],$line["room"],(int)($line["slottime"]),(int)($line["slotlength"]));
    }

    while(count($slots) > 0) {
        $line = Array();
        $next = Array();
        $line[] = $slots[0];
        array_shift($slots);
        while(count($slots) > 0) {
            if($slots[0][2] >= $line[count($line)-1][2] + $line[count($line)-1][3]) {
                $line[] = $slots[0];
            } else {
                $next[] = $slots[0];
            }
            array_shift($slots);
        }
        $schedule[] = $line;
        $slots = $next;
    }

    pg_free_result($result);

    return $schedule;
}

$days = Array('mon'=>'Monday','tue'=>'Tuesday','wed'=>'Wednesday','thu'=>'Thursday','fri'=>'Friday','sat'=>'Saturday','sun'=>'Sunday');

// Connecting, selecting database
$dbconn = pg_connect("host=localhost dbname=schedule user=postgres password=tinykite04")
    or die('Could not connect: ' . pg_last_error());

echo "<table>\n";
echo "<tr><td></td>";
for($i = 7;$i < 17;$i += 0.5) {
    echo "<th>",$i,"</th>";
}
echo "</tr>";

if(isset($_GET['courses']))
    $courses = $_GET['courses'];
else
    $courses = NULL;
foreach(Array('mon','tue','wed','thu','fri') as $day) {
#foreach(Array('mon') as $day) {
    $schedule = get_schedule($dbconn,$day,8,$courses);



$tr = "<tr><td rowspan=".(string)count($schedule).">".$days[$day]."</td>";
foreach($schedule as $line) {
    echo $tr;
    $tr = "<tr>";
    for($i = 7;$i < 17;) {
        if(count($line) == 0 || $line[0][2] > $i) {
            echo "<td></td>";
            $i += 0.5;
            continue;
        }
        if($line[0][2] == $i) {
            echo "<td colspan='",$line[0][3]*2,"'>",$line[0][0],"</td>";
            $i += $line[0][3];
            array_shift($line);
        }
    }
    echo "</tr>";
}

}

echo "</table>\n";


// Closing connection
pg_close($dbconn);

?>
</body>
</html>