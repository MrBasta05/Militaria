<?php
$categoryId = $_GET['category'];
$con = mysqli_connect('localhost', 'root', '', 'Militaria');
$queryCategoryName = "SELECT nazwa FROM kategoria WHERE id = ".$categoryId;
// $categoryName  = mysqli(mysqli_query($con, $queryCategoryName));

$categoryName = $con->query($queryCategoryName)->fetch_object()->nazwa;

mysqli_close($con);
echo $categoryName;