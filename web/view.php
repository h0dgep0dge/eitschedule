<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<?php
function get_schedule($conn,$day,$week,$courses,$campus) {

    $where = "WHERE Sessions.week = ".(string)$week." AND Slots.day = '".$day."' ";
    if(is_array($courses) && count($courses) > 0){
        $where .= "AND (FALSE";
        foreach($courses as $course)
            $where .= " OR Courses.name = '".$course."'";
        $where .= ") ";
    }

    if(is_string($campus) && $campus != '') {
        $where .= " AND Courses.campus ='".$campus."' ";
    }

    $query = "SELECT Courses.name,Courses.lecturername,Lecturers.url,Slots.room,Slots.slottime,Slots.slotlength FROM Sessions ".
             "JOIN Slots ON Sessions.slotID = Slots.slotID ".
             "JOIN Courses ON Slots.courseName = Courses.name AND Slots.campus = Courses.campus ".
             "LEFT JOIN Lecturers ON Courses.lecturername = Lecturers.name ".
             $where.
             "ORDER BY Slots.slottime;";
    //echo $query,PHP_EOL;
    $result = pg_query($conn, $query) or die('Query failed: ' . pg_last_error());
    
    $slots = Array();

    $schedule = Array();

    while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
        $slots[] = Array($line["name"],$line["room"],(int)($line["slottime"]),(int)($line["slotlength"]),$line["lecturername"],$line["url"]);
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

echo "<table class='outer'>\n";
echo "<tr class='outer'><th class='outer'></th>";
for($i = 7;$i < 17;$i += 0.5) {
    echo "<th class='outer'>",$i,"</th>";
}
echo "</tr>";

if(isset($_GET['courses']))
    $courses = $_GET['courses'];
else
    $courses = NULL;

if(isset($_GET['week']))
    $week = $_GET['week'];
else
    $week = '8';

if(isset($_GET['campus']))
    $campus = $_GET['campus'];
else
    $campus = '';

foreach(Array('mon','tue','wed','thu','fri') as $day) {
#foreach(Array('mon') as $day) {
    $schedule = get_schedule($dbconn,$day,$week,$courses,$campus);



$tr = "<tr class='outer'><td class='outer' rowspan=".(string)count($schedule).">".$days[$day]."</td>";
foreach($schedule as $line) {
    echo $tr;
    $tr = "<tr>";
    for($i = 7;$i < 17;) {
        if(count($line) == 0 || $line[0][2] > $i) {
            echo "<td class='outer'></td>";
            $i += 0.5;
            continue;
        }
        if($line[0][2] == $i) {
            echo "<td class='outer' colspan='",$line[0][3]*2,"'>";
            echo "<table class='inner'>";
            echo "<tr class='inner'><td colspan='3' class='inner'>",$line[0][0],"</td></tr>";
            if($line[0][4] == '') // No lecturer for this class yet!
                echo "<tr class='inner'><td class='left' colspan='2'>",$line[0][1],"</td><td class='right'>TBD</td></tr>";
            else
                echo "<tr class='inner'><td class='left' colspan='2'>",$line[0][1],"</td><td class='right'><a href='".$line[0][5]."'>",$line[0][4],"</a></td></tr>";
            echo "</table>";
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
echo "Click <a href='export.php?".$_SERVER['QUERY_STRING']."'>here</a> to export these courses as an iCal file. Please take care! I will not take responsibility for how annoying these events are to delete if they're worng.";
?>
</body>
</html>