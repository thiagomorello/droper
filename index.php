<?php

session_start();
error_reporting(E_ALL ^ E_NOTICE);
date_default_timezone_set('America/Sao_Paulo');
setlocale(LC_ALL,'pt_BR');

require('vendor/autoload.php');
require('functions.php');


$factory = new \Database\Connectors\ConnectionFactory();
$db = $factory->make(array(
    'driver'    => 'mysql',
    'host'      => 'localhost',
    'username'  => 'root',
    'password'  => '',
    'database'  => 'droper',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'lazy'      => true,
    'options' => array(
        PDO::MYSQL_ATTR_LOCAL_INFILE    => true,
        PDO::ATTR_EMULATE_PREPARES      => true,
    )
));

//Template Engine
$smarty = new Smarty;
$smarty->template_dir = 'views';
$smarty->compile_dir  = 'cache/compiled';
$smarty->auto_literal = true;

//Global Vars
$baseUrl = str_replace("/index.php","", $_SERVER['PHP_SELF']);
$smarty->assign("baseUrl", $baseUrl);
$smarty->assign("assetsDir", $baseUrl.'/public/assets');

//Routes
$uri = (string) isset($_GET['url']) ? $_GET['url'] : '';
$url = explode("/", $uri);
$key = $url[0] ? $url[0] : 'home';
$action = $url[1] ? $url[1] : 'index';

if(file_exists('./controllers/'.$key.'Controller.php')){
    include('./controllers/'.$key.'Controller.php');
}
else{
    include('./controllers/errorController.php');
}