controllers = angular.module('controllers')
controllers.controller("ProjectController", [
  '$scope'
  '$document'
  '$log'
  '$routeParams'
  '$location'
  '$resource'
  '$uibModal'
  'flash'
  ($scope,$document,$log,$routeParams,$location,$resource,$uibModal,flash)->
    Project = $resource('/projects/:projectId', { projectId: "@id", format: 'json' },
    {
      'save':   {method:'PUT'},
      'create': {method:'POST'}
    })
    
    if $routeParams.projectId
      Project.get({projectId: $routeParams.projectId},
        ( (project)-> $scope.project = project ),
        ( (httpResponse)->
          $scope.project = null
          flash.error   = "There is no project with ID #{$routeParams.projectId}"
        )
      )
    else
      $scope.project = {user_id: 1}

    $scope.back = -> $location.path("/")

    $scope.cancel = ->
      $location.path("/")

    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.project.id
        $scope.project.$save(
          ( ()-> $location.path("/") ),
          onError)
      else
        Project.create($scope.project,
          ( (newProject)-> $location.path("/") ),
          onError
        )

    $scope.deleteTask = (id)->
      $scope.project.tasks.splice($scope.project.tasks.indexOf(id), 1);

])