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
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet({"/boardview.do"})
public class Boardviewcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Boardviewcontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boarddao dao = new Boarddao();
        new Boarddto();
        String title = request.getParameter("title");
        String mode = request.getParameter("mode");
        if (title != null && mode == null) {
            dao.updateVisitCount(title);
        }

        Boarddto dto = dao.selectView(title);
        dao.close();
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
        title = dto.getTitle();
        String writer = dto.getWriter();
        new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String postdate = dateFormat.format(dto.getPostdate());
        HttpSession session = request.getSession();
        session.setAttribute("view_postdate", postdate);
        int visitcount = dto.getVisitcount();
        String content = dto.getContent();
        String update_pwd = dto.getUpdate_pwd();
        if (title != null && mode == null) {
            response.sendRedirect("board/View.jsp?title=" + title + "&writer=" + writer + "&visitcount=" + visitcount + "&content=" + content);
        } else if (title != null && mode != null && mode.equals("editview")) {
            response.sendRedirect("board/Edit.jsp?title=" + title + "&writer=" + writer + "&update_pwd=" + update_pwd + "&content=" + content);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
