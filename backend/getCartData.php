<?php
$con = mysqli_connect('localhost', 'root', '', 'Militaria');

// DZORDAN query ktore pobiera uzytkownika a nastepnie pobiera zawartość jego koszyka
//SELECT produkt.nazwa, produkt.koszt, zawartosc_koszyka.ilosc from uzytkownik join zawartosc_koszyka join produkt on uzytkownik.id = zawartosc_koszyka.uzytkownik_id and zawartosc_koszyka.produkt_id = produkt.id where uzytkownik.nazwa = "DESTRUKTOID69";
mysqli_close($con);
