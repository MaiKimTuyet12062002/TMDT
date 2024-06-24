package vn.edu.hcmuaf.fit.controller;
import vn.edu.hcmuaf.fit.service.InvoiceService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "cancelOrder", value = "/cancelOrder")
public class CancelOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idorder=request.getParameter("orderId");
        InvoiceService invoiceService = new InvoiceService();
        invoiceService.removeOder(idorder);
        request.getRequestDispatcher("historyinvoice").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
