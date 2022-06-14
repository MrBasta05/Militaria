<?php
$con = mysqli_connect("localhost", "root", "", "militaria");
$id = $_REQUEST['id'];
// $ilosc = $_REQUEST['ilosc'];
$query = 'INSERT INTO zawartosc_koszyka(id, uzytkownik_id, produkt_id, ilosc) VALUES (NULL,1,' . $id . ',1)';
$checkQuery = 'SELECT ilosc FROM zawartosc_koszyka WHERE uzytkownik_id = 1';
$check = mysqli_query($con, $checkQuery);
$checkVal = mysqli_fetch_row($check);
echo $checkVal[0];
if (intVal($checkVal[0]) > 0) {
    $req = mysqli_query($con, "UPDATE zawartosc_koszyka SET ilosc=" .  (intVal($checkVal[0]) + 1) . " WHERE uzytkownik_id = 1 AND produkt_id=" . $id . ";");
} else {
    $insert = mysqli_query($con, $query);
}
echo 1;
mysqli_close($con);
