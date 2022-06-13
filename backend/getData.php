<?php

$con = mysqli_connect("localhost", "root", "", "militaria");
// Check connection
if (mysqli_connect_errno()) {
    echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
}

// Perform queries
$req = mysqli_query($con, "SELECT * FROM produkt");
$data = array();
if (mysqli_num_rows($req) > 0) {
    while ($row = mysqli_fetch_assoc($req)) {
        $data[] = $row;
    }
}
// $res = mysqli_fetch_assoc($req);
// echo "<pre>";
echo json_encode($data);
// echo "</pre>";
// $json = json_encode($res);
// print_r($json);
mysqli_close($con);
