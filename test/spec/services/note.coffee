'use strict'

describe 'Service: note', ->

  # load the service's module
  beforeEach module 'forebassApp'

  # instantiate service
  note = {}
  beforeEach inject (_note_) ->
    note = _note_

  it 'should do something', ->
    expect(!!note).toBe true
