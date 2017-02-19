controllers = angular.module('controllers')
controllers.controller("tasksCtrl", [ 
  '$scope'
  '$stateParams'
  '$location'
  '$resource'
  '$route'
  'flash'
  ($scope,$stateParams,$location,$resource,$route,flash)->
    Task = $resource('/tasks/:taskId', { 
      taskId: "@id", 
      format: 'json' })

    $scope.tasks = Task.query()

    $scope.newTask = -> $location.path("/tasks/new")
    $scope.edit       = (taskId)-> $location.path("/tasks/#{taskId}/edit")

    $scope.delete = (id)->
      Task.delete({taskId: id}).$promise.then ->
        return Task.query().$promise.then (data, error) ->
          $scope.tasks = data
])