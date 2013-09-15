angular.module('google-chart-sample', ['googlechart']).controller("ProjectGraphCtrl", function($scope) {

    var chart1 = {}, _view = 1;
    $scope.view1VisibilityMode = (_view === 1 ? "table" : "none");
    $scope.view2VisibilityMode = (_view === 2 ? "block" : "none");
    $scope.view3VisibilityMode = (_view === 3 ? "block" : "none");
    $scope.view4VisibilityMode = (_view === 4 ? "block" : "none");

    chart1.type = "LineChart";
    chart1.displayed = true;
    chart1.cssStyle = "height:600px; width:100%;";
    chart1.data = {
        "cols": [{
            id: "month",
            label: "Month",
            type: "string"
        }, {
            id: "goal-id",
            label: "Goal",
            type: "number"
        }, {
            id: "pledges-id",
            label: "Pledges",
            type: "number"
        }],
        "rows": [{
            c: [{
                v: "20-8-13"
            }, {
                v: 17
            }, {
                v: 1,
                f: "1 new pledges"
            }]
        }, {
            c: [{
                v: "20-8-14"
            }, {
                v: 17
            }, {
                v: 2,
                f: "1 new pledges"
            }]
        }, {
            c: [{
                    v: "20-8-15"
                }, {
                    v: 17
                }, {
                    v: 3
                }

            ]
        }, {
            c: [{
                v: "20-8-17"
            }, {
                v: 17
            }, {
                v: 4,
                f: "1 pledges"
            }]
        }, {
            c: [{
                v: "20-8-18"
            }, {
                v: 17
            }, {
                v: 8,
                f: "1 pledges"
            }]
        }, {
            c: [{
                v: "20-8-19"
            }, {
                v: 17
            }, {
                v: 12,
                f: "1 pledges"
            }]
        }, {
            c: [{
                v: "20-8-20"
            }, {
                v: 17
            }, {
                v: 15,
                f: "1 pledges"
            }]
        }, {
            c: [{
                v: "20-8-21"
            }, {
                v: 17
            }, {
                v: 20,
                f: "1 pledges"
            }]
        }, ]
    };

    chart1.options = {
        "title": "Total pledges",
        "fill": 20,
        "displayExactValues": true,
        "vAxis": {
            "title": "Total Pledges (in thousands $)",
            "gridlines": {
                "count": 20,
                "color": "#BBBBBB"
            }
        },
        "hAxis": {
            "title": "Date",
            "gridlines": {
                "count": 4,
                "color": "#BBBBBB"
            }
        },
        "colors": ["lightgreen", "pink"]
    };

    $scope.chart = chart1;

    $scope.hideServer = false;
    $scope.selectionChange = function() {
        if ($scope.hideServer) {
            $scope.chart.view = {
                columns: [0, 1, 2]
            };
        } else {
            $scope.chart.view = {};
        }
    }

});

var app = angular.module('KickSight', ['ngResource', 'ui.bootstrap', 'google-chart-sample']);

app.controller('ProjectsCtrl', function($scope, $resource, $http, $modal) {
    var _view = 1;
    $scope.view1VisibilityMode = (_view === 1 ? "table" : "none");
    $scope.view2VisibilityMode = (_view === 2 ? "block" : "none");
    $scope.view3VisibilityMode = (_view === 3 ? "block" : "none");
    $scope.view4VisibilityMode = (_view === 4 ? "block" : "none");

    $scope.categories = $resource('../mains/get_all_categories').query();

    var Projects = $resource('../mains/get_projects');
    $scope.getProjects = function(category) {
        if ( category ){
            $scope.projects = Projects.query({cat_id : category.id});
        }else{ 
            $scope.projects = Projects.query();
        }
    };

    $scope.getProjects();
    $scope.color = function(project) {
        /*   return project.pledges > (project.goal * 0.5) ? 'green' : 'red';*/
        return (Math.round(project.current / project.goal * 100) > 50 ? 'green' : 'red');
    }

    $scope.percent = function() {
        angular.forEach($scope.projects, function(projectData) {
            projectData.percent = Math.round(projectData.current / projectData.goal * 100);
        });
    };

    $scope.changeView = function(view) {
        if (view === 1) _view = 1;
        else if (view === 2) _view = 2;
        else if (view === 3) _view = 3
        else if (view === 4) _view = 4;

        $scope.view1VisibilityMode = (_view === 1 ? "table" : "none");
        $scope.view2VisibilityMode = (_view === 2 ? "block" : "none");
        $scope.view3VisibilityMode = (_view === 3 ? "block" : "none");
        $scope.view4VisibilityMode = (_view === 4 ? "block" : "none");
    };
    $scope.remaining = function() {
        var count = 0;
        angular.forEach($scope.projectData.projectPledges, function(projectData) {
            count += projectData.amount ? 0 : 1;
        });
        return count;
    };

    $scope.openGraph = function(project) {

        var getProjectData = function(id) {
            var _projectData = $http.get('../mains/daily_project_points', {
                params: {
                    projectID: id,
                    dates: true
                }
            }),
                pointsPromise = _projectData.then(function(response) {
                    var table = {
                        "cols": [{ id: "month", label: "Month", type: "string" },
                                 { id: "goal-id", label: "Goal", type: "number" },
                                 { id: "pledges-id", label: "Daily Total Pledges", type: "number" },
                                 { id: "trendline", label: "Trendline", type: "number" }],
                        "rows": []
                    };

                    angular.forEach(response.data, function(p) {
                        table.rows.push({
                            c: [{ v: p[2] },
                                { v: project.goal },
                                { v: p[1], f: p[3] + " new pledges" },
                                { v: p[4] }]
                        });
                    });

                    return table;
                });


            return pointsPromise;
        };

        var chart1 = {};
        chart1.type = "LineChart";
        chart1.displayed = true;
        chart1.options = {
            "title": "Total pledges",
            "fill": 20,
            "height": 450,
            "displayExactValues": true,
            "vAxis": {
                "title": "Total Pledges (in thousands $)",
                "gridlines": {
                    "count": 20,
                    "color": "#BBBBBB"
                }
            },
            "hAxis": {
                "title": "Date",
                "gridlines": {
                    "count": 4,
                    "color": "#BBBBBB"
                }
            },
            "colors": ["#3fc42e", "#DC1112", "#3E4693"]
        };
         getProjectData(project.kick_id).then (function( chartData) {

            chart1.data = chartData;

            var modalInstance = $modal.open({
            templateUrl: '/templates/projectGraph.html',
            controller: 'GraphCtrl',
            resolve: {
                project: function() {
                    return project;
                },
                chart: function() {
                    return chart1;
                }
            }
        });

        });

        
    };

});

app.controller('GraphCtrl', function($scope, $modalInstance, project, chart) {

    $scope.project = project;
    $scope.chart = chart;


    $scope.ok = function() {
        $modalInstance.close();
        // $modalInstance.close($scope.selected.item);
    };

    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
});