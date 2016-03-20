(function() {
    
    angular
        .module('MyApp', [
            'ui.router',
            'ngMaterial',
            'ngMessages',
            // 'material.svgAssetsCache',
            'ngFacebook',
            'ui.bootstrap',
            'Home',            
            'ItemController',
            'AccessoryController',
            'Location'
        ])
        .config(configFunc)
        .factory('SessionService', SessionService)  
        .run(runFunc)

    configFunc.$inject = ['$stateProvider', '$urlRouterProvider', '$facebookProvider'];

    function configFunc($stateProvider, $urlRouterProvider, $facebookProvider) {
        // $rootScope.Cart = [];
        console.log("Config function");

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

    SessionService.$inject = ['$http'];

    function SessionService($http){
        return{
            set: function(key, value){
                return sessionStorage.setItem(key, value);
            },
            get: function(key){
                return sessionStorage.getItem(key);
            },
            destroy: function(key){
                return sessionStorage.removeItem(key);
            }
        }
    }
    
    runFunc.$inject = ['SessionService', '$rootScope','$http'];
    function runFunc(SessionService, $rootScope, $http) {
        console.log("Run function");
        if (SessionService.get('login')==null){
            $rootScope.isLogin  = false;
        }
        else {
            $rootScope.isLogin = true;
            
            var req = {
                method: 'GET',
                url : 'http://localhost:2393/api/Customer/' + SessionService.get('login'),
                headers: {
                        'Content-Type': 'application/json'
                }
            }

            $http(req).then(
                function success(response) {
                    // console.log(response);
                    $rootScope.Customer = response.data;
                    $rootScope.Cart     = [];
                },
                function error(response) {
                    console.log("error");
                }
            );            
        }
    }

})();