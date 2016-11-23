'use strict'

describe 'Service: group', ->

  # load the service's module
  beforeEach module 'forebassApp'

  # instantiate service
  group = {}
  beforeEach inject (_group_) ->
    group = _group_

  it 'should do something', ->
    expect(!!group).toBe true
