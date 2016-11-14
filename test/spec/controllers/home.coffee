'use strict'

describe 'Controller: HomeCtrl', ->

  # load the controller's module
  beforeEach module 'forebassApp'

  HomeCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    HomeCtrl = $controller 'HomeCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(HomeCtrl.awesomeThings.length).toBe 3
