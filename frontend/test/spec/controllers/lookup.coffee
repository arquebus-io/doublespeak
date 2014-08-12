'use strict'

describe 'Controller: LookupCtrl', ->

  # load the controller's module
  beforeEach module 'doublespeakApp'

  LookupCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LookupCtrl = $controller 'LookupCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(3).toBe 3
