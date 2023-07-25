//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.exam.controller;

import com.algoda.member.model.Memberdao;
import com.algoda.member.model.Memberdto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

@WebServlet({"/rank.do"})
public class Rankcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Rankcontroller() {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Memberdao memberdao = new Memberdao();
        List<Rankdto> rankdtoList = new ArrayList();
        int level = Integer.parseInt(req.getParameter("level"));
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");
        String section = "미정";
        List<Memberdto> memberdtoList = memberdao.listMember();
        Memberdto member;
        Iterator var11;
        Rankdto rankdto;
        if (level == 1) {
            var11 = memberdtoList.iterator();

            while (var11.hasNext()) {
                member = (Memberdto) var11.next();
                rankdto = new Rankdto();
                rankdto.setId(member.getId());
                rankdto.setName(member.getName());
                rankdto.setScore((float) ((double) Math.round((float) member.getScorea() / (float) member.getAcount() * 100.0F) / 100.0));
                rankdto.setCount(member.getAcount());
                rankdtoList.add(rankdto);
            }

            Collections.sort(rankdtoList, (new RankScoreComparator()).reversed());
            section = "중등 영단어";
        } else if (level == 2) {
            var11 = memberdtoList.iterator();

            while (var11.hasNext()) {
                member = (Memberdto) var11.next();
                rankdto = new Rankdto();
                rankdto.setId(member.getId());
                rankdto.setName(member.getName());
                rankdto.setScore((float) ((double) Math.round((float) member.getScoreb() / (float) member.getBcount() * 100.0F) / 100.0));
                rankdto.setCount(member.getBcount());
                rankdtoList.add(rankdto);
            }

            Collections.sort(rankdtoList, (new RankScoreComparator()).reversed());
            section = "수능 영단어";
        } else if (level == 3) {
            var11 = memberdtoList.iterator();

            while (var11.hasNext()) {
                member = (Memberdto) var11.next();
                rankdto = new Rankdto();
                rankdto.setId(member.getId());
                rankdto.setName(member.getName());
                rankdto.setScore((float) ((double) Math.round((float) member.getScorec() / (float) member.getCcount() * 100.0F) / 100.0));
                rankdto.setCount(member.getCcount());
                rankdtoList.add(rankdto);
            }

            Collections.sort(rankdtoList, (new RankScoreComparator()).reversed());
            section = "직장인 영단어";
        }

        System.out.print("정렬된 후 의 arrList : ");
        Iterator<Rankdto> iter = rankdtoList.iterator();
        req.setAttribute("section", section);
        req.setAttribute("level", level);
        req.setAttribute("id", id);
        req.setAttribute("ranklist", rankdtoList);
        req.getRequestDispatcher("/rank/Ranking.jsp").forward(req, resp);
    }
}
