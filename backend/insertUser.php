<?php

    $con=mysqli_connect("localhost","my_user","my_password","my_db");
    // Check connection
    if (mysqli_connect_errno())
    {
    echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
    }
    $wojewodztwo = "";
    $miasto = "";
    $ulica = "";
    $nrulicy = 1;
    // Perform queries
    $query = "INSERT INTO adres SET wojewodztwo='".$wojewodztwo."', miasto='".$miasto."', ulica='".$ulica."', numer_ulicy='".$nrulicy."';";
    mysqli_query($con, $query);

    mysqli_close($con);

?>