controllers = angular.module('controllers')
controllers.controller('authCtrl', [
  '$scope'
  '$auth'
  '$location'
  '$rootScope'
  '$state'
  ($scope, $auth, $location, $rootScope, $state) ->

    $scope.$on 'auth:login-error', (ev, reason) ->
      $scope.error = reason.errors[0]
      return

    $scope.$on 'auth:registration-email-error', (ev, reason) ->
      $scope.error = reason.errors[0]
      return

    $scope.handleRegBtnClick = ->
      $auth.submitRegistration($scope.registrationForm).then ->
        $auth.submitLogin
          email: $scope.registrationForm.email
          password: $scope.registrationForm.password
        return
      return

    return
])