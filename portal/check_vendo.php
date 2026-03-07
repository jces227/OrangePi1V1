<?php

$lock_file = "/tmp/vendo.lock";

if (file_exists($lock_file)) {
    echo "BUSY";
    exit;
}

// create lock
file_put_contents($lock_file, "locked");

echo "OK";