  // Sample data for the charts
  var data = {
    bar: [{
        x: ['January', 'February', 'March', 'April', 'May'],
        y: [12, 19, 3, 5, 2],
        type: 'bar'
    }],
    line: [{
        x: ['January', 'February', 'March', 'April', 'May'],
        y: [10, 15, 7, 10, 13],
        type: 'line'
    }],
    pie: [{
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        values: [12, 19, 3, 5, 2, 3],
        type: 'pie'
    }]
};

// Layout configuration for the charts
var layout = {
    title: 'Plotly Chart Example',
    xaxis: { title: 'Months' },
    yaxis: { title: 'Values' }
};

// Plot the initial chart
var chartTypeSelect = document.getElementById('chartType');
var chartDiv = document.getElementById('chart');
var selectedChartType = chartTypeSelect.value;
Plotly.newPlot(chartDiv, data[selectedChartType], layout);

// Function to update the chart when the chart type is changed
chartTypeSelect.addEventListener('change', function() {
    selectedChartType = chartTypeSelect.value;
    Plotly.newPlot(chartDiv, data[selectedChartType], layout);
});

new DataTable('#super_admin_table');