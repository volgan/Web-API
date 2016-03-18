(function() {
    /**
     *  Module
     *
     * Description
     */
    angular
        .module('MyApp')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$scope', '$facebook', '$uibModal', '$http'];

    function LoginController($scope, $facebook, $uibModal, $http) {
        var vm = this;
        vm.isOpen1 = false;
        vm.isOpen2 = false;
        vm.display = true;
        vm.Avatar = "";
        vm.Email = "";
        vm.Name = "";
        vm.Logout = Logout;
        vm.animationsEnabled = true;
        vm.register = register;
        vm.poseidonLogin = poseidonLogin;
        // vm.display = {display: 'none'};                

        function Logout() {
            vm.Email = "";
            vm.Name = "";
            vm.display = true;
        };

        function register() {
            // console.log("register");
            var modalInstance = $uibModal.open({
                animation: vm.animationsEnabled,
                templateUrl: 'components/Login/RegisterModal.html',
                controller: RegisterModalCtr,
                controllerAs: 'register',
                size: 'md',
                resolve: {
                    Tablet: function() {
                        return vm.Tablet;
                    }
                }
            });
        }

        function poseidonLogin() {
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

        function RegisterModalCtr($scope, $uibModalInstance) {
            var register = this;
            register.isconfirm = false;
            register.show = false;
            register.id = "";
            register.name = "";
            register.Email = "";
            register.Pass = "";
            register.RePass = "";
            register.Register = Register;
            register.cancel = cancel;
            register.compare = compare;
            register.Address = "";
            register.Phone = "";
            register.checkEmail = checkEmail;
            register.ErrorEmail = false;
            register.ID = "";

            angular.toJson()

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
                        "Password": "",
                        "FullName": "",
                        "SDT": "",
                        "Address": ""
                    }
                }
                $http(req).then(
                    function success(response) {                        
                        register.ID = response.data.CustomerID;
                        // $http.delete('http://localhost:2393/api/Customer'+(register.ID))
                        register.ErrorEmail = false;
                    },
                    function error(response) {
                        console.log("Error");
                        register.ErrorEmail = true;
                    }
                );
            }

            function Register() {
                if (register.show == false && register.isconfirm == true) {
                    vm.Avatar  = "../images/User-Login.png";
                    vm.Email   = register.Email;
                    vm.Name    = register.name;
                    vm.display = false;
                    var NewPerson = {
                            CustomerID: register.ID,
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
                        url: 'http://localhost:2393/api/Customer/'+register.ID,
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        data: NewPerson,
                    };

                    $http(req).then(
                        function success(response) {
                            $rootScope.person = NewPerson;
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

        function LoginModalCtrl($scope, $uibModalInstance) {
            var login = this;
            login.Email = "";
            login.LOGIN = LOGIN;
            login.cancel = cancel;

            function cancel() {
                $uibModalInstance.dismiss('cancel');
            }

            function LOGIN() {
                vm.Avatar = "../images/User-Login.png";
                vm.Email = login.Email;
                vm.Name = login.Email;
                vm.display = false;
                cancel();
            }

        }
    }
})();
