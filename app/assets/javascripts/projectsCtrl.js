angular.module('proj', ['ngResource']);

function ProjectsCtrl($scope, $resource) {
    var _projects = $resource('http://kicksight.herokuapp.com/mains/get_projects/:withIDs', [{withIDs: true}]);
    $scope.projects = _projects.query();
    $scope.color = function(project) {
        return project.pledges > (project.total * 0.5) ?  'green' : 'red';
    }

    $scope.percent = function() {
        angular.forEach($scope.projects, function(projectData) {
            projectData.percent = Math.round(projectData.pledges / projectData.total * 100);
        });
    };
    $scope.remaining = function() {
        var count = 0;
        angular.forEach($scope.projectData.projectPledges, function(projectData) {
            count += projectData.amount ? 0 : 1;
        });
        return count;
    };
}