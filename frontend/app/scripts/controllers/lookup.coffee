'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:LookupCtrl
 # @description
 # # LookupCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'LookupCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
