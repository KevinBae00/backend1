//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.exam.controller;

import com.algoda.voc.model.Myvocdao;
import com.algoda.voc.model.Myvocdto;
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

@WebServlet({"/exam.do"})
public class Examcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Examcontroller() {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String method = req.getParameter("method");
        if (method != null) {
            int[] randomnumber = new int[10];
            Random random = new Random();
            List<Myvocdto> myvocdtoList = new ArrayList();
            Myvocdao myvocdao = new Myvocdao();
            List<Myvocdto> wordList = myvocdao.selectExamList();

            int i;
            for (i = 0; i < 10; ++i) {
                randomnumber[i] = random.nextInt(wordList.size());

                for (int j = 0; j < i; ++j) {
                    if (randomnumber[i] == randomnumber[j]) {
                        --i;
                    }
                }
            }

            for (i = 0; i < 10; ++i) {
                myvocdtoList.add((Myvocdto) wordList.get(randomnumber[i]));
            }

            session.setAttribute("examLists", myvocdtoList);
            session.setAttribute("examType", "myvoc");
            req.setAttribute("method", "vol");
            req.getRequestDispatcher("/exam/Exam.jsp").forward(req, resp);
        } else {
            int level = (Integer) session.getAttribute("wordLevelQuiz");
            int day = (Integer) session.getAttribute("wordDayQuiz");
            int[] randomnumber = new int[10];
            Random random = new Random();
            List<Worddto> worddtoList = new ArrayList();
            Worddto worddto = new Worddto();
            worddto.setDay(day);
            List wordCList;
            if (level == 1) {
                Wordadao wordadao = new Wordadao();
                wordCList = wordadao.getWordList(worddto);
                this.randomQ(randomnumber, random, worddtoList, wordCList);
            } else if (level == 2) {
                Wordbdao wordbdao = new Wordbdao();
                wordCList = wordbdao.getWordList(worddto);
                this.randomQ(randomnumber, random, worddtoList, wordCList);
            } else if (level == 3) {
                Wordcdao wordcdao = new Wordcdao();
                wordCList = wordcdao.getWordList(worddto);
                this.randomQ(randomnumber, random, worddtoList, wordCList);
            }

            session.setAttribute("level", level);
            session.setAttribute("examLists", worddtoList);
            session.setAttribute("examType", "words");
            req.getRequestDispatcher("/exam/Exam.jsp").forward(req, resp);
        }

    }

    private void randomQ(int[] randomnumber, Random random, List<Worddto> worddtoList, List<Worddto> wordList) {
        int i;
        for (i = 0; i < 10; ++i) {
            randomnumber[i] = random.nextInt(wordList.size());

            for (int j = 0; j < i; ++j) {
                if (randomnumber[i] == randomnumber[j]) {
                    --i;
                }
            }
        }

        for (i = 0; i < 10; ++i) {
            worddtoList.add((Worddto) wordList.get(randomnumber[i]));
        }

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int[] randomnumber = new int[10];
        Random random = new Random();
        List<Myvocdto> myvocdtoList = new ArrayList();
        Myvocdao myvocdao = new Myvocdao();
        List<Myvocdto> wordList = myvocdao.selectExamList();

        int i;
        for (i = 0; i < 10; ++i) {
            randomnumber[i] = random.nextInt(wordList.size());

            for (int j = 0; j < i; ++j) {
                if (randomnumber[i] == randomnumber[j]) {
                    --i;
                }
            }
        }

        for (i = 0; i < 10; ++i) {
            myvocdtoList.add((Myvocdto) wordList.get(randomnumber[i]));
        }

        session.setAttribute("examLists", myvocdtoList);
        session.setAttribute("examType", "myvoc");
        req.getRequestDispatcher("/exam/Exam.jsp").forward(req, resp);
    }
}
