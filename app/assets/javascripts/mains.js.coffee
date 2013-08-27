
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self

# Creates new Angular module called 'KickSight'
Kicksight = angular.module('Kicksight', [])

# Sets up routing
Kicksight.config(['$routeProvider', ($routeProvider) ->
# Route for '/post'
    $routeProvider.when('/xyzs', { templateUrl: '../assets/templates/projects.html', controller: 'projectCtrl' } )
    $routeProvider.otherwise({ templateUrl: 'app/views/mains/index.html', controller: 'indexCtrl' } )
])


