controllers = angular.module('controllers')
controllers.controller("taskCtrl", [
  '$scope'
  '$document'
  '$log'
  '$stateParams'
  '$location'
  '$resource'
  '$uibModal'
  'flash'
  ($scope,$document,$log,$stateParams,$location,$resource,$uibModal,flash)->
    Task = $resource('/tasks/:taskId', { taskId: "@id", format: 'json' },
    {
      'save':   {method:'PUT'},
      'create': {method:'POST'}
    })
    
    if $stateParams.taskId
      Task.get({taskId: $stateParams.taskId},
        ( (task)-> $scope.task = task ),
        ( (httpResponse)->
          $scope.task = null
          flash.error   = "There is no task with ID #{$stateParams.taskId}"
        )
      )
    else
      $scope.task = {project_id: 1}

    $scope.back = -> $location.path("/")

    $scope.cancel = ->
      $location.path("/")

    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.task.id
        $scope.task.$save(
          ( ()-> $location.path("/") ),
          onError)
      else
        Task.create($scope.task,
          ( (newTask)-> $location.path("/") ),
          onError
        )

])