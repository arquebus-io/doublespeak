'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:IndexCtrl
 # @description
 # # IndexCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'IndexCtrl', ['$scope', '$location', ($scope, $location) ->
    $scope.selectedTab = $location.path()
    $scope.navigateTo = (url)->
        $location.path(url)
  ]
