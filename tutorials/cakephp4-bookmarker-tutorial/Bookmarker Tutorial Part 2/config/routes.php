<?php

use Cake\Routing\Route\DashedRoute;
use Cake\Routing\RouteBuilder;

return static function (RouteBuilder $routes) {
  
    $routes->setRouteClass(DashedRoute::class);

    $routes->scope(
        '/bookmarks',
        ['controller' => 'Bookmarks'],
        function ($routes) {
            $routes->connect('/tagged/*', ['action' => 'tags']);
        }
    );
    
    $routes->scope('/', function ($routes) {
        // Connect the default home and /pages/* routes.
        $routes->connect('/', [
            'controller' => 'Pages',
            'action' => 'display', 'home'
        ]);
        $routes->connect('/pages/*', [
            'controller' => 'Pages',
            'action' => 'display'
        ]);
    
        // Connect the conventions based default routes.
        $routes->fallbacks();
    });

  
};
