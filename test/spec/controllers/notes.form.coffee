'use strict'

describe 'Controller: NotesFormCtrl', ->

  # load the controller's module
  beforeEach module 'forebassApp'

  NotesFormCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NotesFormCtrl = $controller 'NotesFormCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(NotesFormCtrl.awesomeThings.length).toBe 3
