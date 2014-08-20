'use strict'

###*
 # @ngdoc directive
 # @name doublespeakApp.directive:dsPaperShadow
 # @description
 # # dsPaperShadow
###
angular.module('doublespeakApp')
  .directive('dsPaperShadow', ->
    template: '<paper-shadow z="{{attrZ}}"></paper-shadow>'
    replace: true
    restrict: 'E'
    link: (scope, element, attrs) ->
        scope.attrZ = attrs.zheight
        console.log attrs.zheight
  )
