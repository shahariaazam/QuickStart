<?php

declare(strict_types=1);

namespace App;

class Example
{
    public function hello(): string
    {
        return 'hi';
    }

    public function addition(int $numberOne, int $numberTwo): int
    {
        return $numberOne + $numberTwo;
    }
}
