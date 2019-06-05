<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// error_reporting(-1);
// ini_set('display_errors', 1);

require '../vendor/autoload.php';
require '../src/config/db.php';

$app = new \Slim\App;

require '../src/routes/customer.php';
require '../src/routes/login.php';

$app->run();