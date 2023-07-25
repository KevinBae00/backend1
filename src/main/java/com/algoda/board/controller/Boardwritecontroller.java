//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.board.controller;

import com.algoda.board.model.Boarddao;
import com.algoda.board.model.Boarddto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({"/boardwrite.do"})
public class Boardwritecontroller extends HttpServlet {
    public Boardwritecontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boarddao dao = new Boarddao();
        Boarddto dto = new Boarddto();
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        dto.setTitle(request.getParameter("title"));
        dto.setWriter(request.getParameter("writer"));
        dto.setUpdate_pwd(request.getParameter("update_pwd"));
        dto.setContent(request.getParameter("content"));
        dto.setID(id);
        int result = dao.insertBoard(dto);
        if (result == 1) {
            System.out.println("게시물 입력 성공.");
            response.sendRedirect("./boardlist.do");
        } else {
            System.out.println("게시물 입력 실패.");
            response.sendRedirect("board/Write.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
