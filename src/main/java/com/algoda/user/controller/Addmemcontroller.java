//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.user.controller;

import com.algoda.member.model.Memberdao;
import com.algoda.member.model.Memberdto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/Memberjoin.do"})
public class Addmemcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Addmemcontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/login/Memberjoin.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        int hint = Integer.parseInt(request.getParameter("hint"));
        String hint_asw = request.getParameter("hint_asw");
        Memberdao memberdao = new Memberdao();
        Memberdto dto = new Memberdto();
        dto.setId(id);
        dto.setName(name);
        dto.setPwd(pwd);
        dto.setEmail(email);
        dto.setTel(tel);
        dto.setHint(hint);
        dto.setHint_asw(hint_asw);
        int joinCount = memberdao.addMember(dto);
        if (joinCount == 1) {
            response.sendRedirect("login/Login.jsp");
        }

    }
}
