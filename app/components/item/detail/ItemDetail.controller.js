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
            getphuKien: getphuKien,
            getComment: getComment
        }

        function getData() {
            return $http.get('http://localhost:2393/api/' + $stateParams.type + '/' + $stateParams.ID)
                .success(getComplete);
        }

        function getComment(){
            return $http.get('http://localhost:2393/api/Comment/' + $stateParams.ID)
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

    ItemDetailController.$inject = ['$scope', 'DataService', '$uibModal', '$stateParams', '$rootScope',
        '$window', '$http'];

    function ItemDetailController($scope, DataService, $uibModal, $stateParams, $rootScope, $window,$http) {
        var vm               = this;
        vm.Item              = {};
        vm.type              = $stateParams.type;
        vm.sale              = sale;
        
        vm.animationsEnabled = true;
        vm.ModalOpen         = ModalOpen;
        vm.index             = 0;
        vm.length            = 0;
        
        vm.Comment           = [];
        vm.cmt               = "";
        vm.like              = like;
        vm.addCmt            = addCmt;
        
        vm.next              = NEXT;
        vm.prev              = PREV;
        vm.selectIMG         = selectIMG;
        
        vm.AddToCart         = AddToCart;
        vm.RemoveFromCart    = RemoveFromCart;
                

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
                        for (var j = 0; j < data.length; j++) {
                            searchPK(data[j], TypePK_phone);
                        }
                    } else if (vm.type == "Laptop") {
                        for (var j = 0; j < data.length; j++) {
                            searchPK(data[j], TypePK_laptop);
                        }
                    } else {
                        for (var j = 0; j < data.length; j++) {
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

        activated_Cmt();

        function activated_Cmt() {
            return getCmt();
        }

        function getCmt(){
            return DataService.getComment()
                .success(function(data) {
                    for (var i = 0; i<data.length; i++){
                        var temp = {
                            CommentID : data[i].CommentID,
                            CustomerID : data[i].Customer.CustomerID,
                            CustomerName: data[i].Customer.FullName,
                            Cmt: data[i].Comment1,
                            like: data[i].Thich
                        }
                        vm.Comment.push(temp);

                    }
                });
        }

        function like(index){
            vm.Comment[index].like = vm.Comment[index].like + 1;
            var req = {
                method: 'PUT',
                url: 'http://localhost:2393/api/Comment/'+vm.Comment[index].CommentID,
                headers: {
                    'Content-Type': 'application/json'
                },
                data: {
                    CommentID : vm.Comment[index].CommentID,
                    CustomerID : vm.Comment[index].CustomerID,
                    ProductID : vm.Item.ID,
                    Comment1 : vm.Comment[index].Cmt,
                    Thich: vm.Comment[index].like
                }
            }
            $http(req).then(
                function seccess(response){
                    // vm.Comment[index] = response.data;
                },
                function error(response){
                    
                }
            );
        }

        function addCmt() {
            var req = {
                method: 'POST',
                url : 'http://localhost:2393/api/Comment',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: {
                    'CustomerID' : $rootScope.Customer.CustomerID,
                    'ProductID'  : vm.Item.ID,
                    'Comment1'   : vm.cmt,
                    'Thich'      : 0
                }
            }
            $http(req).then(
                function success(response){
                    vm.Comment = [];
                    activated_Cmt();
                },
                function error(response){
                    
                }
            );
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

        function AddToCart(item) {
            var BuyItem = {
                ID: item.ID,
                Name: item.Name,
                price: item.price,
                icon: item.icon,
                Quantity: 1,
            }
            if ($rootScope.Customer != null) {
                if (angular.isUndefined( $rootScope.Cart) == false){
                    console.log("new");
                    var check = false
                    for (var i=0; i<$rootScope.Cart.length; i++){
                        if ($rootScope.Cart[i].ID == BuyItem.ID){
                            check = true;
                        }
                    }
                    if (check == false){
                        $rootScope.Cart.push(BuyItem);
                    }
                    else{
                        $window.alert("Sản phẩm đã có trong giỏ hàng");
                    }
                }
                else{
                    $rootScope.Cart.push(BuyItem);
                }
            } else {
                $window.alert("Bạn phải đăng nhập để mua hàng");
            }
        }

        function RemoveFromCart(index) {
            $rootScope.Cart[index] = $rootScope.Cart[$rootScope.Cart.length - 1];
            $rootScope.Cart.pop();
        }

        //sale product
        function sale() {
            if ($rootScope.Customer != null) {
                var modalInstance = $uibModal.open({
                    animation: vm.animationsEnabled,
                    templateUrl: 'components/item/detail/saleModal.html',
                    controller: SaleModalInstanceCtrl,
                    controllerAs: 'vm',
                    size: 'lg'
                });
            } else {
                $window.alert("Bạn phải đăng nhập để mua hàng");
            }

        }

        function SaleModalInstanceCtrl($scope, $uibModalInstance, $window, $rootScope, $http) 
        {
            var sale        = this;
            sale.name       = $rootScope.Customer.FullName;
            sale.address    = $rootScope.Customer.Address;
            sale.phone      = $rootScope.Customer.SDT;
            sale.Email      = $rootScope.Customer.Email;
            sale.Order      = Order;
            sale.Item       = $rootScope.Cart;
            sale.ok         = OK;
            sale.cancel     = cancel;
            sale.TotalPrice = 0;
            var CurrentDate = new Date();

            for (var i = 0; i< $rootScope.Cart.length; i++){
                sale.TotalPrice = sale.TotalPrice + ($rootScope.Cart[i].price * $rootScope.Cart[i].Quantity);
            }
            
            sale.RequiredDate = new Date(
                CurrentDate.getFullYear(),
                CurrentDate.getMonth(),
                CurrentDate.getDate()+1);

            sale.maxDate = new Date(
                CurrentDate.getFullYear(),
                CurrentDate.getMonth(),
                CurrentDate.getDate()+4);
            // sale.ContinueShopping = ContinueShopping;

            function OK() {
                $uibModalInstance.close(sale.selected.item);
            }

            function cancel() {
                $uibModalInstance.dismiss('cancel');
            }

            function Order() {
                var Orderdetail = [];                
                for (var i = 0; i< $rootScope.Cart.length; i++){
                    
                    var detail = {
                        ProductsID: $rootScope.Cart[i].ID,
                        ProductName: $rootScope.Cart[i].Name,
                        Prices: $rootScope.Cart[i].price * $rootScope.Cart[i].Quantity,
                        Quantity: $rootScope.Cart[i].Quantity,
                        Icon: $rootScope.Cart[i].icon,
                        Discount: 0
                    }
                    Orderdetail.push(detail);
                }
                var Order = {
                    OrderDetails: Orderdetail,
                    CustomerID : $rootScope.Customer.CustomerID,
                    OrderDate : CurrentDate.getDate() + "/" + CurrentDate.getMonth() + "/" + CurrentDate.getFullYear() + " " + CurrentDate.getHours()
                                +":" + CurrentDate.getMinutes() + ":"+ CurrentDate.getSeconds(),
                    RequriedDate: sale.RequiredDate.getDate() + "/" + sale.RequiredDate.getMonth() + "/" + sale.RequiredDate.getFullYear(),
                }
                console.log(Order);
                var req = {
                    method: 'POST',
                    url: 'http://localhost:2393/api/Order',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: Order
                }
                $http(req).then(
                    function sucess(response){
                        $rootScope.Cart = [];                        
                        cancel();
                        $window.alert("Đặt hàng thành công")
                    },
                    function error(response){

                    }
                );
                console.log("Đang xử lý");
            }
        }
    }

})();