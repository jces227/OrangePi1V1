<?php

require_once "omada.php";

$clientMac = $_POST['clientMac'];
$apMac = $_POST['apMac'];
$ssidName = $_POST['ssidName'];
$radioId24g = $_POST['radioId24g'];
$radioId5g = $_POST['radioId5g'];
$site = $_POST['site'];
$minutes = intval($_POST['minutes']);

if (!$clientMac || !$apMac || !$ssidName || !$radioId24g || !$radioId5g || !$site) {
    echo json_encode([
        "errorCode" => -1,
        "msg" => "Missing required parameters"
    ]);
    exit;
}

$expire = $minutes * 60000; // microseconds

OmadaAPI::login();

/* --- Attempt 1: 5 GHz --- */
$result5 = OmadaAPI::authorize(
    $clientMac,
    $apMac,
    $ssidName,
    $radioId5g,
    $site,
    $expire
);

$res5 = json_decode($result5, true);

if ($res5 && isset($res5['errorCode']) && $res5['errorCode'] === 0) {

    echo json_encode([
        "errorCode" => 0,
        "band" => "5GHz"
    ]);
    exit;

}


/* --- Attempt 2: 2.4 GHz --- */
$result24 = OmadaAPI::authorize(
    $clientMac,
    $apMac,
    $ssidName,
    $radioId24g,
    $site,
    $expire
);

$res24 = json_decode($result24, true);

if ($res24 && isset($res24['errorCode']) && $res24['errorCode'] === 0) {

    echo json_encode([
        "errorCode" => 0,
        "band" => "2.4GHz"
    ]);
    exit;

}


/* --- Both attempts failed --- */

echo json_encode([
    "errorCode" => -2,
    "msg" => "Authorization failed on both 5GHz and 2.4GHz"
]);