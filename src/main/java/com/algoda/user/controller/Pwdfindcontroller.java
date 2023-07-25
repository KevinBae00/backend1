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

@WebServlet({"/controller/pwd.do"})
public class Pwdfindcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Pwdfindcontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        int hint = Integer.parseInt(request.getParameter("hint"));
        String hint_asw = request.getParameter("hint_asw");
        System.out.println(id + email + hint + hint_asw);
        Memberdao memberdao = new Memberdao();
        Memberdto mdto = memberdao.searchPwd(id, email, hint, hint_asw);
        System.out.println("dto : " + mdto);
        if (mdto != null) {
            request.setAttribute("memberdto", mdto);
            request.getRequestDispatcher("/login/searchPwd.jsp").forward(request, response);
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
