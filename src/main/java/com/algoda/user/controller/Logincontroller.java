//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.user.controller;

import com.algoda.member.model.Memberdao;
import com.algoda.member.model.Memberdto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet({"/Login.do"})
public class Logincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Logincontroller() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        System.out.println(id + " " + pwd);
        LoginService loginservice = new LoginService();
        Memberdto dto = loginservice.getLoginMember(id, pwd);
        if (dto != null) {
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("pwd", pwd);
            response.sendRedirect("main.do");
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인 실패')");
            out.println("history.back()");
            out.println("</script>");
        }

    }

    public class LoginService {
        public LoginService() {
        }

        public Memberdto getLoginMember(String id, String pwd) {
            Memberdao memberdao = new Memberdao();
            Memberdto memberdto = memberdao.selectloginMember(id, pwd);
            return memberdto;
        }
    }
}
