<!DOCTYPE html>
<html><body>
<?php

$dbconn = pg_connect("host=localhost dbname=schedule user=postgres password=tinykite04")
or die('Could not connect: ' . pg_last_error());

$query = "SELECT Courses.name,Courses.lecturername FROM Courses;";
$result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());

echo "<form action='view.php' method='get'>Select your courses<br><select name='courses[]' size='10' multiple>";
while ($row = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "<option value='".$row["name"]."'>",$row["name"]," with ",$row["lecturername"],"</option>";
}
echo "</select><br>";
pg_free_result($result);



$query = "SELECT week FROM Sessions GROUP BY week ORDER BY week;";
$result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());

echo "Select your week <select name='week'>";
while($row = pg_fetch_array($result,null,PGSQL_ASSOC))
    echo "<option>",$row["week"],"</option>";
echo "</select><br>";

echo "<input type='submit' value='Go'></form>";
pg_close($dbconn);

?>
This project is strictly alpha, do not rely on the results!
</body>
</html>
