<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ChartDashboard.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

 <script type="text/javascript">

     //$("#btnClick").live("click", function () {
        
        

     //});
     debugger;
     google.charts.load('current', { 'packages': ['gauge'] });
     drawChart(10, 20.30, 40);
       
        var options = {
            width: 250,
            height: 250,
            redFrom: 30,
            redTo: 0,
            yellowFrom: 60,
            yellowTo: 30,
            greenFrom: 100,
            greenTo: 60,
            minorTicks: 100,
            max: 0,
            min: 100,
            majorTicks: ['100', '1']
        };
        function drawChart(Inward,Outward,Ngrp,Rgp) {
            debugger;
            google.setOnLoadCallback(DrawInward(Inward));
            google.setOnLoadCallback(DrawOutward(Outward));
            google.setOnLoadCallback(DrawNgrp(Ngrp));
            google.setOnLoadCallback(DrawRgp(Rgp));



            function DrawInward(value) {

                var data = google.visualization.arrayToDataTable([
              ['Label', 'Value'],
              ['Inward', value]
                ]);
                let Inwardchart = new google.visualization.Gauge(document.getElementById('Inward'));
                Inwardchart.draw(data, options);

            }

            function DrawOutward(value) {

                var data = google.visualization.arrayToDataTable([
              ['Label', 'Value'],
              ['Outward', value]
                ]);
                let Outwardchart = new google.visualization.Gauge(document.getElementById('Outward'));
                Outwardchart.draw(data, options);


            }
            function DrawNgrp(value) {

                var data = google.visualization.arrayToDataTable([
               ['Label', 'Value'],
               ['NGRP', value]
                ]);
                let nGrpchart = new google.visualization.Gauge(document.getElementById('Ngrp'));
                nGrpchart.draw(data, options);


            }
            function DrawRgp(value) {
                var data = google.visualization.arrayToDataTable([
                ['Label', 'Value'],
                ['RGP', value]
                ]);
                let rgpchart = new google.visualization.Gauge(document.getElementById('RGP'));
                rgpchart.draw(data, options);
            }
        }
    </script>
     </head>


<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnClick" runat="server" Text="Click" />
     <div style="display: table;">
        <div style="display: table-row;">
            <div id="Inward" style="display: table-cell;width: auto; height: auto;border:2px inset grey;"></div>
            <div id="Outward" style="display: table-cell;width: auto; height: auto;border:2px inset grey;"></div>
        </div>
        <div style="display: table-row;">
            <div id="Ngrp" style="display: table-cell;width: auto; height: auto;border:2px inset grey;"></div>
            <div id="RGP" style="display: table-cell;width: auto; height: auto;border:2px inset grey;"></div>
        </div>
    </div>
    </form>
</body>
</html>
