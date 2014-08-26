'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:LookupCtrl
 # @description
 # # LookupCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'LookupCtrl', ['$scope', 'Dialog', 'pouchdb', ($scope, Dialog, pouchdb) ->
      $scope.search = ->
        db = pouchdb.create('dialogs')
        db.get($scope.term, false, (err, doc)->
            if err
                Dialog.getDialogsFromWord($scope.term, 'en', 10).then((dialogs)->
                    $scope.dialogs = dialogs.plain()
                    db.put({
                        _id: $scope.term,
                        dialogs: dialogs.plain()
                    })
                )
            else
                $scope.dialogs = doc.dialogs
                $scope.$digest()
        )
  ]
