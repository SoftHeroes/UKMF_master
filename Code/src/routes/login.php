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
        $resultSet = $stmt->fetchAll();
        if(count($resultSet) > 0 )
        {
            $rows = $resultSet[0];
        
            $ResponseArray = array( 'Code' => $rows['Code'],
                                    'ErrorFound' => $rows['ErrorFound'],
                                    'Message' => $rows['Message'],
                                    'version' => $rows['version'],
                                    'language' => $rows['language']
                                    );
    
            return $response->withJson($ResponseArray,200);
        }
        else
        {
            $ResponseArray = array( 'Code' => 'ERR00000',
                                    'ErrorFound' => 'YES',
                                    'Message' => 'Invalid Exception.',
                                    );

            return $response->withJson($ResponseArray,200);
        }

    } catch (PDOException $e) {
        $ResponseArray = array( 'Code' => 'ERR00000',
                                'ErrorFound' => 'YES',
                                'Message' => 'Invalid Exception.',
                                );
        
        return $response->withJson($ResponseArray,501);
    }
});

?>