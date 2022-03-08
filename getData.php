<?php

    $con=mysqli_connect("localhost","my_user","my_password","my_db");
    // Check connection
    if (mysqli_connect_errno())
    {
    echo "Nie udało się połączyć z bazą danych: " . mysqli_connect_error();
    }

    // Perform queries
    mysqli_query($con,"SELECT * FROM kategoria");

    mysqli_close($con);

?>