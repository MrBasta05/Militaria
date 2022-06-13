<?php
$con = mysqli_connect("localhost", "root", "", "militaria");
$query = 'DELETE FROM zawartosc_koszyka where zawartosc_koszyka.uzytkownik_id = 1;';
$delete = mysqli_query($con, $query);
echo 1;
mysqli_close($con);

//DZORDAN zapytanie usuwajace wszytko z koszyka danego usera
