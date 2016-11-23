'use strict'

describe 'Controller: DashboardCtrl', ->

  # load the controller's module
  beforeEach module 'forebassApp'

  DashboardCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DashboardCtrl = $controller 'DashboardCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(DashboardCtrl.awesomeThings.length).toBe 3
