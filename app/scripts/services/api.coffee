'use strict'

###*
# @ngdoc service
# @name sytevApp.API
# @description
# # API
# Factory in the sytevApp.
###

angular.module('forebassApp').factory 'API', ($http, $q, settings) ->
    basePath = settings.baseUrl

    makeRequest = (verb, uri, data, config) ->
        verb = verb.toLowerCase()
        #start with the uri
        httpArgs = [ basePath + uri ]
        if verb.match(/post|put/)
            httpArgs.push data
        headers = headers: {}
        if angular.isObject(config)
            angular.merge headers, config
        httpArgs.push headers
        return $http[verb].apply(null, httpArgs).then((data) ->
            data
            # update angular's scopes
            # $rootScope.$$phase || $rootScope.$apply();
        ).catch (err) ->
            console.log err
            if err.data and err.data.msg
                $q.reject err.data.msg
            else if err.status == -1
                $q.reject 'Sin conexión a los servicios'
            else
                $q.reject 'Se produjo un error'

    return {
        get: (uri, config) ->
            makeRequest 'get', uri, null, config
        post: (uri, data, config) ->
            makeRequest 'post', uri, data, config
        put: (uri, data, config) ->
            makeRequest 'put', uri, data, config
        delete: (uri) ->
            makeRequest 'delete', uri

    }
