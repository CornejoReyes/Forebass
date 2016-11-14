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
    'toastr'
  ]
  .config(($urlRouterProvider,$stateProvider) ->

    $urlRouterProvider.otherwise "/home"
    $stateProvider
    .state 'forebass', {
      abstract: true
      url: '/'
      templateUrl: 'views/main.html'
      controller: 'MainCtrl as vm'
    }

  )
