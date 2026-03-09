<?php

require_once "../config_loader.php";

$clientMac = $_POST['clientMac'] ?? '';
$minutes = intval($_POST['minutes']);

if ($clientMac == '' || $minutes <= 0) {
    echo json_encode(["status"=>"error"]);
    exit;
}

$expire = $minutes * 60 * 1000 * 1000; // microseconds

$loginData = [
    "name" => OPERATOR_USERNAME,
    "password" => OPERATOR_PASSWORD
];

$headers = [
    "Content-Type: application/json",
    "Accept: application/json"
];

$ch = curl_init();

curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_COOKIEJAR, COOKIE_FILE_PATH);
curl_setopt($ch, CURLOPT_COOKIEFILE, COOKIE_FILE_PATH);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

curl_setopt(
    $ch,
    CURLOPT_URL,
    "https://" . CONTROLLER_IP . ":" . CONTROLLER_PORT . "/" . CONTROLLER_ID . "/api/v2/hotspot/login"
);

curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($loginData));

$res = curl_exec($ch);
$resObj = json_decode($res);

if ($resObj->errorCode != 0) {
    echo json_encode(["status"=>"login_failed"]);
    exit;
}

$token = $resObj->result->token;

$authInfo = [
    "clientMac" => $clientMac,
    "site" => "Default",
    "time" => $expire,
    "authType" => 4
];

$headers[] = "Csrf-Token: ".$token;

curl_setopt(
    $ch,
    CURLOPT_URL,
    "https://" . CONTROLLER_IP . ":" . CONTROLLER_PORT . "/" . CONTROLLER_ID . "/api/v2/hotspot/extPortal/auth"
);

curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($authInfo));
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

$res = curl_exec($ch);

curl_close($ch);

echo $res;