directives = angular.module('directives')

directives.directive 'projectItem', ->
  scope: { project: '=' }
  templateUrl: "projects/project.html"
  # require: '^userItem'
  # link: (scope, ele, attrs, userItemCtrl) ->

  #   scope.remove = ->
  #     userItemCtrl.removeProject scope.project.id
  #     return

  #   return

  controller: ['$scope', '$resource'
    ($scope, $resource) ->
      Task = $resource('/tasks/:taskId', { 
        taskId: "@id", 
        format: 'json' })

      this.removeTask = (id)->
        Task.delete({taskId: id}).$promise.then ->
          return Task.query(project_id: $scope.project.id).$promise.then (data, error) ->
            $scope.project.tasks = data

      return
  ]