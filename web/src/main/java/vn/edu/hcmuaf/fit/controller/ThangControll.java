package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Invoice;
import vn.edu.hcmuaf.fit.service.ThongkeInvoice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "theothang", value = "/theothang")
public class ThangControll extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String month = request.getParameter("thang");
        ThongkeInvoice in = new ThongkeInvoice();
        List<Invoice> list = in.getAllMonth((month));
        String okthang ="none";
        if(list.size()!=0){
            okthang="ok";
        }
        HttpSession session = request.getSession();
        session.setAttribute("okthang", okthang);
        session.setAttribute("month", month);
        response.sendRedirect("danhmuc.jsp");
//        request.getRequestDispatcher("Thongketheothang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
