'use strict'

###*
 # @ngdoc service
 # @name doublespeakApp.dialog
 # @description
 # # dialog
 # Service in the doublespeakApp.
###
angular.module('doublespeakApp')
  .service 'Dialog', ['Restangular', '$q', 'pouchdb', 'dbHelper', (Restangular, $q, pouchdb, dbHelper)->
    # AngularJS will instantiate a singleton by calling "new" on this function
    {
        getDialogsFromWord: (word, lang)->
            deferred = $q.defer()
            db = pouchdb.create('dialog')
            db.get(dbHelper.getIdFromLangWord(word, lang), false, (err, doc)->
                if err
                    Restangular.all('dialog').getList({lang: lang, word:word, limit: 100}).then((dialogs)->
                        db.put({
                            _id: dbHelper.getIdFromLangWord(word, lang)
                            dialogs: dialogs.plain()
                        })
                        deferred.resolve(dialogs.plain())
                    , (err)->
                        deferred.reject(err)
                    )
                else
                    deferred.resolve(doc.dialogs)
            )
            deferred.promise
    }
  ]

