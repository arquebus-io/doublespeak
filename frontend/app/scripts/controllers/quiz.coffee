'use strict'

###*
 # @ngdoc function
 # @name doublespeakApp.controller:QuizCtrl
 # @description
 # # QuizCtrl
 # Controller of the doublespeakApp
###
angular.module('doublespeakApp')
  .controller 'QuizCtrl', ['$scope', 'Word', 'Dialog', 'Utilities', ($scope, Word, Dialog, Utilities) ->
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
                $scope.regenerate()
        )
        if quiz.statusIcon != 'done'
            quiz.statusIcon = 'clear'

    $scope.regenerate = ->
        wordPromise = Word.getRandom({cutoff: 200})
        wordPromise.then((word)->
            Dialog.getDialogsFromWord(word.name, 'ru').then((dialogs)->
                $scope.quizzes.push({word: word, challenge: dialogs[0], options: Utilities.shuffle(dialogs.slice(0, 4)), selected: false, statusIcon: 'arrow-forward'})
            )
        )

    $scope.regenerate()
  ]
