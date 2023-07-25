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

@WebServlet("/exam.do")
public class Examcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Examcontroller() {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //int level = Integer.parseInt(req.getParameter("level"));
//        int day = Integer.parseInt(req.getParameter("day"));
        HttpSession session = req.getSession();
        String examtype = (String) session.getAttribute("examType");

        if (examtype.equals("myvoc")) {
            int randomnumber[] = new int[10];
            Random random = new Random();
            List<Myvocdto> myvocdtoList = new ArrayList<Myvocdto>();
            Myvocdao myvocdao = new Myvocdao();

            List<Myvocdto> wordList = myvocdao.selectExamList();

            for (int i = 0; i < 10; i++) {
                randomnumber[i] = random.nextInt(wordList.size());
                for (int j = 0; j < i; j++) {
                    if (randomnumber[i] == randomnumber[j]) i--;
                }
            }
            for (int i = 0; i < 10; i++) {
                myvocdtoList.add(wordList.get(randomnumber[i]));
            }

            session.setAttribute("examLists", myvocdtoList);


            req.setAttribute("method", "vol");
            req.getRequestDispatcher("/exam/Exam.jsp").forward(req, resp);
        } else {
            int level = (int) session.getAttribute("wordLevelQuiz");
            int day = (int) session.getAttribute("wordDayQuiz");
            int randomnumber[] = new int[10];
            Random random = new Random();
            List<Worddto> worddtoList = new ArrayList<Worddto>();
            Worddto worddto = new Worddto();
            worddto.setDay(day);
            if (level == 1) {
                Wordadao wordadao = new Wordadao();

                List<Worddto> wordAList = wordadao.getWordList(worddto);
                randomQ(randomnumber, random, worddtoList, wordAList);
            } else if (level == 2) {
                Wordbdao wordbdao = new Wordbdao();

                List<Worddto> wordBList = wordbdao.getWordList(worddto);
                randomQ(randomnumber, random, worddtoList, wordBList);
            } else if (level == 3) {
                Wordcdao wordcdao = new Wordcdao();

                List<Worddto> wordCList = wordcdao.getWordList(worddto);
                randomQ(randomnumber, random, worddtoList, wordCList);
            }
            session.setAttribute("level", level);
            session.setAttribute("examLists", worddtoList);

            req.getRequestDispatcher("/exam/Exam.jsp").forward(req, resp);
        }
    }

    private void randomQ(int[] randomnumber, Random random, List<Worddto> worddtoList, List<Worddto> wordList) {
        for (int i = 0; i < 10; i++) {
            randomnumber[i] = random.nextInt(wordList.size());
            for (int j = 0; j < i; j++) {
                if (randomnumber[i] == randomnumber[j]) i--;
            }
        }
        for (int i = 0; i < 10; i++) {
            worddtoList.add(wordList.get(randomnumber[i]));
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int randomnumber[] = new int[10];
        Random random = new Random();
        List<Myvocdto> myvocdtoList = new ArrayList<Myvocdto>();
        Myvocdao myvocdao = new Myvocdao();

        List<Myvocdto> wordList = myvocdao.selectExamList();

        for (int i = 0; i < 10; i++) {
            randomnumber[i] = random.nextInt(wordList.size());
            for (int j = 0; j < i; j++) {
                if (randomnumber[i] == randomnumber[j]) i--;
            }
        }
        for (int i = 0; i < 10; i++) {
            myvocdtoList.add(wordList.get(randomnumber[i]));
        }

        session.setAttribute("examLists", myvocdtoList);

        session.setAttribute("examType", "myvoc");

        req.getRequestDispatcher("/exam/Exam.jsp").forward(req, resp);
    }
}