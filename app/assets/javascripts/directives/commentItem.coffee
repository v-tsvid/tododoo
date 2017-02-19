directives = angular.module('directives')

directives.directive 'commentItem', ->
  scope: { comment: '=' }
  templateUrl: "comments/comment.html"
  require: '^taskItem'
  link: (scope, ele, attrs, taskItemCtrl) ->

    scope.remove = ->
      taskItemCtrl.removeComment scope.comment.id
      return

    return

  controller: ($scope) ->

    @removeComment = (com) ->
      $scope.commentItem.comments.splice $scope.commentItem.comments.indexOf(com), 1
      return

    return