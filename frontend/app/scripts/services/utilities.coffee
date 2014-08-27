'use strict'

###*
 # @ngdoc service
 # @name doublespeakApp.utilities
 # @description
 # # utilities
 # Service in the doublespeakApp.
###
angular.module('doublespeakApp')
  .service 'Utilities', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    {
        shuffle: (array)->
            currentIndex = array.length
            while (0 != currentIndex)
                randomIndex = Math.floor(Math.random() * currentIndex)
                currentIndex -= 1

                temporaryValue = array[currentIndex]
                array[currentIndex] = array[randomIndex]
                array[randomIndex] = temporaryValue
            array
    }
