<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Miles</title>
<style>
h1 {
    color: maroon;
    font-family: Bedrock;
    font-size: 300%;
</style> 
 <center>
    <h1>Fitbit Statistics Applications </h1>
    </center>
</head>
<body>
    
     <br>  
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
        
      <li  class="active" ><a href="./mile.html">Miles</a></li>
      <li><a href="./step.html">Steps</a></li>
      <li><a href="./maps.html">Maps</a></li>
    </ul>
  </div>
</nav>
<div id="chart_div"></div>

<br>
<br>
<br>
<br>
<br>
<script>
var total_miles=0.0;
var xmlhttp = new XMLHttpRequest();
var url = "miles.json";
//var url1 = "miles.json";
var myArr


xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myArr = JSON.parse(this.responseText);
        //myFunction(myArr);
    }
};
xmlhttp.open("GET", url, true);
xmlhttp.send();

/*function myFunction(arr) {
	//document.getElementById("id01").innerHTML = arr[0].steps[0].url;
	var out = "";
    var i;
    for(i = 0; i < arr.activitiessteps.length; i++) {
        out += '<b>' + arr.activitiessteps[i].dateTime + '</b>' +
        arr.activitiessteps[i].value + '<br>';
    }
    document.getElementById("id01").innerHTML = out;
}*/
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

	var data = new google.visualization.DataTable();
	var i,j;
    data.addColumn('string', 'Date');
    data.addColumn('number', 'Miles');
    data.addRows(myArr.activitiesdistance.length);
    for(i = 0; i < myArr.activitiesdistance.length; i++) {
    	data.setCell(i,0, myArr.activitiesdistance[i].dateTime);
        data.setCell(i,1, myArr.activitiesdistance[i].value);
        
    }     

    var options = {
      title: 'Daily Miles Report',
      colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
      width: 1500,
      height: 500,
      hAxis: {
        title: 'Date',
        minValue: 0
      },
      vAxis: {
        title: 'Miles'
      }
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));

    chart.draw(data, options);
  }

</script>

</body>
</html>