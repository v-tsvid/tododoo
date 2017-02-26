controllers = angular.module('controllers')
controllers.controller("projectCtrl", [
  '$scope'
  '$document'
  '$log'
  '$stateParams'
  '$location'
  '$resource'
  '$uibModal'
  'flash'
  ($scope,$document,$log,$stateParams,$location,$resource,$uibModal,flash)->
    Project = $resource('api/projects/:projectId', { projectId: "@id", format: 'json' },
    {
      'save':   {method:'PUT'},
      'create': {method:'POST'}
    })
    
    if $stateParams.projectId
      Project.get({projectId: $stateParams.projectId},
        ( (project)-> $scope.project = project ),
        ( (httpResponse)->
          $scope.project = null
          flash.error   = "There is no project with ID #{$stateParams.projectId}"
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

])