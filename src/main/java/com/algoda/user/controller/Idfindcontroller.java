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
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet({"/controller/login.do"})
public class Idfindcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Idfindcontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        int hint = Integer.parseInt(request.getParameter("hint"));
        String hint_asw = request.getParameter("hint_asw");
        System.out.println(email + pwd + hint + hint_asw);
        Memberdao memberdao = new Memberdao();
        Memberdto mdto = memberdao.searchId(email, pwd, hint, hint_asw);
        System.out.println("dto : " + mdto);
        if (mdto != null) {
            request.setAttribute("memberdto", mdto);
            request.getRequestDispatcher("/login/searchId.jsp").forward(request, response);
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('등록된 정보가 없습니다')");
            out.println("history.back()");
            out.println("</script>");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
