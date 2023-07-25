//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.main.controller;

import com.algoda.member.model.Memberdao;
import com.algoda.member.model.Memberdto;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet({"/main.do"})
public class Maincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Maincontroller() {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int day = 1;
        Random random = new Random();
        List<Worddto> worddtoList = new ArrayList();
        Worddto worddto = new Worddto();
        worddto.setDay(day);
        Wordadao wordadao = new Wordadao();
        Wordbdao wordbdao = new Wordbdao();
        Wordcdao wordcdao = new Wordcdao();
        List<Worddto> wordList = wordadao.getWordList(worddto);
        int randomnumber = random.nextInt(wordList.size());
        worddtoList.add((Worddto) wordList.get(randomnumber));
        wordList = wordbdao.getWordList(worddto);
        randomnumber = random.nextInt(wordList.size());
        worddtoList.add((Worddto) wordList.get(randomnumber));
        wordList = wordcdao.getWordList(worddto);
        randomnumber = random.nextInt(wordList.size());
        worddtoList.add((Worddto) wordList.get(randomnumber));
        HttpSession session = req.getSession();
        session.setAttribute("Todaywords", worddtoList);
        Memberdao memberdao = new Memberdao();
        String id = (String) session.getAttribute("id");
        String pwd = (String) session.getAttribute("pwd");
        Memberdto memberdto = memberdao.selectloginMember(id, pwd);
        String username = memberdto.getName();
        session.setAttribute("username", username);
        resp.sendRedirect("word/Main.jsp");
    }
}
