<?php

$con = mysqli_connect("localhost", "root", "", "militaria");
// Check connection
if (mysqli_connect_errno()) {
    echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
}
$id = $_REQUEST['id'];
// Perform queries
$req = mysqli_query($con, "SELECT * FROM produkt WHERE id=" . $id . ";");
$data = array();
if (mysqli_num_rows($req) > 0) {
    while ($row = mysqli_fetch_assoc($req)) {
        $data[] = $row;
    }
}

echo json_encode($data);
mysqli_close($con);
