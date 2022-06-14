<?php

$con = mysqli_connect("localhost", "root", "", "militaria");
// Check connection
if (mysqli_connect_errno()) {
    echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
}
$wojewodztwo = "Śląskie";
$miasto = "Bytom";
$ulica = "Dzbana";
$nrulicy = 1;
$nazwa = $_REQUEST['nazwa'];
$haslo = $_REQUEST['haslo'];
// Perform queries
// $query = "INSERT INTO adres SET wojewodztwo='".$wojewodztwo."', miasto='".$miasto."', ulica='".$ulica."', numer_ulicy='".$nrulicy."';";
// mysqli_query($con, $query);
// $getid = mysqli_query($con, 'SELECT id FROM adres WHERE ')
$query2 = "INSERT INTO uzytkownik SET nazwa='" . $nazwa . "', haslo='" . $haslo . "', adres_id=1;";
$insert = mysqli_query($con, $query2);
$a = mysqli_fetch_row(mysqli_query($con, 'SELECT id FROM uzytkownik WHERE nazwa = "' . $nazwa . '"'));
echo $a[0];
mysqli_close($con);
