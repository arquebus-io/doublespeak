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
    'restangular'
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
      .otherwise
        redirectTo: '/'
  .config (RestangularProvider) ->
    RestangularProvider.setBaseUrl('http://localhost:1337/')
