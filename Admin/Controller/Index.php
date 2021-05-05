<?php

namespace Admin\Controller;
require_once '../../DB/MysqliDb.php';
require_once '../../vendor/autoload.php';
require_once 'DatabaseFunc.php';
require_once 'AppParent.php';
require_once 'Employee.php';
//use Exception;
//use ArrayObject;
//session_start();

/*
class Index extends AppParent{
    public function __construct() {
        
    }
    public function dumpResponse ($response) {
        ob_clean();
        echo json_encode($response);
        return true;
    }
}
*/

if (strcmp($_POST["func"] , "loginFunction") == 0) {
    $login = new DatabaseFunc();
    AppPArent::dumpResponse( $login->login());

    
}

