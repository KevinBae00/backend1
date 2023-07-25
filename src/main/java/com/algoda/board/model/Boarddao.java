//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.board.model;

import com.algoda.util.DBConnPool;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Boarddao extends DBConnPool {
    public Boarddao() {
    }

    public List<Boarddto> selectListPage(Map<String, Object> map) {
        List<Boarddto> board = new ArrayList();
        String query = " SELECT * FROM (     SELECT Tb.*, ROWNUM rNum FROM (         SELECT * FROM board ";
        if (map.get("searchWord") != null) {
            query = query + " where title LIKE '%" + map.get("searchWord") + "%' ";
        }

        query = query + "        ORDER BY title ASC     ) Tb  )  WHERE rNum BETWEEN ? AND ?";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, map.get("start").toString());
            this.psmt.setString(2, map.get("end").toString());
            this.rs = this.psmt.executeQuery();

            while (this.rs.next()) {
                Boarddto dto = new Boarddto();
                dto.setTitle(this.rs.getString(1));
                dto.setWriter(this.rs.getString(2));
                dto.setUpdate_pwd(this.rs.getString(3));
                dto.setContent(this.rs.getString(4));
                dto.setPostdate(this.rs.getDate(5));
                dto.setVisitcount(this.rs.getInt(6));
                dto.setID(this.rs.getString(7));
                board.add(dto);
            }
        } catch (Exception var5) {
            System.out.println("게시물 조회 중 예외 발생");
            var5.printStackTrace();
        }

        return board;
    }

    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM board";
        if (map.get("searchWord") != null) {
            query = query + " WHERE title  LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
            this.stmt = this.con.createStatement();
            this.rs = this.stmt.executeQuery(query);
            this.rs.next();
            totalCount = this.rs.getInt(1);
        } catch (Exception var5) {
            System.out.println("게시물 카운트 중 예외 발생");
            var5.printStackTrace();
        }

        return totalCount;
    }

    public int insertBoard(Boarddto dto) {
        int result = 0;
        String query = "insert into board(  title,writer,update_pwd,content,visitcount,id)  values (  ?,? ,? ,? ,0,?)";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, dto.getTitle());
            this.psmt.setString(2, dto.getWriter());
            this.psmt.setString(3, dto.getUpdate_pwd());
            this.psmt.setString(4, dto.getContent());
            this.psmt.setString(5, dto.getID());
            result = this.psmt.executeUpdate();
        } catch (SQLException var5) {
            var5.printStackTrace();
        }

        return result;
    }

    public Boarddto selectView(String title) {
        Boarddto dto = new Boarddto();
        String query = "SELECT * FROM board WHERE title=?";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, title);
            this.rs = this.psmt.executeQuery();
            if (this.rs.next()) {
                dto.setTitle(this.rs.getString(1));
                dto.setWriter(this.rs.getString(2));
                dto.setUpdate_pwd(this.rs.getString(3));
                dto.setContent(this.rs.getString(4));
                dto.setPostdate(this.rs.getDate(5));
                dto.setVisitcount(this.rs.getInt(6));
                dto.setID(this.rs.getString(7));
            }
        } catch (Exception var5) {
            System.out.println("게시물 상세보기 중 예외 발생");
            var5.printStackTrace();
        }

        return dto;
    }

    public void updateVisitCount(String title) {
        String query = "UPDATE board set visitcount=visitcount+1  where title=?";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, title);
            this.psmt.executeQuery();
        } catch (Exception var4) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            var4.printStackTrace();
        }

    }

    public int deletePost(String title) {
        int result = 0;

        try {
            String query = "DELETE FROM board WHERE title=?";
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, title);
            result = this.psmt.executeUpdate();
        } catch (Exception var4) {
            System.out.println("게시물 삭제 중 예외 발생");
            var4.printStackTrace();
        }

        return result;
    }

    public int updatePost(String title, String context, String writer, String update_pwd) {
        int result = 0;

        try {
            String query = "UPDATE board SET title=?, content=? WHERE writer=? and update_pwd=?";
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, title);
            this.psmt.setString(2, context);
            this.psmt.setString(3, writer);
            this.psmt.setString(4, update_pwd);
            result = this.psmt.executeUpdate();
        } catch (Exception var7) {
            System.out.println("게시물 수정 중 예외 발생");
            var7.printStackTrace();
        }

        return result;
    }
}
