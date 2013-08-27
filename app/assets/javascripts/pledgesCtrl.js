google.setOnLoadCallback(function () {
    angular.bootstrap(document.body, ['google-chart-sample']);
});
google.load('visualization', '1', {packages: ['corechart']});

angular.module('google-chart-sample', ['googlechart.directives']).controller("ProjectGraphCtrl", function ($scope) {

    var chart1 = {};
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

    $scope.chart = chart1;

    $scope.hideServer = false;
    $scope.selectionChange = function () {
        if($scope.hideServer) {
            $scope.chart.view = {columns: [0,1,2]};
        } else {
            $scope.chart.view = {};
        }
    }

});



