<?php
return [
    "acl" => [
        'home' => [
            'index' => ['all'],
            'postlist' => ['all'],
            'pricing' => ['all'],
            'terms' => ['all'],
            'about' => ['all'],
            'postdetail' => ['all'],
            'addpost' => ['user', 'admin'],
            'imagedownload' => ['user', 'admin']
        ],
        'user' => [
            'login' => ['all'],
            'registration' => ['guest'],
            'logout' => ['user', 'admin'],
            'plan' => ['all'],
            'paypal' => ['all'],
            'confirm' => ['all'],
            'restore' => ['guest'],
            'profile' => ['all'],
            'editprofile' => ['user', 'admin'],
        ],
        'error' => [
            'index' => ['all'],
            'error404' => ['all'],
            'error403' => ['all'],
        ],
    ],
];