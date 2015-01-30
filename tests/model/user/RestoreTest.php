<?php


class RestoreTest extends PHPUnit_Framework_TestCase
{
    public function test()
    {
        Config::init();
        $user = new User();

        $infoExist = $user->getRestoreInfoByUserId(4);
        $this->assertEquals("array", gettype($infoExist));



        $infoExist = $user->getRestoreInfoByUserId(1);
        $this->assertEquals(false, $infoExist);

    }
} 