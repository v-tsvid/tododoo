directives = angular.module('directives')

directives.directive 'authBar', ->
  {
    templateUrl: 'auth.html'
    controller: 'authBarCtrl'
  }