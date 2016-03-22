(function() {
    'use strict'
    angular
        .module('InfoOrder', [])
        .controller('InfoOrderController', InfoOrderController)
        .filter('comma2dot', comma2dot)

    function comma2dot() {
        return function(input) {
            var ret = (input) ? input.replace(/,/g, ".") : null;
            return ret;
        };
    }

    InfoOrderController.$inject = ['$http', '$rootScope', 'SessionService'];

    function InfoOrderController($http, $rootScope, SessionService) {
        var vm             = this;
        vm.OrderList       = [];
        vm.showOrderDetail = showOrderDetail;    
        vm.show = [];    

        var req = {
                method: 'GET',
                url : 'http://localhost:2393/api/Customer/' + SessionService.get('login'),
                headers: {
                        'Content-Type': 'application/json'
                }
            }
            
        $http(req).then(
            function success(response) {
                for (var i = 0 ; i<response.data.Orders.length; i++){
                    vm.OrderList.push(response.data.Orders[i]);
                    vm.show[i] = false;
                }
            },
            function error(response) {
                console.log("error");
            }
        );    

        function showOrderDetail(index){
            vm.show[index] = !vm.show[index];
        }
    }
})();