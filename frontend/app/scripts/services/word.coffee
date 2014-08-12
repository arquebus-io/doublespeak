'use strict'

###*
 # @ngdoc service
 # @name doublespeakApp.word
 # @description
 # # word
 # Service in the doublespeakApp.
###
angular.module('doublespeakApp')
  .service 'Word', ['Restangular', (Restangular)->
   # AngularJS will instantiate a singleton by calling "new" on this function
   {
       getRandomByCutoff: ((cutoff)->
           Restangular.one("word", Math.floor(Math.random() * cutoff)).get()
       )
   }]
