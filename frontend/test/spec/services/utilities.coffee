'use strict'

describe 'Service: utilities', ->

  # load the service's module
  beforeEach module 'doublespeakApp'

  # instantiate service
  utilities = {}
  beforeEach inject (_utilities_) ->
    utilities = _utilities_

  it 'should do something', ->
    expect(!!utilities).toBe true
