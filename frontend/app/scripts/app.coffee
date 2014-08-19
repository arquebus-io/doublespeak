'use strict'

###*
 # @ngdoc overview
 # @name doublespeakApp
 # @description
 # # doublespeakApp
 #
 # Main module of the application.
###
angular
  .module('doublespeakApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'restangular',
    'angular-loading-bar'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/quiz',
        templateUrl: 'views/quiz.html'
        controller: 'QuizCtrl'
      .when '/lookup',
        templateUrl: 'views/lookup.html'
        controller: 'LookupCtrl'
      .otherwise
        redirectTo: '/'
  .config (RestangularProvider) ->
    #I know not the best way to set the environment
    if document.URL.indexOf("designeer") >= 0
        RestangularProvider.setBaseUrl('http://backend.designeer.us/')
    else
        RestangularProvider.setBaseUrl('http://localhost:1337/')
