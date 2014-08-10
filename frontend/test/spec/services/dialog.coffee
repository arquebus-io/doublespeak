'use strict'

describe 'Service: dialog', ->

  # load the service's module
  beforeEach module 'doublespeakApp'

  # instantiate service
  dialog = {}
  beforeEach inject (_Dialog_) ->
    dialog = _Dialog_

  it 'should do something', ->
    console.log dialog
    expect(!!dialog).toBe true
