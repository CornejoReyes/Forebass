'use strict'
class MainCtrl
	constructor: ()->
		@hola = ()->
			console.log "Como estan?"


angular.module 'forebassApp'
  .controller 'MainCtrl', MainCtrl
