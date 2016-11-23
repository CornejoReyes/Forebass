'use strict'

describe 'Controller: GeneralCtrl', ->

  # load the controller's module
  beforeEach module 'forebassApp'

  GeneralCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GeneralCtrl = $controller 'GeneralCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(GeneralCtrl.awesomeThings.length).toBe 3
