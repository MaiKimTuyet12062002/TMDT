package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.FacebookPojo;
import vn.edu.hcmuaf.fit.bean.FacebookUtils;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.dao.UserDao;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginFacebook
 */
@WebServlet("/loginFacebook")
public class LoginFacebook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginFacebook() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		System.out.println(code);
		FacebookUtils FB = new FacebookUtils();
		String accessToken = FB.getToken(code);
		System.out.println(accessToken);
		FacebookPojo acc = FB.getUserInfo(accessToken);
		System.out.println(acc + "aaaaaaaaaaaaaaaaaaa");
		request.setAttribute("id", acc.getId());
		request.setAttribute("name", acc.getName());
		request.setAttribute("email", acc.getEmail());

		String erro;
		if (acc != null) {
			UserDao l = new UserDao();
			User a = new User();
			a = l.checkUSERByEmail(acc.getEmail());

			if (a == null) {
				try {
					l.addUSERForFB(acc.getName(), acc.getEmail());
					a = l.checkUSERByEmail(acc.getEmail());
					HttpSession session = request.getSession();
					session.setAttribute("user", a);
					System.out.println("login thanh cong");
					RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else {
				if (a.getActive() == 2) {
					erro = "Tài khoản đã bị khóa";
					request.setAttribute("erro", erro);
					request.getRequestDispatcher("login.jsp").forward(request, response);

				} else {
//					System.out.println(a.getId());
					HttpSession session = request.getSession();
					session.setAttribute("user", a);
					System.out.println("login thanh cong");
					RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
					dispatcher.forward(request, response);
				}
			}
		} else {
			erro = "Đăng nhập không thành công! vui lòng đăng nhập lại!";
//			System.out.println(a.getId());
			request.setAttribute("erro", erro);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
