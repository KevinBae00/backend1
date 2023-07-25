//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.admin.controller;

import com.algoda.word.model.Wordadao;
import com.algoda.word.model.Wordbdao;
import com.algoda.word.model.Wordcdao;
import com.algoda.word.model.Worddto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet({"/admin.do"})
public class Admincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Admincontroller() {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Worddto> worddtoList = null;
        String section = "미정";
        int level = Integer.parseInt(req.getParameter("adminlevel"));
        if (level == 1) {
            section = "중등 영단어";
            Wordadao wordadao = new Wordadao();
            worddtoList = wordadao.getWordAList();
        } else if (level == 2) {
            section = "수능 영단어";
            Wordbdao wordbdao = new Wordbdao();
            worddtoList = wordbdao.getWordBList();
        } else if (level == 3) {
            section = "직장인 영단어";
            Wordcdao wordcdao = new Wordcdao();
            worddtoList = wordcdao.getWordCList();
        }

        req.setAttribute("level", level);
        req.setAttribute("section", section);
        req.setAttribute("adminWords", worddtoList);
        req.getRequestDispatcher("/admin/Admin.jsp").forward(req, resp);
    }
}
