'use strict'

###*
 # @ngdoc service
 # @name doublespeakApp.word
 # @description
 # # word
 # Service in the doublespeakApp.
###
angular.module('doublespeakApp')
  .service 'Word', ['Restangular', '$q', 'pouchdb', 'dbHelper', (Restangular, $q, pouchdb, dbHelper)->
   # AngularJS will instantiate a singleton by calling "new" on this function
   {
       getRandom: ((options)->
            deferred = $q.defer()
            db = pouchdb.create('word')
            default_options = {
                lang: 'ru'
                cutoff: 200
            }
            options = angular.extend(default_options, options)
            random = Math.floor(Math.random() * options.cutoff)
            db.get(dbHelper.getIdFromLangWord(options.lang, random), false, (err, doc)->
                if err
                    Restangular.all('word')
                        .getList({limit: options.cutoff})
                        .then((words)->
                            words = words.plain()
                            angular.forEach(words, (word)->
                                db.put({
                                    _id: dbHelper.getIdFromLangWord(options.lang, word.id)
                                    word: word
                                })
                            )
                            deferred.resolve(words[random])
                        , (err)->
                            deferred.reject(err)
                        )
                else
                    deferred.resolve(doc.word)
            )
            deferred.promise
       )
   }]
