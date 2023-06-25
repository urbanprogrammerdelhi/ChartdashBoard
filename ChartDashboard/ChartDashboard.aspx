<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartDashboard.aspx.cs" Inherits="ChartDashboard.ChartDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="json2.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['gauge'] });
        google.charts.setOnLoadCallback(drawChart);
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
        function drawChart() {


            $.ajax({
                type: 'POST',
                url: 'ChartDashboard.aspx/fetchCourierReport',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (r) {
                    debugger;
                    google.setOnLoadCallback(DrawInward(r.d.InwardCount));
                    google.setOnLoadCallback(DrawOutward(r.d.OutwardCount));
                    google.setOnLoadCallback(DrawNgrp(r.d.NGRPCount));
                    google.setOnLoadCallback(DrawRgp(r.d.RGPcount));

                }
            });
           



        }
        function DrawInward(value) {
            debugger;
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
    </script>
</head>


<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnClick" runat="server" Text="Click" />
        <div style="display: table;">
            <div style="display: table-row;">
                <div id="Inward" style="display: table-cell; width: auto; height: auto; border: 2px inset grey;"></div>
                <div id="Outward" style="display: table-cell; width: auto; height: auto; border: 2px inset grey;"></div>
            </div>
            <div style="display: table-row;">
                <div id="Ngrp" style="display: table-cell; width: auto; height: auto; border: 2px inset grey;"></div>
                <div id="RGP" style="display: table-cell; width: auto; height: auto; border: 2px inset grey;"></div>
            </div>
        </div>
    </form>
</body>
</html>
