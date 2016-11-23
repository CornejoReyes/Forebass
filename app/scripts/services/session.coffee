'use strict'

class session
    constructor: (API, $q, locker,$state,toastr)->
        url = 'auth'
        @login = (user)->
            return API.post url + '/login', user
            .then((res)->
                locker.put 'user', res.data.rows
                locker.put 'logged', true
                return $q.resolve res.data
            )

        @register = (user)->
            return API.post url + '/register', user
            .then (res)->
                return $q.resolve res.data
            .catch (err)->
                toastr.error err,'Error'
                return $q.reject err

        @logout = ()->
            locker.clean()
            $state.go 'forebass.login'
            toastr.success "Log out con éxito", "Sesión terminada"


angular.module 'forebassApp'
  .service 'session', session
