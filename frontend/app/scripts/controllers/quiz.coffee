'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:QuizCtrl
 # @description
 # # QuizCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'QuizCtrl', ['$scope', 'Word', ($scope, Word) ->
    Word.getRandom().then((word)->
        $scope.randomWord = word
    )
  ]
