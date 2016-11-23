'use strict'

describe 'Controller: NotesCtrl', ->

  # load the controller's module
  beforeEach module 'forebassApp'

  NotesCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NotesCtrl = $controller 'NotesCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(NotesCtrl.awesomeThings.length).toBe 3
