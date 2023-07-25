//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.admin.controller;

import com.algoda.member.model.Memberdao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet({"/wordcheck.do"})
public class Wordcheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Wordcheck() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String word = request.getParameter("word");
        PrintWriter out = response.getWriter();
        Memberdao dao = new Memberdao();
        int wordCheck = dao.checkword(word);
        String message = "";
        if (wordCheck == 0) {
            message = "이미 존재하는 단어입니다.";
        } else if (wordCheck == 1) {
            message = "사용 가능한 단어입니다.";
        }

        out.write(String.valueOf(wordCheck));
        request.setAttribute("message", message);
        RequestDispatcher dis = request.getRequestDispatcher("admin/wordCheck.jsp");
        dis.forward(request, response);
    }
}
