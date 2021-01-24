<?php
	require("constants.php");
	$connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
    //mysqli_query("SET names cp1251"); // подключение к базе данных
	if ( $connection == false) {
		echo 'Не удалось подключение к базе данных!<br>';
		echo mysqli_connect_error();
		exit();
	}
?>