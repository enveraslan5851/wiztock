<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Admin\Controller;
//require "DB/";
//require "Admin\Controller\CoreFunctions as CF";
//require "Admin\Controller";
//require "Admin\Helper\Service as HelperService";
//require 'AppParent.php';
//require 'DB\MysqliDb.php';
require_once '../../DB/MysqliDb.php';
require_once '../../vendor/autoload.php';
use Exception;
use ArrayObject;
session_start();
class DatabaseFunc{
    public $db;
    public function __construct ()
    {
        $servername = "localhost";
        $database   = "wiztock";
        $username   = "root";
        $password   = "GIV5od6EN7LYQeLF";  //GIV5od6EN7LYQeLF     
        $mysqli = new \mysqli ($servername, $username, $password, $database);
        
        $this->db = new \MysqliDb (Array (
                'host' => $servername,
                'username' => $username, 
                'password' => $password,
                'db'=> $database,
//                'port' => 3306,
//                'prefix' => 'my_',
                'charset' => 'utf8'));   
    }
    function dumpResponse ($response) {
        if ( isset($_POST['debug']) && $_POST['debug'] === '1') {
            echo '<pre>';
            echo json_encode($response, JSON_PRETTY_PRINT);
            echo '</pre>';
        } else {
            ob_clean();

            echo json_encode($response);
        }
    
        return true;
    }    
    function test(){

        $this->db->where('email',$_POST['employeeEmail']);
        $checkAdmin = $this->db->get("employee");

        if(count($checkAdmin) !=0 ){
            $response['data']=  "";
            $response['success']  =true;
            $response['errMsg']   =null;
            $response['warnMsg']  ="Bu email adresi daha önce sistem kayıt edilmiştir.";
            $response['errCode']  =0;

            return $this->dumpResponse($response);
        } 
        $data = Array (
            "title"=> $_POST['companyTitle']);
    //        $id = $this->db->insert ('financial_advisor', ['name_surname'=>$nameSurname,'user_name'=>$userName,'password'=>$passw]);
            $id = $this->db->insert ('company', $data);
            
            if(!$id){
                $response['data']=  $resData ;
                $response['success']  = true;
                $response['errMsg']   = $this->db->getLastError();
                $response['warnMsg']  =null;
                $response['errCode']  =0;
    
                return $this->dumpResponse(($response));
            }else{
                $data = Array (
                    "company_id"=> $id,
                    "name_surname"   => $_POST['employeeNameSurname'],
                    "email"    => $_POST['employeeEmail'],
                    "password" => $_POST['emplyeePassword'],
                    "is_main_user" => 1
                );
            
                    $empid = $this->db->insert ('employee', $data);
            
                  
            }
             $resData = array('employeeID' =>  $empid, 'companyID' => $id);

            $response['data']=  $resData ;
            $response['success']  =true;
            $response['errMsg']   =null;
            $response['warnMsg']  =null;
            $response['errCode']  =0;

            return $this->dumpResponse(($response));  
    }   
}

if (isset($_POST['funcTest'])) {
    $ajaxTalep = new DatabaseFunc(); 
    return $ajaxTalep->test();
}
    