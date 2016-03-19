(function() {
    /**
     *  Module
     *
     * Description
     */
    'use strict';
    angular
        .module('ItemController')
        .factory('DataService', DataService);

    DataService.$inject = ['$http', '$stateParams'];

    function DataService($http, $stateParams) {
        return {
            getData: getData,
            getphuKien: getphuKien
        }

        function getData() {
            // console.log($stateParams.type + " " + $stateParams.ID);
            return $http.get('http://localhost:2393/api/' + $stateParams.type +'/' + $stateParams.ID)
                .success(getComplete);
        }

        function getphuKien() {
            return $http.get('../data/phu-kien/phu-kien.json')
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
        .controller('ItemDetailController', ItemDetailController)
        .filter('comma2dot', comma2dot)

    function comma2dot() {
        return function(input) {
            var ret = (input) ? input.replace(/,/g, ".") : null;
            return ret;
        };
    }

    ItemDetailController.$inject = ['$scope', 'DataService', '$uibModal', '$stateParams' ,'$rootScope'];

    function ItemDetailController($scope, DataService, $uibModal, $stateParams, $rootScope) {
        var vm               = this;
        vm.Item              = {};
        vm.type              = $stateParams.type;
        vm.sale              = sale;
        
        vm.animationsEnabled = true;
        vm.ModalOpen         = ModalOpen;
        vm.index             = 0;
        vm.length            = 0;
        
        vm.next              = NEXT;
        vm.prev              = PREV;
        vm.selectIMG         = selectIMG;
        
        vm.cmts              = [];
        vm.replies           = [];
        
        vm.addCmt            = addCmt;
        vm.addRep            = addRep;
        vm.displayRepForm    = displayRepForm;
        vm.displayRep        = displayRep;
        vm.showRepForm = {
            display: 'none'
        };
        vm.showRep = {
            display: 'none'
        };
        vm.rep;
        vm.cmt;

        //Get Phu Kien        
        var TypePK_laptop = ['tai nghe', 'chuột', 'bàn phím', 'usb', 'loa', 'adapter'];
        var TypePK_phone = ['tai nghe', 'pin dự phòng', 'ốp lưng', 'thẻ nhớ', 'miếng dán'];
        var TypePK_tablet = ['tai nghe', 'pin dự phòng', 'ốp lưng', 'thẻ nhớ', 'miếng dán'];
        vm.PK = [];

        activated_PK();

        function activated_PK() {
            return getPK();
        }

        function getPK() {
            return DataService.getphuKien()
                .success(function(data) {
                    if (vm.type == "Phone") {
                        for (var j = 0; j<data.length; j++){
                            searchPK(data[j], TypePK_phone);
                        }
                    } else if (vm.type == "Laptop") {
                        for (var j = 0; j<data.length; j++){
                            searchPK(data[j], TypePK_laptop);
                        }
                    } else {
                        for (var j = 0; j<data.length; j++){
                            searchPK(data[j], TypePK_tablet);
                        }
                    }
                });
        }

        function searchPK(val, type) {
            var lowercaseVal = angular.lowercase(val.name);
            for (var i = 0; i < type.length; i++) {
                if (lowercaseVal.indexOf(angular.lowercase(type[i])) >= 0) {
                    vm.PK.push(val);
                }
            }
        }

        //Get Item
        activated();

        function activated() {
            return getItem();
        }

        function getItem() {
            return DataService.getData()
                .success(function(data) {
                    vm.Item = data;
                    vm.Item.slide = vm.Item.slide.split(',');
                    vm.Item.images = vm.Item.images.split(',');
                    vm.length = vm.Item.images.length;
                    // console.log(vm.Item);
                    // console.log(vm.Item);
                });
        }

        // Comment
        function addCmt(phone) {
            vm.cmts.push(vm.cmt);
            vm.showRep = {
                display: 'none'
            };
            vm.showRepForm = {
                display: 'none'
            };
            vm.cmt = null;
        }

        function addRep(phone) {
            vm.replies.push(vm.rep);
            vm.showRep = {
                display: 'block'
            };
            vm.rep = null;
        }

        function displayRepForm() {
            vm.showRepForm = {
                display: 'block'
            };
        }

        function hideRepForm() {
            vm.showRepForm = {
                display: 'none'
            };
        }

        function displayRep() {
            vm.showRep = {
                display: 'block'
            };
        }

        //Modal function
        function ModalOpen() {
            var string = "components/item/detail/" + $stateParams.type + "/ModalDetail.html";
            var modalInstance = $uibModal.open({
                animation: vm.animationsEnabled,
                templateUrl: string,
                controller: ModalInstanceCtrl,
                size: 'md',
                resolve: {
                    Item: function() {
                        return vm.Item;
                    }
                }
            });
        }

        function ModalInstanceCtrl($scope, $uibModalInstance, Item) {
            $scope.Item = Item;

            $scope.ok = OK;

            $scope.cancel = cancel;

            function OK() {
                $uibModalInstance.close($scope.selected.item);
            }

            function cancel() {
                $uibModalInstance.dismiss('cancel');
            }
        }

        //Images
        function NEXT() {
            if (vm.index == (vm.length - 1)) {
                vm.index = 0;
            } else {
                vm.index = vm.index + 1;
            }
        }

        function PREV() {
            if (vm.index == 0) {
                vm.index = vm.length - 1;;
            } else {
                vm.index = vm.index - 1;
            }
        }

        function selectIMG(indexIMG) {
            vm.index = indexIMG;
        }

        //sale product
        function sale(item) {
            if ($rootScope.Customer != null){
                var modalInstance = $uibModal.open({
                    animation: vm.animationsEnabled,
                    templateUrl: 'components/item/detail/saleModal.html',
                    controller: SaleModalInstanceCtrl,
                    controllerAs: 'vm',
                    size: 'md',
                    resolve: {
                        Item: function() {
                            return item;
                        }
                    }
                });
            }
            else {
                var modalInstance = $uibModal.open({
                    animation: vm.animationsEnabled,                
                    controller: AlertController
                }); 
            }

        }

        function AlertController($scope, $mdDialog, $mdMedia){
            $scope.status = '  ';
            $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
        }

        function SaleModalInstanceCtrl($scope, $uibModalInstance, Item, $window, $rootScope) {
            var sale     = this;
            sale.name    = $rootScope.Customer.FullName;
            sale.address = $rootScope.Customer.Address;
            sale.phone   = $rootScope.Customer.SDT;
            sale.Email   = $rootScope.Customer.Email;                       
            sale.Order   = Order;           
            sale.Item    = Item;          
            sale.ok      = OK;        
            sale.cancel  = cancel;            

            function OK() {
                $uibModalInstance.close(sale.selected.item);
            }

            function cancel() {
                $uibModalInstance.dismiss('cancel');
            }

            function Order () {
                $window.alert("Đặt hàng thành công. Đơn đặt hàng đã gửi đến bạn");
                cancel();
            }
        }
    }

})();
