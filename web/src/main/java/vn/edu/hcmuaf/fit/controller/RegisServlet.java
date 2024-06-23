package vn.edu.hcmuaf.fit.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hcmuaf.fit.dao.UserDao;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.service.MailService;

@WebServlet(value = { "/regis", "/successRegis", "/failRegis"})
public class RegisServlet extends HttpServlet {

	private UserDao userDao = new UserDao();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String path = req.getServletPath();
		System.out.println("=== path: " + path);
		RequestDispatcher rd = null;
		switch (path) {
			case "/regis":
				rd = req.getRequestDispatcher("/regis.jsp");
				break;
			case "/successRegis":
//				String key = req.getParameter("key");
//				if (key != null || key.equals("")) {
//					System.out.println(key);
//					userDao.activeByActivationKey(key);
//					req.setAttribute("mess", "dang ky thanh cong, hay dang nhap");
//					rd = req.getRequestDispatcher("/login.jsp");
//				}
				req.setAttribute("mess", "Đăng ký thành công, hãy đăng nhập!!");
				rd = req.getRequestDispatcher("/login.jsp");
				break;
			case "/failRegis":
				req.setAttribute("mess", "Đăng ký thất bại!!");
				rd = req.getRequestDispatcher("/regis.jsp");
				break;
			default:
				break;
		}
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String activationKey = MailService.randomKey();
		String ten = req.getParameter("fullname");
		String email = req.getParameter("email");
		String sdt = req.getParameter("sodt");
		String pass = req.getParameter("pass");
		String repass = req.getParameter("repass");

		if(pass.equals(repass) || pass == "" || pass.length() < 6 || email == "" || !(sdt.matches("^0\\d{9}$"))){
			System.out.println("vô đây");
			resp.sendRedirect(req.getContextPath() + "/failRegis");
		}else{
			if(userDao.checkUSERByEmail(email) == null){
				Thread run = new Thread(new Runnable() {
					public void run() {
						new MailService().sendMail(email,"Đăng ký tài khoản", "bạn đã trở thành thành viên của shop bán thức ăn nhanh!!!");
					}
				});
				run.start();

				User u = new User();
				u.setKeyactive(activationKey);
				u.setActive(1);
				u.setEmailUs(email);
				u.setRoleUs(0);
				u.setRegistrationDate(new Date(System.currentTimeMillis()));
				u.setPass(pass);
				u.setPhone(sdt);
				u.setNameUser(ten);
				u.setManager(0);

				System.out.println(activationKey);
				try {
					userDao.saveUser(u);
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
				resp.sendRedirect(req.getContextPath() + "/successRegis");
			}else{
				resp.sendRedirect(req.getContextPath() + "/failRegis");
			}
		}
	}


	public static void main(String[] args) {

	}

}