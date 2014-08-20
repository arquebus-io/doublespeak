'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:IndexCtrl
 # @description
 # # IndexCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'IndexCtrl', ['$scope', '$location', '$rootScope', ($scope, $location, $rootScope) ->
    $scope.selectedTab = $location.path()
    $scope.navigateTo = (url)->
        $location.path(url)

    $rootScope.$on("$locationChangeSuccess", (newVal)->
        $scope.selectedTab = $location.path()
    )
  ]
