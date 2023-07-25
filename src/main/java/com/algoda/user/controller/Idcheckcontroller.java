//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.user.controller;

import com.algoda.member.model.Memberdao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet({"/login/Idcheck.do"})
public class Idcheckcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Idcheckcontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        PrintWriter out = response.getWriter();
        Memberdao dao = new Memberdao();
        int idCheck = dao.checkId(id);
        String message = "";
        int check = 0;
        if (id.equals("admin")) {
            idCheck = 0;
        }

        if (idCheck == 0) {
            message = "이미 존재하는 아이디입니다.";
        } else if (idCheck == 1) {
            message = "사용 가능한 아이디입니다.";
            check = 1;
        }

        out.write(String.valueOf(idCheck));
        request.setAttribute("check", Integer.valueOf(check));
        request.setAttribute("message", message);
        RequestDispatcher dis = request.getRequestDispatcher("Idcheck.jsp");
        dis.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
