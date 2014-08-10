'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
