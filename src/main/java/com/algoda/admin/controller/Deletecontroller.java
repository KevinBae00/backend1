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
import java.io.PrintWriter;

@WebServlet({"/delete.do"})
public class Deletecontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Deletecontroller() {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String word = req.getParameter("word");
        int level = Integer.parseInt(req.getParameter("level"));
        System.out.println(word);
        System.out.println(level);
        Worddto dto;
        if (level == 1) {
            Wordadao dao = new Wordadao();
            dto = new Worddto();
            dto.setWord(word);
            dao.deleteWordA(dto);
            this.alertLocation(resp, "삭제되었습니다.", "admin.do?adminlevel=" + level);
        } else if (level == 2) {
            Wordbdao dao = new Wordbdao();
            dto = new Worddto();
            dto.setWord(word);
            dao.deleteWord(dto);
            this.alertLocation(resp, "삭제되었습니다.", "admin.do?adminlevel=" + level);
        } else if (level == 3) {
            Wordcdao dao = new Wordcdao();
            dto = new Worddto();
            dto.setWord(word);
            dao.deleteWord(dto);
            this.alertLocation(resp, "삭제되었습니다.", "admin.do?adminlevel=" + level);
        }

    }

    private void alertLocation(HttpServletResponse resp, String msg, String url) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            String script = "<script>    alert('" + msg + "');" + "    location.href='" + url + "';" + "</script>";
            writer.print(script);
        } catch (Exception var6) {
        }

    }
}
