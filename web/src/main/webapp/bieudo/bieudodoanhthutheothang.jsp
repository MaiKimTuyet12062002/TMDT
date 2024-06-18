<%@ page import="vn.edu.hcmuaf.fit.service.ThongkeInvoice" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Invoice" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <%
        ArrayList<Invoice> in = new ThongkeInvoice().thongKeTheoThangHeThong();
        String ok = (String) session.getAttribute("okthang");
        String thang = (String) session.getAttribute("month");
        if (ok != null) {
            if (ok.equals("ok")) {
                in = new ThongkeInvoice().getAllMonth(thang);
            } else {
                in = new ThongkeInvoice().thongKeTheoThangHeThong();
            }
        }
    %>

    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Date');
            data.addColumn('number', 'Total');

            <% if (in != null && in.size() > 0) {
                for (Invoice ts : in) {
                    String dateString = ts.getDatecreate().toString();
            %>
            data.addRow(['<%= dateString %>', <%= ts.getTotal() %>]);
            <% }} %>

            var options = {
                title: 'Total Revenue by Date',
                chartType: 'ColumnChart',
                legend: { position: 'bottom' },
                hAxis: {
                    title: 'Date'
                },
                vAxis: {
                    title: 'Total Revenue'
                }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
<div id="chart_div" style="width: 900px; height: 500px;"></div>
</body>
</html>
