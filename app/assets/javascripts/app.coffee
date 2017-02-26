tododoo = angular.module('tododoo',[
  'ui.router'
  'ui.bootstrap'
  'templates'
  'ngResource'
  'ng-token-auth'
  'ngCookies'
  'controllers'
  'directives'
  'angular-flash.service'
  'angular-flash.flash-alert-directive'
])

tododoo.config(['$stateProvider', '$urlRouterProvider', 'flashProvider',
  ($stateProvider,$urlRouterProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: "index.html"
        controller: 'projectsCtrl'
      }).state('login', {
        url: '/login',
        templateUrl: "login.html"
        controller: 'authCtrl',
        onEnter: ($state) ->
          return
      }).state('register', {
        url: '/register',
        templateUrl: "register.html"
        controller: 'authCtrl',
        onEnter: ($state) ->
          return
      }).state('new_project', {
        url: '/projects/new',
        templateUrl: "projects/form.html"
        controller: 'projectCtrl'
      }).state('edit_project', {
        url: '/projects/:projectId/edit',
        templateUrl: "projects/form.html"
        controller: 'projectCtrl'
      })
    $urlRouterProvider.otherwise('/')
])

tododoo.run([
  '$rootScope'
  '$location'
  ($rootScope, $location) ->
    $rootScope.$on 'auth:login-success', ->
      $location.path '/'
      return
    return
])

controllers = angular.module('controllers', [])
directives = angular.module('directives', [])