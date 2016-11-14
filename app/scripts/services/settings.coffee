'use strict'

settings =
    baseUrl: 'http://localhost:8000/api/'
    appName: 'Forebass'

angular.module 'forebassApp'
    .constant 'settings', settings
