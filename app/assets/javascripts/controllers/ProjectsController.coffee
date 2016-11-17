controllers = angular.module('controllers')
controllers.controller("ProjectsController", [ 
  '$scope'
  '$routeParams'
  '$location'
  '$resource'
  '$route'
  'flash'
  ($scope,$routeParams,$location,$resource,$route,flash)->
    Project = $resource('/projects/:projectId', { projectId: "@id", format: 'json' })
    $scope.projects = Project.query()


    $scope.delete = (id)->
      Project.delete({projectId: id})
      $route.reload()
])