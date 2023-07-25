//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.board.controller;

import com.algoda.board.model.Boarddao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/boardedit.do"})
public class Boardeditcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Boardeditcontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mode = request.getParameter("mode");
        System.out.println(mode);
        Boarddao dao = new Boarddao();
        int result = 0;
        String title;
        if (mode.equals("delete")) {
            title = request.getParameter("title");
            System.out.println(title);
            result = dao.deletePost(title);
        } else if (mode.equals("edit")) {
            title = request.getParameter("title");
            System.out.println(title);
            String context = request.getParameter("context");
            String writer = request.getParameter("writer");
            String update_pwd = request.getParameter("update_pwd");
            result = dao.updatePost(title, context, writer, update_pwd);
            System.out.println(result);
        }

        if (result == 1) {
            response.sendRedirect("../boardlist.do");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
