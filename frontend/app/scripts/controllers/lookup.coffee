'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:LookupCtrl
 # @description
 # # LookupCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'LookupCtrl', ['$scope', 'Dialog', ($scope, Dialog) ->
      $scope.search = ->
        Dialog.getDialogsFromWord($scope.term, 'en', 50).then((dialogs)->
            $scope.dialogs = dialogs
        )
  ]
