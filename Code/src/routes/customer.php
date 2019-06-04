<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

error_reporting(-1);
ini_set('display_errors', 1);

$app = new \Slim\App;

// Get All Customers
$app->get('/api/customers', function (Request $request, Response $response) {
    $sql = 'SELECT * FROM `userinformation` ';

    try {
        $db = new db(); // Geting object
        $db = $db->connect(); // Making Connection

        $stmt = $db->query($sql);

        $Customers = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($Customers);
    } catch (PDOException $e) {
        echo '{"error":{"text":"'.$e->getMessage().'"}}';
    }
});

// Get Sinngle Customers
$app->get('/api/customers/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    $sql = "SELECT * FROM `userinformation` WHERE u_id = $id";

    try {
        $db = new db(); // Geting object 
        $db = $db->connect(); // Making Connection

        $stmt = $db->query($sql);

        $Customers = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($Customers);
    } catch (PDOException $e) {
        echo '{"error":{"text":"'.$e->getMessage().'"}}';
    }
});

// to add customer
$app->post('/api/customers/add', function (Request $request, Response $response) {
    
    $password = $request->getParam('password');
    $firstName = $request->getParam('firstName');
    $middleName = $request->getParam('middleName');
    $lastName = $request->getParam('lastName');
    $emailID = $request->getParam('emailID');
    $phoneNumber = $request->getParam('phoneNumber');
    $lastUpdateDatetime = $request->getParam('lastUpdateDatetime');
    $InvaildUpdateAttemptsCount = $request->getParam('InvaildUpdateAttemptsCount');
    $UserPolicyID = $request->getParam('UserPolicyID');
    $QRCode = $request->getParam('QRCode');
    $UPIQRCode = $request->getParam('UPIQRCode');
    $walletAmount = $request->getParam('walletAmount');
    $UPIID = $request->getParam('UPIID');
    
    $sql = "INSERT INTO `userinformation`(
        `password`, 
        `firstName`, 
        `middleName`,
        `lastName`, 
        `emailID`, 
        `phoneNumber`,
        `creationDatetime`, 
        `lastUpdateDatetime`,
        `InvaildUpdateAttemptsCount`,
        `UserPolicyID`,
        `QRCode`, 
        `UPIQRCode`,
        `walletAmount`, 
        `UPIID`
        ) VALUES ( 
        PASSWORD(:password),
        :firstName,
        :middleName,
        :lastName,
        :emailID,
        :phoneNumber,
        CURRENT_TIMESTAMP(),
        :lastUpdateDatetime,
        :InvaildUpdateAttemptsCount,
        :UserPolicyID,
        :QRCode,
        :UPIQRCode,
        :walletAmount,
        :UPIID);"
        ;

    try {
        $db = new db(); // Geting object 
        $db = $db->connect(); // Making Connection

        $stmt = $db->prepare($sql);
        
        $stmt->bindParam(':password',$password);
        $stmt->bindParam(':firstName',$firstName);
        $stmt->bindParam(':middleName',$middleName);
        $stmt->bindParam(':lastName',$lastName);
        $stmt->bindParam(':emailID',$emailID);
        $stmt->bindParam(':phoneNumber',$phoneNumber);
        $stmt->bindParam(':lastUpdateDatetime',$lastUpdateDatetime);
        $stmt->bindParam(':InvaildUpdateAttemptsCount',$InvaildUpdateAttemptsCount);
        $stmt->bindParam(':UserPolicyID',$UserPolicyID);
        $stmt->bindParam(':QRCode',$QRCode);
        $stmt->bindParam(':UPIQRCode',$UPIQRCode);
        $stmt->bindParam(':walletAmount',$walletAmount);
        $stmt->bindParam(':UPIID',$UPIID);

        // echo $stmt->queryString;
        $stmt->execute();

        echo '{"notice":{"text":"Customer Added"}}';

    } catch (PDOException $e) {
        echo '{"error":{"text":"'.$e->getMessage().'"}}';
    }
});

?>