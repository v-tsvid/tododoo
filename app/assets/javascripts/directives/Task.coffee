directives = angular.module('directives')

directives.directive 'myTask', ->
  scope: { task: '=' }
  templateUrl: "tasks/task.html"
  require: '^myProject'
  link: (scope, ele, attrs, myProjectCtrl) ->

    scope.remove = ->
      myProjectCtrl.removeTask scope.task.id
      return

    return
  controller: ($scope) ->

    @removeComment = (com) ->
      $scope.myTask.comments.splice $scope.myTask.comments.indexOf(com), 1
      return

    return