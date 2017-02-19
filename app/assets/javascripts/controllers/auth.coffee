controllers = angular.module('controllers')
controllers.controller('authCtrl', [
  '$scope',
  '$rootScope',
  'Auth',
  '$state'
  ($scope, $rootScope, Auth, $state) ->
    config = headers: 'X-HTTP-Method-Override': 'POST'

    $scope.register = ->
      Auth.register($scope.user, config).then ((user) ->
        $rootScope.user = user
        alert 'Thanks for signing up, ' + user.username
        $state.go 'home'
        return
      ), (response) ->
        alert response.data.error
        return
      return

    $scope.login = ->
      Auth.login($scope.user, config).then ((user) ->
        $rootScope.user = user
        alert 'You\'re all signed in, ' + user.username
        $state.go 'home'
        return
      ), (response) ->
        alert response.data.error
        return
      return

    return
])