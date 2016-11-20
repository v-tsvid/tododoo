tododoo = angular.module('tododoo',[
  'ui.bootstrap',
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

tododoo.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

    $routeProvider
      .when('/',
        templateUrl: "projects/index.html"
        controller: 'ProjectsController'
      ).when('/projects/new',
        templateUrl: "projects/form.html"
        controller: 'ProjectController'
      ).when('/projects/:projectId/edit',
        templateUrl: "projects/form.html"
        controller: 'ProjectController'
      )
])

controllers = angular.module('controllers', [])