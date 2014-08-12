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
        getDialogsFromWord: (word, lang, count)->
           Restangular.all('dialog').getList({lang: lang, word:word, limit: count})
    }
  ]

