<?php
$con = mysqli_connect('localhost', 'root', '', 'militaria');
$username = $_REQUEST['user'];
$query = 'SELECT produkt.nazwa, produkt.koszt, zawartosc_koszyka.ilosc from uzytkownik join zawartosc_koszyka join produkt on uzytkownik.id = zawartosc_koszyka.uzytkownik_id and zawartosc_koszyka.produkt_id = produkt.id where uzytkownik.nazwa = "' . $username . '"';
$req = mysqli_query($con, $query);
// echo $username;
$wynik = array();
while ($data = mysqli_fetch_assoc($req)) {
    $wynik[] = $data;
};
echo json_encode($wynik);
// DZORDAN query ktore pobiera uzytkownika a nastepnie pobiera zawartość jego koszyka
//SELECT produkt.nazwa, produkt.koszt, zawartosc_koszyka.ilosc from uzytkownik join zawartosc_koszyka join produkt on uzytkownik.id = zawartosc_koszyka.uzytkownik_id and zawartosc_koszyka.produkt_id = produkt.id where uzytkownik.nazwa = "DESTRUKTOID69";
mysqli_close($con);
