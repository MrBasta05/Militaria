<?php

$con = mysqli_connect("localhost", "root", "", "militaria");
// Check connection
if (mysqli_connect_errno()) {
    echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
}
$id = $_REQUEST['id'];
$amount = $_REQUEST['amount'];
// Perform queries
$req = mysqli_query($con, "UPDATE zawartosc_koszyka SET ilosc=" . $amount . " WHERE uzytkownik_id = 1 AND produkt_id=" . $id . ";");


echo true;
mysqli_close($con);
