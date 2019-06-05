<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// error_reporting(-1);
// ini_set('display_errors', 1);

$app = new \Slim\App;

$app->post('/api/Login', function (Request $request, Response $response) {
    
    $username = $request->getParam('username');
    $password = $request->getParam('password');
    $language = $request->getParam('language');

    $sql = "call USP_login('$username','$password','$language')";

    try {
        $db = new db(); // Geting object 
        $db = $db->connect(); // Making Connection

        $stmt = $db->query($sql);
        $resultSet = $stmt->fetchAll(PDO::FETCH_OBJ);

        echo json_encode($resultSet);

    } catch (PDOException $e) {
        echo '{"error":{"text":"'.$e->getMessage().'"}}';
    }
});

?>