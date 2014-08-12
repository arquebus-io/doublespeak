'use strict'

###*
 # @ngdoc service
 # @name doublespeakApp.dialog
 # @description
 # # dialog
 # Service in the doublespeakApp.
###
angular.module('doublespeakApp')
  .service 'Dialog', ['Restangular', (Restangular)->
    # AngularJS will instantiate a singleton by calling "new" on this function
    {
        getDialogsFromWord: (word, count)->
           Restangular.all('dialog').getList({ru: word.name, limit: count})
    }
  ]

