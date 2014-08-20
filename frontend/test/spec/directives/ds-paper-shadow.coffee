'use strict'

describe 'Directive: dsPaperShadow', ->

  # load the directive's module
  beforeEach module 'doublespeakApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  ###
  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ds-paper-shadow></ds-paper-shadow>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the dsPaperShadow directive'
  ###
