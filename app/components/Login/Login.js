(function() {
    /**
     *  Module
     *
     * Description
     */
    angular
        .module('MyApp')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$scope', '$facebook', '$uibModal', '$http', '$rootScope', 'SessionService'];

    function LoginController($scope, $facebook, $uibModal, $http, $rootScope, SessionService) {
        var vm               = this;
        vm.isOpen1           = false;
        vm.isOpen2           = false;
        vm.Email             = "";
        vm.Name              = "";
        vm.Logout            = Logout;
        vm.animationsEnabled = true;
        vm.register          = register;
        vm.Login             = Login;
        vm.Edit              = Edit;
        vm.isLogin           = $rootScope.isLogin;
        $scope.sessionLogin  = SessionService.get('login');


        function Logout() {
            SessionService.destroy('login');
            vm.isLogin          = false;
            $rootScope.Customer = null;
        };

        function register() {
            // console.log("register");
            var modalInstance = $uibModal.open({
                animation: vm.animationsEnabled,
                templateUrl: 'components/Login/RegisterModal.html',
                controller: RegisterModalCtr,
                controllerAs: 'vm',
                size: 'md',
                resolve: {
                    Tablet: function() {
                        return vm.Tablet;
                    }
                }
            });
        }

        function Edit(){
            var modalInstance = $uibModal.open({
                animation: vm.animationsEnabled,
                templateUrl: 'components/InfoAcount/EditInfo.html',
                controller: EditModalCtr,
                controllerAs: 'vm',
                size: 'lg'
            });
        }

        function EditModalCtr(){
            
        }

        
        function Login() {
            var modalInstance = $uibModal.open({
                animation: vm.animationsEnabled,
                templateUrl: 'components/Login/LoginModal.html',
                controller: LoginModalCtrl,
                controllerAs: 'login',
                size: 'md',
                resolve: {
                    Tablet: function() {
                        return vm.Tablet;
                    }
                }
            });
        }

        function RegisterModalCtr($scope, $uibModalInstance, $rootScope, SessionService) {
            var register        = this;
            register.isconfirm  = false;
            register.show       = false;
            register.id         = "";
            register.name       = "";
            register.Email      = "";
            register.Pass       = "";
            register.RePass     = "";
            register.Register   = Register;
            register.cancel     = cancel;
            register.compare    = compare;
            register.Address    = "";
            register.Phone      = "";
            register.checkEmail = checkEmail;
            register.ErrorEmail = false;            
            register.ID         = "";
            register.showError  = false;

            function cancel() {
                $uibModalInstance.dismiss('cancel');
            }
    
            function checkEmail() {
                var req = {
                    method: 'POST',
                    url: 'http://localhost:2393/api/Customer',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: {
                        "Email": register.Email,
                        "Password": "null",
                        "FullName": "",
                        "SDT": "",
                        "Address": ""
                    }
                }
                if (register.Email.length != 0) {
                    $http(req).then(
                        function success(response) {
                            register.ID         = response.data.CustomerID;                            
                            register.ErrorEmail = true;
                            register.showError  = false;
                        },
                        function error(response) {
                            console.log("Error");
                            register.ErrorEmail = false;
                            register.showError  = true;
                        }
                    );
                }
            }

            function Register() {
                if (register.show == false && register.isconfirm == true) {
                    
                    var NewPerson = {
                            // CustomerID: register.ID,
                            Email: register.Email,
                            Password: register.Pass,
                            FullName: register.name,
                            SDT: register.Phone,
                            Address: register.Address
                        }
                        // NewPerson = NewPerson.toJSON();
                    angular.toJson(NewPerson);
                    req = {
                        method: 'POST',
                        url: 'http://localhost:2393/api/Customer',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        data: NewPerson,
                    };

                    $http(req).then(
                        function success(response) {
                            $rootScope.Customer = NewPerson;
                            vm.isLogin          = true;
                            $rootScope.Cart     = [];
                            SessionService.set('login', response.data.CustomerID);
                            cancel();
                        },
                        function error(response) {

                        }
                    );
                }
            }

            function compare($event) {
                // console.log($event.keyCode);
                if ((($event.keyCode >= 48) && ($event.keyCode <= 57)) || (($event.keyCode >= 65) && ($event.keyCode <= 90))) {
                    // console.log(register.isconfirm);
                    // console.log("RePass: " + register.RePass + " Pass: " + register.Pass);
                    if (register.Pass == register.RePass) {

                        register.isconfirm = true;
                        register.show = false;
                        // console.log(register.isconfirm);
                    } else {
                        register.show = true;
                    }

                }
            }
        }

        function LoginModalCtrl($scope, $uibModalInstance,$rootScope) {
            var login        = this;
            login.Email      = "";
            login.LOGIN      = LOGIN;
            login.cancel     = cancel;
            login.checkLogin = false;

            function cancel() {
                $uibModalInstance.dismiss('cancel');
            }

            function LOGIN() {
                var Customer = 
                    {                        
                        Email: login.Email,
                        Password: login.Pass,
                        FullName: "",
                        SDT: "",
                        Address: ""
                    };
                        // NewPerson = NewPerson.toJSON();
                    angular.toJson(Customer);
                    var req = {
                    method: 'POST',
                    url: 'http://localhost:2393/api/Customer',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: Customer
                }

                    $http(req).then(
                        function success(response) {
                            $rootScope.Customer = response.data;
                            vm.isLogin          = true;
                            login.checkLogin    = false;
                            $rootScope.Cart     = [];
                            cancel();
                            SessionService.set('login', response.data.CustomerID);
                        },
                        function error(response) {
                            login.checkLogin = true;
                        }
                    );
            }

        }
    }
})();
