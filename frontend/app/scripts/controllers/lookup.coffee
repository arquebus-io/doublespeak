'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:LookupCtrl
 # @description
 # # LookupCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'LookupCtrl', ['$scope', 'Dialog', 'pouchdb', 'Utilities', ($scope, Dialog, pouchdb, Utilities) ->
      $scope.search = ->
          Dialog.getDialogsFromWord($scope.term, 'en').then((dialogs)->
              $scope.dialogs = Utilities.shuffle(dialogs.slice(0,25))
          )
  ]
