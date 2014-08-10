'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
