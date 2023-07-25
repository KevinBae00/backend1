//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.word.controller;

import com.algoda.util.BoardPage;
import com.algoda.word.model.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet({"/controller/word.do"})
public class Wordlistcontroller extends HttpServlet {
    public Wordlistcontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        session.setAttribute("wordDay", "1");
        String wordLevel = request.getParameter("wordLevel");
        if (wordLevel != null) {
            int level = Integer.parseInt(wordLevel);
            System.out.println("wordLevel:" + wordLevel);
            session.setAttribute("wordLevel", wordLevel);
            session.setAttribute("wordLevelQuiz", level);
        } else {
            int level = Integer.parseInt(wordLevel);
            session.setAttribute("wordLevelQuiz", level);
            wordLevel = (String) session.getAttribute("wordLevel");

        }

        String pageTemp = request.getParameter("pageNum");
        String wordDay = request.getParameter("wordDay");
        if (wordDay != null) {
            int day = Integer.parseInt(wordDay);
            System.out.println(day);
            session.setAttribute("wordDay", wordDay);
            session.setAttribute("wordDayQuiz", day);
        } else {
            wordDay = (String) session.getAttribute("wordDay");
            session.setAttribute("wordDayQuiz", 1);
            System.out.println(wordDay);
        }

        Object dao;
        if (wordLevel != null && wordLevel.equals("1")) {
            dao = new Wordadao();
            request.setAttribute("section", "중등 영어");
        } else if (wordLevel != null && wordLevel.equals("2")) {
            dao = new Wordbdao();
            request.setAttribute("section", "수능 영어");
        } else if (wordLevel != null && wordLevel.equals("3")) {
            dao = new Wordcdao();
            request.setAttribute("section", "직장인 영어");
        } else {
            dao = null;
        }

        if (dao != null) {
            Map<String, Object> map = new HashMap();
            String searchWord = request.getParameter("searchWord");
            if (searchWord != null) {
                map.put("searchWord", searchWord);
                System.out.println(searchWord);
            }

            int totalCount = ((Worddao) dao).selectCount(map);
            ServletContext application = this.getServletContext();
            int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
            int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
            int pageNum = 1;
            if (pageTemp != null && !pageTemp.equals("")) {
                pageNum = Integer.parseInt(pageTemp);
            }

            int start = (pageNum - 1) * pageSize + 1;
            int end = pageNum * pageSize;
            map.put("start", start);
            map.put("end", end);
            map.put("wordDay", wordDay);
            List<Worddto> boardLists = ((Worddao) dao).selectListPage(map);
            String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, wordLevel, wordDay, pageNum, "../controller/word.do");
            map.put("pagingImg", pagingImg);
            map.put("totalCount", totalCount);
            map.put("pageSize", pageSize);
            map.put("pageNum", pageNum);
            request.setAttribute("boardLists", boardLists);
            request.setAttribute("map", map);
            request.setAttribute("wordLevel", wordLevel);
            String insertingword = request.getParameter("word");
            if (insertingword != null) {
                int working = ((Worddao) dao).insertMyvoc(insertingword);
                if (working == 1) {
                    System.out.println("단어장 입력 성공");
                } else {
                    System.out.println("단어장 입력 실패");
                }
            }

            ((Worddao) dao).close();
            request.getRequestDispatcher("/list/Wordlist.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
