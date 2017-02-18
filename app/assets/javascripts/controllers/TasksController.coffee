controllers = angular.module('controllers')
controllers.controller("TasksController", [ 
  '$scope'
  '$routeParams'
  '$location'
  '$resource'
  '$route'
  'flash'
  ($scope,$routeParams,$location,$resource,$route,flash)->
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