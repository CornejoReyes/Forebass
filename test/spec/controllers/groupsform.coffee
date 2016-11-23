'use strict'

describe 'Controller: GroupsformCtrl', ->

  # load the controller's module
  beforeEach module 'forebassApp'

  GroupsformCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GroupsformCtrl = $controller 'GroupsformCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(GroupsformCtrl.awesomeThings.length).toBe 3
