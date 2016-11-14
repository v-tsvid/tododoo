tododoo = angular.module('tododoo',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

tododoo.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ProjectsController'
      )
])

# projects = [
#   {
#     id: 1
#     title: 'Feed cat'
#     tasks: [
#       { id: 11, title: 'Call cat', comments: [
#         { id: 111, text: 'skagrhaskgag', comments: [] }
#         { id: 112, text: 'skagrhaskgag', comments: [] }
#         ] }
#       { id: 12, title: 'Give food to cat', comments: [] }
#     ]
#   },
#   {
#     id: 2
#     title: 'Feed dog'
#     tasks: [
#       { id: 21, title: 'Call dog', comments: [
#         { id: 211, text: 'skagrhaskgagkjsdgksdkgkskgksdfvkjdfsvkjdfsvkjsjfv hjsf shfh shf shf hsfh sf s fjsf slf lsif sifs fh ahfhskskh khsk fkhs fs dfkj sdfkjs djf jsdfj sjdfj sdjf sjdf jsd f', comments: [] }
#         { id: 212, text: 'skagrhaskgag', comments: [] }
#         ] }
#       { id: 22, title: "Give food to dog, Give food to dog, Give food to dog, Give food to dog, Give food to dog, Give food to dog, Give food to dog, Give food to dog, Give food to dog, Give food to dog", comments: [
#         { id: 221, text: 'skagrhaskgag', comments: [] }
#         ] }
#     ]
#   },
#   {
#     id: 3
#     title: 'Clean room'
#     tasks: [
#       { id: 31, title: 'Collect the socks', comments: [] }
#       { id: 32, title: 'Clean the floor', comments: [] }
#       { id: 33, title: 'Marshal the books', comments: [] }
#     ]
#   },
#   {
#     id: 4
#     title: 'Go to work'
#     tasks: []
#   }
# ]

controllers = angular.module('controllers',[])
controllers.controller("ProjectsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    # $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    # if $routeParams.keywords
    #   keywords = $routeParams.keywords.toLowerCase()
    #   $scope.projects = projects.filter (project)-> project.title.toLowerCase().indexOf(keywords) != -1
    # else
    #   $scope.projects = projects

    Project = $resource('/projects/:projectId', { projectId: "@id", format: 'json' })
    $scope.projects = Project.query()
])