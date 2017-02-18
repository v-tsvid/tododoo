directives = angular.module('directives')

directives.directive 'taskItem', ->
  scope: { task: '=' }
  templateUrl: "tasks/task.html"
  require: '^projectItem'
  link: (scope, ele, attrs, myProjectCtrl) ->

    scope.remove = ->
      myProjectCtrl.removeTask scope.task.id
      return

    return
  controller: ['$scope', '$resource'
    ($scope, $resource) ->

      Comment = $resource('/comments/:commentId', { 
        commentId: "@id", 
        format: 'json' })

      this.removeComment = (id)->
        Comment.delete({commentId: id}).$promise.then ->
          return Comment.query(task_id: $scope.task.id).$promise.then (data, error) ->
            $scope.task.comments = data

      return
  ]