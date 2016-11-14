'use strict'

class session
    constructor: (API, $q)->
        url = 'auth'
        @login = (user)->
            return API.post url + '/login', user
            .then((res)->
                return $q.resolve res.data
            )

angular.module 'forebassApp'
  .service 'session', session
