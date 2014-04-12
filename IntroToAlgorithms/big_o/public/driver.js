google.load('visualization', '1.0', {'packages':['corechart']});

var drawSortChart = function(){

  var dataLengths = [1, 10, 100, 300];
  var data = new google.visualization.DataTable();
  data.addColumn('number', 'Number of Strings');

  var underTest = [
//    {func: Array.prototype.sort,
//     label: "Native Browser Sort (QuickSort)"},
//    {func: selectionSort,
//     label: "Selection Sort"},
    {func: bubbleSort,
     label: "Bubble Sort"},
    {func: mergeSort,
     label: "Merge Sort"}
  ];

  _.each(dataLengths, function(dl, i){
    data.addRow([dl]);
  });

  _.each(underTest, function(sortOpts, row){
    data.addColumn('number',sortOpts.label);
  });

  var refreshChart =
      function () {
          var chart = new google.visualization.AreaChart(document.getElementById('sorts'));
          chart.draw(data, options);
      }


  var suite = new Benchmark.Suite({
    onComplete:function(){
    $(refreshChart);
  }
  });

    _.each(underTest, function(sortOpts, col){
    var func = sortOpts.func;

    _.each(dataLengths, function(dataLength, row){

      suite.add(function(){
        func.apply(testData.slice(0, dataLength));
      }, {onComplete: function(evt){
        data.setValue(row,col + 1, evt.target.stats.mean);
      }});

    });
  });


  var options = {
    title: "Time spent sorting",
    hAxis: {title: "Number of strings sorted"},
    vAxis: {title: "Time spent (ms)"},
    pointSize: 4,
    explorer: {maxZoomIn: 0.001} 
  };
  suite.run();

};
google.setOnLoadCallback(drawSortChart);
