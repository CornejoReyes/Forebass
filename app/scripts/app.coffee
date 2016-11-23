'use strict'

###*
 # @ngdoc overview
 # @name forebassApp
 # @description
 # # forebassApp
 #
 # Main module of the application.
###
angular
    .module 'forebassApp', [
        'ngAnimate',
        'ngCookies',
        'ngResource',
        'ngRoute',
        'ngSanitize',
        'ngTouch',
        'ui.router',
        'ui.bootstrap',
        'angular-locker',
        'toastr',
        'ui.select'
    ]
    .config(($urlRouterProvider,$stateProvider,toastrConfig,lockerProvider) ->

        $urlRouterProvider.otherwise "/home"
        $stateProvider
        .state 'forebass', {
            abstract: true
            url: '/'
            templateUrl: 'views/main.html'
            controller: 'MainCtrl as vm'
        }
        angular.extend toastrConfig,
            autoDismiss: false
            containerId: 'toast-container'
            maxOpened: 0
            newestOnTop: true
            positionClass: 'toast-top-right'
            preventDuplicates: false
            preventOpenDuplicates: false
            target: 'body'
        lockerProvider.defaults
            driver: 'local'
            namespace: 'forebass'
            separator: '_'
            eventsEnabled: true
            extend: {}

    )
    .run( ()->

    )
