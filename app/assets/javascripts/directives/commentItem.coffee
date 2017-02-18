directives = angular.module('directives')

directives.directive 'commentItem', ->
  scope: { comment: '=' }
  templateUrl: "comments/comment.html"
  require: '^taskItem'
  link: (scope, ele, attrs, myTaskCtrl) ->

    scope.remove = ->
      myTaskCtrl.removeComment scope.comment.id
      return

    return
  controller: ($scope) ->

    @removeComment = (com) ->
      $scope.commentItem.comments.splice $scope.commentItem.comments.indexOf(com), 1
      return

    return