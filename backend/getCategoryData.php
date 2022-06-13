<?php
$categoryId = $_GET['category'];
$con = mysqli_connect('localhost', 'root', '', 'militaria');
$queryCategoryName = "SELECT nazwa FROM kategoria WHERE id = " . $categoryId;
$queryProducts = "SELECT produkt.id, produkt.nazwa, produkt.opis, produkt.koszt from produkt join podkategoria join kategoria on produkt.podkategoria_id = podkategoria.id and podkategoria.kategoria_id = kategoria.id where kategoria.id = " . $categoryId . ";"; // DZORDAN query które pobiera ileś tam produktów z kategorii o id $categoryId
$categoryName = $con->query($queryCategoryName)->fetch_object()->nazwa;
$reqProd = mysqli_query($con, $queryProducts);
$wynik = array();
$wynik[] = $categoryName;
while ($data = mysqli_fetch_assoc($reqProd)) {
    $wynik[] = $data;
};
echo json_encode($wynik);
mysqli_close($con);
