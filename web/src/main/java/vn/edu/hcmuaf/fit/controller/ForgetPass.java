package vn.edu.hcmuaf.fit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.dao.UserDao;
import vn.edu.hcmuaf.fit.service.MailService;

@WebServlet(value ="/forget",name = "forget")
public class ForgetPass extends HttpServlet{

    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
//        req.setCharacterEncoding("utf8");
       resp.sendRedirect("quenmatkhau.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
//        req.setCharacterEncoding("utf8");
        String email = req.getParameter("email");
        System.out.println(email);
        User user = null;
        try {
            user = userDao.getUserByEmail(email);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        MailService mailService = new MailService();
        String erro;
        if(user!=null){
            String pass=user.getPass();
            System.out.println(pass);
            mailService.sendMail(email,"Lấy lại mật khẩu","mật khẩu của bạn là: "+pass);

            req.getRequestDispatcher("changepasswordInfor.jsp").forward(req,resp);
        }else{
          erro="Không tìm thấy tài khoản với email ("+email+" )";
            req.setAttribute("erro",erro);
            req.getRequestDispatcher("quenmatkhau.jsp").forward(req,resp);
        }
    }

}
