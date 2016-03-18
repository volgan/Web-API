(function() {
    /**
     *  Module
     *
     * Description
     */
    'use strict';
    angular
        .module('ItemController', [])
        .factory('ItemService', ItemService);

    ItemService.$inject = ['$http', '$stateParams'];

    function ItemService($http, $stateParams) {
        return {
            getItems: getItems
        }

        function getItems() {
            return $http.get('http://localhost:2393/api/'+$stateParams.type)
                .success(getComplete);
        }

        function getComplete(response) {
            return response.data;
        }
    }
})();

(function() {
    /**
     *  Module
     *
     * Description
     */
    'use strict';
    angular
        .module('ItemController')
        .controller('ItemListController', ItemListController)
        .filter('comma2dot', comma2dot)

    function comma2dot() {
        return function(input) {
            var ret = (input) ? input.replace(/,/g, ".") : null;
            return ret;
        };
    }

    ItemListController.$inject = ['$scope', 'ItemService', '$stateParams'];

    function ItemListController($scope, ItemService, $stateParams) {
        var vm   = this;
        vm.Items = [];
        vm.price = "price";
        vm.type  = $stateParams.type;

        activated();

        function activated() {
            return getItem();
        }

        function getItem() {
            return ItemService.getItems()
                .success(function(data) {
                    vm.Items = data;
                });
        }
        
    }

})();
