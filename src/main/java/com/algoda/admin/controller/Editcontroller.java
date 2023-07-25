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
import java.io.IOException;

@WebServlet({"/edit.do"})
public class Editcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Editcontroller() {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int level = Integer.parseInt(req.getParameter("level"));
        String word = req.getParameter("word");
        Worddto worddto = new Worddto();
        worddto.setWord(word);
        Worddto pagedto = null;
        if (level == 1) {
            Wordadao wordadao = new Wordadao();
            pagedto = wordadao.getWordA(worddto);
        } else if (level == 2) {
            Wordbdao wordadao = new Wordbdao();
            pagedto = wordadao.getWord(worddto);
        } else if (level == 3) {
            Wordcdao wordadao = new Wordcdao();
            pagedto = wordadao.getWord(worddto);
        }

        String mode = "edit";
        req.setAttribute("mode", mode);
        req.setAttribute("adminlevel", level);
        req.setAttribute("pagedto", pagedto);
        req.getRequestDispatcher("admin/detail.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Worddto worddto = new Worddto();
        worddto.setWord(req.getParameter("word"));
        worddto.setDay(Integer.parseInt(req.getParameter("day")));
        worddto.setMeaninga(req.getParameter("mean1"));
        worddto.setMeaningb(req.getParameter("mean2"));
        worddto.setMeaningc(req.getParameter("mean3"));
        worddto.setSimilar_worda(req.getParameter("synonym1"));
        worddto.setSimilar_wordb(req.getParameter("synonym2"));
        worddto.setSimilar_wordc(req.getParameter("synonym3"));
        System.out.println(worddto.toString());
        int level = Integer.parseInt(req.getParameter("level"));
        if (level == 1) {
            Wordadao wordadao = new Wordadao();
            wordadao.updateWordA(worddto);
        } else if (level == 2) {
            Wordbdao wordbdao = new Wordbdao();
            wordbdao.updateWord(worddto);
        } else if (level == 3) {
            Wordcdao wordcdao = new Wordcdao();
            wordcdao.updateWord(worddto);
        }

        resp.sendRedirect("admin.do?adminlevel=" + level);
    }
}
