tododoo = angular.module('tododoo',[
  'ui.bootstrap',
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

tododoo.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "projects/index.html"
        controller: 'ProjectsController'
      ).when('/projects/:projectId',
        templateUrl: "projects/show.html"
        controller: 'ProjectController'
      )
])

controllers = angular.module('controllers', [])