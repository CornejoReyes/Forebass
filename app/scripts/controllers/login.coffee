'use strict'

class LoginCtrl
    constructor: (session, settings)->
        vm = this
        vm.appName = settings.appName
        vm.user =
            username: null
            password: null
        vm.login = ()->
            vm.user.rol = 1
            session.login(vm.user)
            .then((res)->
                vm.show = res
            )
            .catch((err)->
                vm.show = err
            )

angular.module 'forebassApp'
    .controller 'LoginCtrl', LoginCtrl
    .config(($stateProvider)->
            $stateProvider
            .state 'forebass.login', {
                url: 'login'
                controller: 'LoginCtrl as vm'
                templateUrl: 'views/login.html'
            }
        )
