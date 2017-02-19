directives = angular.module('directives')

directives.directive 'userItem', ->
  scope: { user: '=' }
  templateUrl: "users/user.html"
  
  controller: ['$scope', '$resource'
    ($scope, $resource) ->
      Project = $resource('/projects/:projectId', { 
        projectId: "@id", 
        format: 'json' })

      this.removeProject = (id)->
        Project.delete({projectId: id}).$promise.then ->
          return Project.query(user_id: $scope.user.id).$promise.then (data, error) ->
            $scope.user.projects = data

      return
  ]