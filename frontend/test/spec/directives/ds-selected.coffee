'use strict'

describe 'Directive: dsSelected', ->

  # load the directive's module
  beforeEach module 'doublespeakApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

###
  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ds-selected></ds-selected>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the dsSelected directive'
###
