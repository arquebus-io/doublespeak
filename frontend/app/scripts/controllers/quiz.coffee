'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:QuizCtrl
 # @description
 # # QuizCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'QuizCtrl', ['$scope', 'Word', 'Dialog', ($scope, Word, Dialog) ->
    $scope.regenerate = ->
        wordPromise = Word.getRandomByCutoff(200)
        wordPromise.then((word)->
            $scope.randomHighFreqWord = word
            Dialog.getDialogsFromWord(word.name, 'ru', 4).then((dialogs)->
                $scope.dialogs = dialogs
            )
        )

    $scope.regenerate()
  ]
