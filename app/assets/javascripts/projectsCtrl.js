angular.module('KickSight', ['ngResource']);

_getProjectData = function () {
    var _project = $resource('localhost:3000/mains/get_projects/:withIDs', [
        {withIDs: true}
    ]);
    //get a single project data
};

function ProjectsCtrl($scope, $resource) {

    var _view = 1;
    var view1VisibilityMode = view === 1 ? "block" : "none";
    var view2VisibilityMode = view === 2 ? "block" : "none";
    var view3VisibilityMode = view === 3 ? "block" : "none";
    var view4VisibilityMode = view === 4 ? "block" : "none";

    var _projects = $resource('../mains/get_projects');

    $scope.projects = _projects.query();
    $scope.color = function (project) {
        return project.pledges > (project.goal * 0.5) ? 'green' : 'red';
    }

    $scope.percent = function () {
        angular.forEach($scope.projects, function (projectData) {
            projectData.percent = Math.round(projectData.current / projectData.goal * 100);
        });
    };

    $scope.changeView = function (view) {
          if (view === 1) _view = 1;
          else if (view === 2) _view = 2;
          else if (view === 3) _view = 3
          else if (view === 4) _view = 4;
    };
    $scope.remaining = function () {
        var count = 0;
        angular.forEach($scope.projectData.projectPledges, function (projectData) {
            count += projectData.amount ? 0 : 1;
        });
        return count;
    };
};
