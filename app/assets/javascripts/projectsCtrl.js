angular.module('KickSight', ['ngResource']);

_getProjectData = function () {
    var _project = $resource('localhost:3000/mains/get_projects/:withIDs', [
        {withIDs: true}
    ]);
    //get a single project data
};

function ProjectsCtrl($scope, $resource) {

    alert('bbbbb');
    var _projects = $resource('../mains/get_projects');

    $scope.projects = _projects.query();
    $scope.color = function (project) {
        return project.pledges > (project.goal * 0.5) ? 'green' : 'red';
    }

    $scope.percent = function () {
        alert('Precent');
        angular.forEach($scope.projects, function (projectData) {
            projectData.percent = Math.round(projectData.current / projectData.goal * 100);
        });
    };

    $scope.remaining = function () {
        var count = 0;
        angular.forEach($scope.projectData.projectPledges, function (projectData) {
            count += projectData.amount ? 0 : 1;
        });
        return count;
    };
};
