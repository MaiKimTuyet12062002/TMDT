package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.DetailInvoice;
import vn.edu.hcmuaf.fit.bean.Invoice;
import vn.edu.hcmuaf.fit.bean.products;
import vn.edu.hcmuaf.fit.service.DetailInvoiceService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.ThongkeInvoice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "DanhmucControll", value = "/thongkedanhmuc")
public class DanhmucControll extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String month = request.getParameter("thang");
        ArrayList<Invoice> in = new ThongkeInvoice().getAllInvoice();
        double total = 0;
        // Map để lưu tổng doanh thu của từng danh mục sản phẩm
        ArrayList<products> pro = (ArrayList<products>) new ProductService().getListProductALL();
        HashMap<String, Double> categoryTotal = new HashMap<>();
        for (Invoice t1 : in) {
            ArrayList<DetailInvoice> details = new DetailInvoiceService().getAllIn(t1.getIdIn());
            for(DetailInvoice detail: details){
                for(products p : pro){
                    if(detail.getIdpro() == p.getIdProduct()){
                        // Tính tổng doanh thu của từng danh mục sản phẩm
                        double revenue = detail.getQuantity() * p.getPriceNew();
                        total += revenue;
                        String category = p.getIdCategory(); // Assuming you have a method to get category
                        categoryTotal.put(category, categoryTotal.getOrDefault(category, 0.0) + revenue);
                    }
                }
            }
        }
        HttpSession session = request.getSession();
        session.setAttribute("cate", categoryTotal);
        request.getRequestDispatcher("danhmuc.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
