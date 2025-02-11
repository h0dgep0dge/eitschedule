<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<?php
require_once('./db.php');

$days = Array('mon'=>'Monday','tue'=>'Tuesday','wed'=>'Wednesday','thu'=>'Thursday','fri'=>'Friday','sat'=>'Saturday','sun'=>'Sunday');

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

$sessions = getSessions($courses,$campus,$week);

$sessionsPerDay = Array('mon'=>Array(),'tue'=>Array(),'wed'=>Array(),'thu'=>Array(),'fri'=>Array(),'sat'=>Array(),'sun'=>Array());

foreach($sessions as $session) {
    $sessionsPerDay[$session['day']][] = $session;
}

$sortedSessionsPerDay = Array();

foreach($sessionsPerDay as $day => $sessions) {
    if(count($sessions) == 0) continue;
    $unsorted = $sessions;
    $sorted = Array();

    while(count($unsorted) > 0) {
        $line = Array();
        $next = Array();

        $line[] = $unsorted[0];
        array_shift($unsorted);

        while(count($unsorted) > 0) {
            if($unsorted[0]['slottime'] >= $line[count($line)-1]['slottime'] + $line[count($line)-1]['slotlength']) {
                $line[] = $unsorted[0];
            } else {
                $next[] = $unsorted[0];
            }
            array_shift($unsorted);
        }
        $sorted[] = $line;
        $unsorted = $next;
    }

    $sortedSessionsPerDay[$day] = $sorted;
}

echo "<table class='outer'>\n";
echo "<tr class='outer'><th class='outer'></th>";
for($i = 7;$i < 17;$i += 0.5) {
    echo "<th class='outer'>",$i,"</th>";
}
echo "</tr>";

foreach($sortedSessionsPerDay as $day => $schedule) {

    $tr = "<tr class='outer'><td class='outer' rowspan=".(string)count($schedule).">".$days[$day]."</td>";
    foreach($schedule as $line) {
        echo $tr;
        $tr = "<tr>";
        for($i = 7;$i < 17;) {
            if(count($line) == 0 || $line[0]['slottime'] > $i) {
                echo "<td class='outer'></td>";
                $i += 0.5;
                continue;
            }
            if($line[0]['slottime'] == $i) {
                $session = $line[0];
                echo "<td class='outer' colspan='",$session['slotlength']*2,"'>";
                echo "<table class='inner'>";
                echo "<tr class='inner'><td colspan='3' class='inner'>",$session['name'],"</td></tr>";
                if($session['lecturername'] == '') // No lecturer for this class yet!
                    echo "<tr class='inner'><td class='left' colspan='2'>",$session['room'],"</td><td class='right'>TBD</td></tr>";
                else
                    echo "<tr class='inner'><td class='left' colspan='2'>",$session['room'],"</td><td class='right'><a href='".$session['url']."'>",$session['lecturername'],"</a></td></tr>";
                echo "</table>";
                $i += $session['slotlength'];
                array_shift($line);
            }
        }
        echo "</tr>";
    }

}

echo "</table>\n";

closeDB();
echo "Click <a href='export.php?".$_SERVER['QUERY_STRING']."'>here</a> to export these courses as an iCal file. Please take care! I will not take responsibility for how annoying these events are to delete if they're wrong.";
?>
</body>
</html>
