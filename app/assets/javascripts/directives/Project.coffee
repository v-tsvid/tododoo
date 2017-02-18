directives = angular.module('directives')

directives.directive 'myProject', ->
  scope: { project: '=' }
  templateUrl: "projects/project.html"
  controller: ['$scope', '$resource'
    ($scope, $resource) ->
      Task = $resource('/tasks/:taskId', { 
        taskId: "@id", 
        format: 'json' })

      Project = $resource('/projects/:projectId', { 
        projectId: "@id", 
        format: 'json' })

      this.removeTask = (id)->
        Task.delete({taskId: id}).$promise.then ->
          return Task.query(project_id:$scope.project.id).$promise.then (data, error) ->
            $scope.project.tasks = data

      return
  ]