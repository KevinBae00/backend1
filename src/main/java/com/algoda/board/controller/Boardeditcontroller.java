package com.algoda.board.controller;

import com.algoda.board.model.Boarddao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/boardedit.do")
public class Boardeditcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public Boardeditcontroller() {
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		String mode=request.getParameter("mode");
//		System.out.println(mode);
//		
//		if(mode!=null && mode.equals("edit"))
//			doPost(request, response);
//				
//		if(mode!=null && mode.equals("delete"))
//			doPost(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Boarddao dao = new Boarddao();
        int result = 0;
        String mode = request.getParameter("mode");
        System.out.println(mode);


        String title = request.getParameter("title");
        System.out.println(title);
        String writer = request.getParameter("writer");
        System.out.println(writer);
        String update_pwd = request.getParameter("update_pwd");
        System.out.println(update_pwd);
        String context = request.getParameter("content");
        System.out.println(context);

        //edit의 경우 title,writer,update_pwd,context 4개 모두 not null
        if (mode.equals("edit"))
            result = dao.updatePost(title, context, writer, update_pwd);

        //delete의 경우 title만 null
        if (mode.equals("delete")) {
            System.out.println(title);
            result = dao.deletePost(title);
        }


//		System.out.println(mode);
//		Boarddao dao = new Boarddao();
//		int result=0;
//		if(mode.equals("delete")) {
//
//			String title=request.getParameter("title");
//			System.out.println(title);
//			result= dao.deletePost(title);
//			
//			
//		}else if(mode.equals("edit")) {
//			String title=request.getParameter("title");
//			System.out.println(title);
//			String context=request.getParameter("context");
//			String writer=request.getParameter("writer");
//			String update_pwd=request.getParameter("update_pwd");
//			result=dao.updatePost(title,context,writer,update_pwd);
//			System.out.println(result);
//			
//		}


        if (result == 1) response.sendRedirect("./boardlist.do");

    }

}