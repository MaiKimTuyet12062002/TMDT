<%@ page import="vn.edu.hcmuaf.fit.service.ThongkeInvoice" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Invoice" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <%
        ArrayList<Invoice> in = new ThongkeInvoice().thongKeTheoNgayHeThong();
        String ok = (String) session.getAttribute("okngay");
        String ngay = (String) session.getAttribute("ngay");
        if (ok != null) {
            if (ok.equals("ok")) {
                in = new ThongkeInvoice().thongKeTheoNgay(ngay);
            } else {
                in = new ThongkeInvoice().thongKeTheoNgayHeThong();
            }
        }
    %>

    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Time');
            data.addColumn('number', 'Total');

            <% if (in != null && in.size() > 0) {
                for (Invoice ts : in) {
                    String dateString = ts.getDatecreate().toString();
                    String timeString = dateString.substring(dateString.indexOf(" ") + 1);
            %>
            data.addRow(['<%= timeString %>', <%= ts.getTotal() %>]);
            <% }} %>

            var options = {
                title: 'Total by Time',
                chartType: 'ColumnChart',
                legend: { position: 'bottom' },
                hAxis: {
                    title: 'Time',
                    format: 'HH:mm:ss'
                },
                width: 1000, // Set width to 1000 pixels
                height: 600 // Set height to 600 pixels
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
<div id="chart_div" style="width: 1000px; height: 600px;"></div>
</body>
</html>
