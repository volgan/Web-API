(function() {
    
    angular
        .module('MyApp', [
            'ui.router',
            'ngMaterial',
            'ngMessages',
            'ngFacebook',
            'ui.bootstrap',
            'Home',            
            'ItemController',
            'AccessoryController',
            'Location'
        ])
        .config(configFunc)
        .run(runFunc)

    configFunc.$inject = ['$stateProvider', '$urlRouterProvider', '$facebookProvider'];

    function configFunc($stateProvider, $urlRouterProvider, $facebookProvider) {
        $facebookProvider.setAppId('1514033005563978');

        $urlRouterProvider.otherwise("/");

        $stateProvider
            .state('Main', {
                url: '/',
                templateUrl: 'components/main.html',
                controller: 'MainController',
                controllerAs: 'vm'
            })
            .state('Accessories', {
                url: '/phu-kien',
                templateUrl: 'components/accessories/list/Accessory-list.html',
                controller: 'AccessoryListController',
                controllerAs: 'vm'
            })
            .state('AccessoriesDetails', {
                url: '/phu-kien/:PKID',
                templateUrl: 'components/accessories/detail/Accessory-detail.html',
                controller: 'PKController',
                controllerAs: 'vm'
            })       
            .state('ItemList', {
                url: '/Item/:type',
                templateUrl: 'components/item/list/list.html',
                controller: 'ItemListController',
                controllerAs: 'vm'
            })
            .state('ItemDetail', {
                url:'/Item/:type/:ID',
                templateUrl: 'components/item/detail/itemDetail.html',
                controller: 'ItemDetailController',
                controllerAs: 'vm'
            })
            .state('Location', {
                url: '/Location',
                templateUrl: 'components/Location/location.html',
                controller: 'LocationController',
                controllerAs: 'vm'
            })

    }

    function runFunc() {
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/vi_VN/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    }

})();
