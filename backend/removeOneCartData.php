<?php
$con = mysqli_connect("localhost", "root", "", "militaria");
$id = $_REQUEST['id'];
$dajid = mysqli_query($con, 'SELECT produkt.id FROM produkt WHERE nazwa = "' . $id . '";');
$data;
if (mysqli_num_rows($dajid) > 0) {
    while ($row = mysqli_fetch_array($dajid)) {
        $data = $row;
    }
}

$query = 'DELETE FROM zawartosc_koszyka WHERE zawartosc_koszyka.uzytkownik_id = 1 and produkt_id = ' . $data[0] . ';';
$delete = mysqli_query($con, $query);
echo 1;
mysqli_close($con);
//DZORDAN zapytanie znajdujące produkt po nazwie
// przekazanie id do php
// zapytanie usuwajace produkt z koszyku po id