<!DOCTYPE html>
<html><body>
<?php

require_once('./db.php');

echo "<form action='view.php' method='get'>";

echo "Select your campus<br><select name='campus'>";

foreach(getCampuses() as $campus)
    echo "<option>",$campus,"</option>";

echo "</select><br>";

echo "Select your courses<br><select name='courses[]' size='10' multiple>";

foreach(getAllCourses() as $course)
    echo "<option value='".$course."'>",$course,"</option>";

echo "</select><br>";

echo "Select your week <select name='week'>";

foreach(getWeeks() as $week)
    echo "<option>",$week,"</option>";

echo "</select><br>";

echo "<input type='submit' value='Go'></form>";

closeDB();

?>
This project is strictly alpha, do not rely on the results!
</body>
</html>
