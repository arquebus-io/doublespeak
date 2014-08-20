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

    $scope.quizzes = []
    $scope.optionSelected = (quiz, option)->
        angular.forEach(quiz.options, (option)->
            option.selected = false
        )
        quiz.selected = true
        quiz.statusIcon = 'arrow-forward'
        option.selected = true

    $scope.validateQuiz = (quiz)->
        angular.forEach(quiz.options, (option)->
            if option.selected and option.id == quiz.challenge.id
                quiz.statusIcon = 'done'
        )
        if quiz.statusIcon != 'done'
            quiz.statusIcon = 'clear'

    $scope.regenerate = ->
        wordPromise = Word.getRandomByCutoff(200)
        wordPromise.then((word)->
            $scope.randomHighFreqWord = word
            Dialog.getDialogsFromWord(word.name, 'ru', 4).then((dialogs)->
                $scope.quizzes.push({challenge: dialogs[0], options: shuffle(dialogs), selected: false, statusIcon: 'arrow-forward'})
            )
        )

    $scope.regenerate()
  ]
