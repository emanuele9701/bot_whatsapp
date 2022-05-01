<?php

include_once __DIR__ . "/class/Connection.php";
include_once __DIR__ . "/class/Table.php";


if ($_SERVER['REMOTE_ADDR'] == "::1" || $_SERVER['REMOTE_ADDR'] == "127.0.0.1") {
    $conn = new Connection('mysql', 'gmaps', 'localhost', 'root', '');
} else {
    $conn = new Connection('mysql', 'my_gmapsextractor', 'localhost', 'gmapsextractor', '');
}
