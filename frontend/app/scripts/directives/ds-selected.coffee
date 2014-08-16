'use strict'

###*
 # @ngdoc directive
 # @name doublespeakApp.directive:dsSelected
 # @description
 # # dsSelected
###
angular.module('doublespeakApp')
  .directive('dsSelected', ->
    restrict: 'A'
    link: (scope, element, attrs) ->
        element[0].selected = attrs.dsSelected
  )
