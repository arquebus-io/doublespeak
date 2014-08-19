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
    shuffle = (array)->
        currentIndex = array.length
        while (0 != currentIndex)
            randomIndex = Math.floor(Math.random() * currentIndex)
            currentIndex -= 1

            temporaryValue = array[currentIndex]
            array[currentIndex] = array[randomIndex]
            array[randomIndex] = temporaryValue
        array

    $scope.regenerate = ->
        wordPromise = Word.getRandomByCutoff(200)
        wordPromise.then((word)->
            $scope.randomHighFreqWord = word
            Dialog.getDialogsFromWord(word.name, 'ru', 4).then((dialogs)->
                $scope.dialogs = shuffle(dialogs)
            )
        )

    $scope.regenerate()
  ]
