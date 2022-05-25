<?php
$categoryId = $_GET['category'];
$con = mysqli_connect('localhost', 'root', '', 'Militaria');
$queryCategoryName = "SELECT nazwa FROM kategoria WHERE id = " . $categoryId;
$queryProducts = ""; // DZORDAN query które pobiera ileś tam produktów z kategorii o id $categoryId
$categoryName = $con->query($queryCategoryName)->fetch_object()->nazwa;

mysqli_close($con);
echo $categoryName;
