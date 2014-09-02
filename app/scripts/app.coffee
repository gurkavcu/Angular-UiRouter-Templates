'use strict'

angular
  .module('jsApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ui.router'
  ])
  .config ($stateProvider,$routeProvider) ->
    $stateProvider
      .state('root',
        abstract : true,
        templateUrl : "index.html",
        resolve: 
          greeting1: ($q, $timeout) ->
            deferred = $q.defer()
            $timeout (->
              deferred.resolve "Hello1!"
              return
            ), 1000
            deferred.promise
          greeting2: ($q, $timeout) ->
            deferred = $q.defer()
            $timeout (->
              deferred.resolve "Hello2!"
              return
            ), 2000
            deferred.promise      
      )
      .state('home',
        url : ""
        parent : "root"
        templateUrl : "/views/home.html"
        controller: ($scope,greeting1,greeting2)->
          $scope.greeting1 = greeting1          
          $scope.greeting2 = greeting2
      )
      .state('inner1',
        url : "/inner1"
        parent : "home"
        templateUrl : "/views/innerhome.html"
      )
      .state('inner2',
        url : "/inner2"
        parent : "home"
        templateUrl : "/views/innerhome2.html"
      )
      .state('sub1',
        url : "/sub1"
        parent : "inner2"
        views :
          A:
            templateUrl : "/views/a.html"
          B:
            templateUrl : "/views/b.html"
      )



