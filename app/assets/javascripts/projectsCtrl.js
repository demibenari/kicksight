angular.module('KickSight', ['ngResource']);

var _getProjectData = function (id) {
    var _projectData = $resource('../mains/daily_project_points/:projectID/:dates', [
        {projectID: id}, {dates: true}
    ]);
    var _projectTable = _projectData.query();
    var table1 = {"cols": [
        {id: "goal-id", label: "Goal", type: "number"},
        {id: "pledges-id", label: "Daily Total Pledges", type: "number"}
    ], "rows": []};
    angular.forEach(_projectTable, function (p) {
        table1.rows.push({c: [{v:"date"},{v:"total"},{v:"today's pledges"}]})
    });
    return tables;
};

google.setOnLoadCallback(function () {
    angular.bootstrap(document.body, ['google-chart-sample']);
});
google.load('visualization', '1', {packages: ['corechart']});

angular.module('google-chart-sample', ['googlechart.directives']).controller("ProjectGraphCtrl", function ($scope) {

    var chart1 = {};
    $scope.view1VisibilityMode = (_view === 1 ? "table" : "none");
    $scope.view2VisibilityMode = (_view === 2 ? "block" : "none");
    $scope.view3VisibilityMode = (_view === 3 ? "block" : "none");
    $scope.view4VisibilityMode = (_view === 4 ? "block" : "none");

    chart1.type = "LineChart";
    chart1.displayed = false;
    chart1.cssStyle = "height:600px; width:100%;";
    chart1.data = {"cols": [
        {id: "month", label: "Month", type: "string"},
        {id: "goal-id", label: "Goal", type: "number"},
        {id: "pledges-id", label: "Pledges", type: "number"}
    ], "rows": [
        {c: [
            {v: "20-8-13"},
            {v: 17},
            {v: 1, f: "1 new pledges"}
        ]},
        {c: [
            {v: "20-8-14"},
            {v: 17},
            {v: 2, f: "1 new pledges"}
        ]},
        {c: [
            {v: "20-8-15"},
            {v: 17},
            {v: 3}

        ]},
        {c: [
            {v: "20-8-17"},
            {v: 17},
            {v: 4, f: "1 pledges"}
        ]},
        {c: [
            {v: "20-8-18"},
            {v: 17},
            {v: 8, f: "1 pledges"}
        ]},
        {c: [
            {v: "20-8-19"},
            {v: 17},
            {v: 12, f: "1 pledges"}
        ]},
        {c: [
            {v: "20-8-20"},
            {v: 17},
            {v: 15, f: "1 pledges"}
        ]},
        {c: [
            {v: "20-8-21"},
            {v: 17},
            {v: 20, f: "1 pledges"}
        ]},
    ]};

    chart1.options = {
        "title": "Total pledges",
        "fill": 20,
        "displayExactValues": true,
        "vAxis": {
            "title": "Total Pledges (in thousands $)",
            "gridlines": {
                "count": 20,
                "color": "#BBBBBB"}
        },
        "hAxis": {
            "title": "Date",
            "gridlines": {
                "count": 4,
                "color": "#BBBBBB"}
        },
        "colors": ["lightgreen","pink"]
    };

    $scope.chart1 = chart1;

    $scope.hideServer = false;
    $scope.selectionChange = function () {
        if($scope.hideServer) {
            $scope.chart.view = {columns: [0,1,2]};
        } else {
            $scope.chart.view = {};
        }
    }

});



function ProjectsCtrl($scope, $resource) {
    var _view = 1;
    $scope.view1VisibilityMode = (_view === 1 ? "table" : "none");
    $scope.view2VisibilityMode = (_view === 2 ? "block" : "none");
    $scope.view3VisibilityMode = (_view === 3 ? "block" : "none");
    $scope.view4VisibilityMode = (_view === 4 ? "block" : "none");

    var _projects = $resource('../mains/get_projects');

    $scope.projects = _projects.query();
    $scope.color = function (project) {
        /*   return project.pledges > (project.goal * 0.5) ? 'green' : 'red';*/
        return (Math.round(project.current / project.goal * 100) > 50 ? 'green' : 'red');
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

        $scope.view1VisibilityMode = (_view === 1 ? "table" : "none");
        $scope.view2VisibilityMode = (_view === 2 ? "block" : "none");
        $scope.view3VisibilityMode = (_view === 3 ? "block" : "none");
        $scope.view4VisibilityMode = (_view === 4 ? "block" : "none");
    };
    $scope.remaining = function () {
        var count = 0;
        angular.forEach($scope.projectData.projectPledges, function (projectData) {
            count += projectData.amount ? 0 : 1;
        });
        return count;
    };
};
