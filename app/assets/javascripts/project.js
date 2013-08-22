function Project($scope) {
    $scope.projects = [
        {projectName:'Project1', pledges: 20, total: 30},
        {projectName:'Project2', pledges: 10, total: 50}];

    $scope.color = function(project) {
        return project.pledges > (project.total * 0.5) ?  'green' : 'red';
    }

    $scope.remaining = function() {
        var count = 0;
        angular.forEach($scope.projectData.projectPledges, function(projectData) {
            count += projectData.amount ? 0 : 1;
        });
        return count;
    };
}