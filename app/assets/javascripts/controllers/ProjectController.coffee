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

    Project.get({projectId: $routeParams.projectId},
      ( (project)-> $scope.project = project ),
      ( (httpResponse)->
        $scope.project = null
        flash.error   = "There is no project with ID #{$routeParams.projectId}"
      )
    )

    $scope.edit = (projectId) ->
      $scope.modalInstance = $uibModal.open({
        scope: $scope,
        animation: true,
        ariaLabelledBy: 'modal-title',
        ariaDescribedBy: 'modal-body',
        templateUrl: "projects/modal.html",
        controller: "ModalInstanceController",
        controllerAs: "$scope",
        size: 'lg'})

      $scope.prevTitle = $scope.project.title

      modalInstance.result.then ( ->
        $scope.project.title), ->
        $log.info 'modal-component dismissed at: ' + new Date

    $scope.ok = -> 
      Project.save($scope.project).$promise.then ->
        return Project.get({projectId: $routeParams.projectId})
        .$promise.then (data, error) ->
          $scope.project = data
      $scope.modalInstance.close($scope.project.title)

    $scope.cancel = ->
      $scope.project.title = $scope.prevTitle
      $scope.modalInstance.dismiss('cancel')

])