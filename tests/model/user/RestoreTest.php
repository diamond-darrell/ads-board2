<?php

include ('../../../framework/core/Model.php');
include ('../../../framework/classes/Database.php');
include ('../../../framework/classes/Config.php');
include ('../../../framework/classes/Exceptions.php');
include ('../../../application/models/User.php');

class RestoreTest extends PHPUnit_Framework_TestCase
{
    public function test()
    {
        Config::init(getenv('APP_ENV'));

        $user = new User();

        $infoExist = $user->getRestoreInfoByUserId(4);
        $this->assertEquals(true, $infoExist);

        $infoExist = $user->getRestoreInfoByUserId(0);
        $this->assertEquals(false, $infoExist);
    }
} 