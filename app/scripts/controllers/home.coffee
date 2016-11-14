'use strict'
class HomeCtrl
    constructor: ()->
        @hola = ()->
            console.log "Como estan?"


angular.module 'forebassApp'
    .controller 'HomeCtrl', HomeCtrl
    .config(($stateProvider)->
        $stateProvider
        .state 'forebass.home', {
            url: 'home'
            controller: 'HomeCtrl as vm'
            templateUrl: 'views/home.html'
        }
    )
