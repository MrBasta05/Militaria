<?php
$con = mysqli_connect("localhost", "root", "", "militaria");
$id = $_REQUEST['id'];
$ilosc = $_REQUEST['ilosc'];
$query = 'INSERT INTO zawartosc_koszyka(id, uzytkownik_id, produkt_id, ilosc) VALUES (NULL,1,' . $id . ',1)';
$insert = mysqli_query($con, $query);
echo 1;
mysqli_close($con);
