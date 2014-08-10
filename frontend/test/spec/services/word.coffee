'use strict'

describe 'Service: word', ->

  # load the service's module
  beforeEach module 'doublespeakApp'

  # instantiate service
  word = {}
  beforeEach inject (_Word_) ->
    word = _Word_

  it 'should do something', ->
    expect(!!word).toBe true
