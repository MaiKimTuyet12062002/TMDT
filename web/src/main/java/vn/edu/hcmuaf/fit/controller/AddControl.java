package vn.edu.hcmuaf.fit.controller;

//import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.bean.products;
//import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.ManagerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddControl", value = "/addProduct")
public class AddControl extends HttpServlet {
    String name = "AUTH";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int pid = Integer.parseInt(request.getParameter("id"));
        String pname = request.getParameter("name");
        String pimage = request.getParameter("image");
        String pprice_new = request.getParameter("price_new");
        String pprice_old = request.getParameter("price_old");
        String pquantityStock = request.getParameter("quantityStock");
        String pdescription = request.getParameter("description");
        String pcategory = request.getParameter("category");


        products product = new products();
        product.setIdProduct(pid);
        product.setNameProduct(pname);
        product.setImage(pimage);
        product.setPriceNew(Integer.parseInt(pprice_new));
        product.setPriceOld(Integer.parseInt(pprice_old));
        product.setQuantityStock(Integer.parseInt(pquantityStock));
        product.setDescription(pdescription);
        product.setIdCategory(pcategory);
        ManagerService.addProduct(product);
//        Log log = new Log(Log.INFO, -1, this.name, "", 0);
//        log.setSrc(this.name + "Add product sussec");
//        log.setContent("Add product sussec:- " + pname);
//        log.setLevel(Log.INFO);
//        DB.me().insert(log);
        System.out.println(product);
        response.sendRedirect("/manageControl");

    }
}
