'use strict'

###*
 # @ngdoc service
 # @name doublespeakApp.dbHelper
 # @description
 # # dbHelper
 # Service in the doublespeakApp.
###
angular.module('doublespeakApp')
  .service 'dbHelper', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    {
        getIdFromLangWord: (lang, word)->
            lang + ":" + word
    }
