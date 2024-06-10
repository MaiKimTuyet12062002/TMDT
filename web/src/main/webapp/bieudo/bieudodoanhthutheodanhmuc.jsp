<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Invoice" %>
<%@ page import="vn.edu.hcmuaf.fit.service.DetailInvoiceService" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ThongkeInvoice" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.DetailInvoice" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.products" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CatalogService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <%
        ArrayList<Invoice> in = new ThongkeInvoice().thongKeTheoThangHeThong();
        List<Invoice> listI = (List<Invoice>) request.getAttribute("listi");
        String ok = (String) session.getAttribute("okthang");
        String thang = (String) session.getAttribute("month");
        if (ok != null) {
            if (ok.equals("ok")) {
                in = new ThongkeInvoice().getAllMonth(thang);
            } else {
                in = (ArrayList<Invoice>) listI;
            }
        }
        double total = 0;
        // Map để lưu tổng doanh thu của từng danh mục sản phẩm
        ArrayList<products> pro = (ArrayList<products>) new ProductService().getListProductALL();
        CatalogService service = new CatalogService();
        HashMap<String, Double> categoryTotal = new HashMap<>();
        HashMap<String, String> categoryColors = new HashMap<>(); // Map to store category colors

        // Mảng màu sắc cho các danh mục
        String[] colors = {"#3366CC", "#DC3912", "#FF9900", "#109618", "#990099", "#0099C6", "#DD4477", "#66AA00"};

        int colorIndex = 0;

        for (Invoice t1 : in) {
            ArrayList<DetailInvoice> details = new  DetailInvoiceService().getAllIn(t1.getIdIn());
            for(DetailInvoice detail: details){
                for(products p : pro){
                    if(detail.getIdpro() == p.getIdProduct()){
                        // Tính tổng doanh thu của từng danh mục sản phẩm
                        double revenue = detail.getQuantity() * p.getPriceNew();
                        total += revenue;
                        String category = p.getIdCategory(); // Assuming you have a method to get category
                        categoryTotal.put(category, categoryTotal.getOrDefault(category, 0.0) + revenue);

                        // Gán màu sắc cho danh mục
                        if (!categoryColors.containsKey(category)) {
                            categoryColors.put(category, colors[colorIndex % colors.length]);
                            colorIndex++;
                        }
                    }
                }
            }
        }
    %>
    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Category');
            data.addColumn('number', 'Total Revenue');
            data.addColumn({type: 'string', role: 'style'}); // Column for color

            <% for (Map.Entry<String, Double> entry : categoryTotal.entrySet()) { %>
            data.addRow(['<%= service.getName(entry.getKey()) %>', <%= entry.getValue() %>, '<%= categoryColors.get(entry.getKey()) %>']);
            <% } %>

            var options = {
                title: 'Total Revenue by Category',
                chartType: 'PieChart',
                legend: { position: 'bottom' },
                pieHole: 0.4,
                width: '100%',
                height: '100%'
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
<div id="chart_div" style="width: 500px; height: 600px;"></div>
</body>
</html>
