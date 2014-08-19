(function(){"use strict";angular.module("doublespeakApp",["ngAnimate","ngCookies","ngResource","ngRoute","ngSanitize","ngTouch","restangular","angular-loading-bar"]).config(["$routeProvider",function(a){return a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).when("/about",{templateUrl:"views/about.html",controller:"AboutCtrl"}).when("/quiz",{templateUrl:"views/quiz.html",controller:"QuizCtrl"}).when("/lookup",{templateUrl:"views/lookup.html",controller:"LookupCtrl"}).otherwise({redirectTo:"/"})}]).config(["RestangularProvider",function(a){return a.setBaseUrl(document.URL.indexOf("designeer")>=0?"http://backend.designeer.us/":"http://localhost:1337/")}])}).call(this),function(){"use strict";angular.module("doublespeakApp").controller("MainCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("doublespeakApp").controller("AboutCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("doublespeakApp").controller("QuizCtrl",["$scope","Word","Dialog",function(a,b,c){var d;return d=function(a){var b,c,d;for(b=a.length;0!==b;)c=Math.floor(Math.random()*b),b-=1,d=a[b],a[b]=a[c],a[c]=d;return a},a.regenerate=function(){var e;return e=b.getRandomByCutoff(200),e.then(function(b){return a.randomHighFreqWord=b,c.getDialogsFromWord(b.name,"ru",4).then(function(b){return a.dialogs=d(b)})})},a.regenerate()}])}.call(this),function(){"use strict";angular.module("doublespeakApp").service("Word",["Restangular",function(a){return{getRandomByCutoff:function(b){return a.one("word",Math.floor(Math.random()*b)).get()}}}])}.call(this),function(){"use strict";angular.module("doublespeakApp").service("Dialog",["Restangular",function(a){return{getDialogsFromWord:function(b,c,d){return a.all("dialog").getList({lang:c,word:b,limit:d})}}}])}.call(this),function(){"use strict";angular.module("doublespeakApp").controller("LookupCtrl",["$scope","Dialog",function(a,b){return a.search=function(){return b.getDialogsFromWord(a.term,"en",50).then(function(b){return a.dialogs=b})}}])}.call(this),function(){"use strict";angular.module("doublespeakApp").controller("IndexCtrl",["$scope","$location",function(a,b){return a.selectedTab=b.path(),a.navigateTo=function(a){return b.path(a)}}])}.call(this),function(){"use strict";angular.module("doublespeakApp").directive("dsSelected",function(){return{restrict:"A",link:function(a,b,c){return b[0].selected=c.dsSelected}}})}.call(this);