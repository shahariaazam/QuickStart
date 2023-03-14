<?php

declare(strict_types=1);

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    private App\Example $example;

    public function setUp(): void
    {
        $this->example = new App\Example();
    }

    public function testHello()
    {
        $this->assertSame("hi", $this->example->hello());
    }

    /**
     * @dataProvider dataProviderForAddition
     *
     * @return void
     */
    public function testAddition(int $numberOne, int $numberTwo, int $expectedResult)
    {
        $this->assertSame($expectedResult, $this->example->addition($numberOne, $numberTwo));
    }

    public function dataProviderForAddition() :array
    {
        return [
            'two integer' => [
                1,
                2,
                3
            ],
            'one positive number and one negative number' => [
                1,
                -2,
                -1
            ],
            'one positive large number than second number' => [
                -1,
                2,
                1
            ]
        ];
    }
}
