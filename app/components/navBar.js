(function() {
    'use strict';
    angular
        .module('MyApp')
        .controller('navBarCtrl', navBarCtrl)
    
    function navBarCtrl(){
        var vm      = this;
        vm.login    = login;
        vm.register = register;

        function login(){
            console.log("login");
        }    

        function register(){
            console.log("register");
        }
    }
})();