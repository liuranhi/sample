var drawGraph = function(data){
  var ctx = document.getElementById('graph').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'line',
    data: { labels: data[0],
    datasets: [{ label:'気温', data:data[1],
                 fill: false,
                 backgroundColor: "rgba(200,30,30,0.4)",
                 borderColor: "rgba(230,10,10,1)"},
               { label:'湿度',
                 fill:false, 
                 data:data[2],}]
    }
  });
};


window.onload=function () {
    var data = [['12:00', '13:00', '14:00', '15:00', '16:00'],
                [22, 23, 21, 20, 19],
                [55, 50, 45, 43, 42]]
    drawGraph(data);
};
