<?php

require __DIR__ . '/../vendor/autoload.php';

use App\Example;

$object = new Example();
echo $object->hello();
