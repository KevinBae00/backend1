//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.exam.controller;

import com.algoda.member.model.Memberdao;
import com.algoda.member.model.Memberdto;
import com.algoda.voc.model.Myvocdto;
import com.algoda.word.model.Worddto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/result.do"})
public class ResultController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ResultController() {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String[] anslist = req.getParameterValues("ans");
        int right = 0;
        String examtype = (String) session.getAttribute("examType");
        ArrayList list;
        ArrayList checkdtoList;
        int i;
        Checkdto checkdto;
        if (examtype.equals("words")) {
            list = (ArrayList) session.getAttribute("examLists");
            checkdtoList = new ArrayList();

            for (i = 0; i < 10; ++i) {
                checkdto = new Checkdto();
                checkdto.setAns(anslist[i]);
                checkdto.setWord(((Worddto) list.get(i)).getWord());
                checkdto.setMeaninga(((Worddto) list.get(i)).getMeaninga());
                checkdto.setMeaningb(((Worddto) list.get(i)).getMeaningb());
                checkdto.setMeaningc(((Worddto) list.get(i)).getMeaningc());
                checkdto.setSimiliar_worda(((Worddto) list.get(i)).getSimilar_worda());
                System.out.println(i + ":" + checkdto.getAns());
                checkdto.setCheck(checkdto.getAns() != null && checkdto.getAns().equals(checkdto.getMeaninga()) || checkdto.getAns().equals(checkdto.getMeaningb()) || checkdto.getAns().equals(checkdto.getMeaningc()));
                if (checkdto.isCheck()) {
                    ++right;
                }

                checkdtoList.add(checkdto);
            }

            Memberdao memberdao = new Memberdao();
            String id = (String) session.getAttribute("id");
            String pwd = (String) session.getAttribute("pwd");
            Memberdto memberdto = memberdao.selectloginMember(id, pwd);
            int level = (Integer) session.getAttribute("wordLevel");
            if (level == 1) {
                memberdto.setScorea(memberdto.getScorea() + right);
                memberdto.setAcount(memberdto.getAcount() + 1);
            } else if (level == 2) {
                memberdto.setScoreb(memberdto.getScoreb() + right);
                memberdto.setBcount(memberdto.getBcount() + 1);
            } else if (level == 3) {
                memberdto.setScorec(memberdto.getScorec() + right);
                memberdto.setCcount(memberdto.getCcount() + 1);
            }

            System.out.println(memberdto.toString());
            memberdao.updateMember(memberdto);
            String timer = req.getParameter("Timer");
            System.out.println(timer);
            req.setAttribute("Timer", timer);
            req.setAttribute("right", right);
            req.setAttribute("checklist", checkdtoList);
        } else if (examtype.equals("myvoc")) {
            list = (ArrayList) session.getAttribute("examLists");
            checkdtoList = new ArrayList();

            for (i = 0; i < 10; ++i) {
                checkdto = new Checkdto();
                checkdto.setAns(anslist[i]);
                checkdto.setWord(((Myvocdto) list.get(i)).getWord());
                checkdto.setMeaninga(((Myvocdto) list.get(i)).getMEANINGA());
                checkdto.setMeaningb(((Myvocdto) list.get(i)).getMEANINGB());
                checkdto.setMeaningc(((Myvocdto) list.get(i)).getMEANINGC());
                checkdto.setSimiliar_worda(((Myvocdto) list.get(i)).getSIMILAR_WORDA());
                System.out.println(i + ":" + checkdto.getAns());
                checkdto.setCheck(checkdto.getAns() != null && checkdto.getAns().equals(checkdto.getMeaninga()) || checkdto.getAns().equals(checkdto.getMeaningb()) || checkdto.getAns().equals(checkdto.getMeaningc()));
                if (checkdto.isCheck()) {
                    ++right;
                }

                checkdtoList.add(checkdto);
            }

            String timer = req.getParameter("Timer");
            System.out.println(timer);
            req.setAttribute("Timer", timer);
            req.setAttribute("right", right);
            req.setAttribute("checklist", checkdtoList);
        }

        req.getRequestDispatcher("/exam/Result.jsp").forward(req, resp);
    }
}
