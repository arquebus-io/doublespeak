'use strict'

describe 'Service: dbHelper', ->

  # load the service's module
  beforeEach module 'doublespeakApp'

  # instantiate service
  dbHelper = {}
  beforeEach inject (_dbHelper_) ->
    dbHelper = _dbHelper_

  it 'should do something', ->
    expect(!!dbHelper).toBe true
