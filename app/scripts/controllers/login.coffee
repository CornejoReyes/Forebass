'use strict'

class LoginCtrl
    constructor: ($state,session, settings,locker,toastr)->
        vm = this
        vm.appName = settings.appName
        vm.user =
            username: null
            password: null
        vm.login = ()->
            vm.user.rol = 1
            session.login(vm.user)
            .then((res)->
                $state.go 'forebass.dashboard.general'
                toastr.info res.msg, 'Éxito'
            )
            .catch((err)->
                toastr.error err, 'Error'
            )

        vm.register = ()->
            vm.user.rol = 1
            session.register(vm.user)
            .then (res)->
                toastr.success res.msg, 'Éxito'
                vm.user =
                    name: null
                    lastname: null
                    username: null
                    password: null
                    email: null

angular.module 'forebassApp'
    .controller 'LoginCtrl', LoginCtrl
    .config(($stateProvider)->
            $stateProvider
            .state 'forebass.login', {
                url: 'login'
                controller: 'LoginCtrl as vm'
                templateUrl: 'views/login.html'
            }
            .state 'forebass.register',
                url: 'register'
                controller: 'LoginCtrl as vm'
                templateUrl: 'views/register.html'

        )
