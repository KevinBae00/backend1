//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.word.controller;

import com.algoda.util.BoardPage;
import com.algoda.voc.model.Myvocdao;
import com.algoda.voc.model.Myvocdto;

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

@WebServlet({"/controller/voc.do"})
public class Vocabularycontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Vocabularycontroller() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Myvocdao dao = new Myvocdao();
        Map<String, Object> map = new HashMap();
        String searchWord = request.getParameter("searchWord");
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        map.put("id", id);
        if (searchWord != null) {
            map.put("searchWord", searchWord);
        }

        int totalCount = dao.selectCount(map);
        ServletContext application = this.getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
        int pageNum = 1;
        String pageTemp = request.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals("")) {
            pageNum = Integer.parseInt(pageTemp);
        }

        int start = (pageNum - 1) * pageSize + 1;
        int end = pageNum * pageSize;
        map.put("start", start);
        map.put("end", end);
        List<Myvocdto> boardLists = dao.selectListPage(map);
        dao.close();
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../controller/voc.do");
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);
        request.setAttribute("boardLists", boardLists);
        request.setAttribute("map", map);
        String mode = request.getParameter("mode");
        String word = request.getParameter("word");
        int alarm;
        if (mode != null && mode.equals("delete")) {
            dao = new Myvocdao();
            alarm = dao.deleteVoc(word, id);
            dao.close();
            if (alarm == 1) {
                System.out.println("단어장 해당 단어 삭제 완료");
                response.setContentType("text/html;charset=UTF-8");
                request.setAttribute("alarm", alarm);
            } else {
                System.out.println("단어장 해당 단어 삭제 실패");
            }
        } else if (mode != null && mode.equals("deleteAll")) {
            dao = new Myvocdao();
            alarm = dao.deleteVocAll(id);
            dao.close();
            if (alarm == 1) {
                System.out.println("단어장 전체 단어 삭제 완료");
                response.setContentType("text/html;charset=UTF-8");
                request.setAttribute("alarm", alarm);
            } else {
                System.out.println("단어장 전체 단어 삭제 실패");
            }
        }

        request.getRequestDispatcher("/list/Vocabulary.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
