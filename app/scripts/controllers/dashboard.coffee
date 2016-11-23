'use strict'

class DashboardCtrl
    constructor: ($state, settings,session)->
        vm = this
        vm.title = $state.current.data.title
        vm.app = settings.appName
        vm.logout = ()->
            session.logout()

class DasboardConfig
    constructor: ($stateProvider)->
        $stateProvider
        .state 'forebass.dashboard',
            url: 'dashboard'
            controller: 'DashboardCtrl as vm'
            templateUrl: 'views/dashboard.html'
            data :
                title: 'Dashboard'

angular.module 'forebassApp'
            .config(DasboardConfig)
            .controller 'DashboardCtrl',DashboardCtrl
