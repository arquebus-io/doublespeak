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
       getRandom: ((options)->
           if !options.cutoff
               options.cutoff = 200
           Restangular.one("word", Math.floor(Math.random() * options.cutoff)).get()
       )
   }]
