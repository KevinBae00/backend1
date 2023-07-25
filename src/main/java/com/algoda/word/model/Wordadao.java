//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.word.model;

import com.algoda.util.DBConnPool;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Wordadao extends DBConnPool implements Worddao {
    private final String WORD_INSERT = "insert into  VOCAA(word, MEANINGA, MEANINGB, MEANINGC, SIMILAR_WORDA, SIMILAR_WORDB, SIMILAR_WORDC, day) values (?,?,?,?,?,?,?,?)";
    private final String WORD_UPDATE = "update VOCAA set  MEANINGA=?, MEANINGB=?, MEANINGC=?, SIMILAR_WORDA=?, SIMILAR_WORDB=?, SIMILAR_WORDC=?, day=? where word = ?";
    private final String WORD_DELETE = "delete VOCAA where word=?";
    private final String WORD_GET = "select * from VOCAA where word=?";
    private final String WORD_LIST = "select * from VOCAA where day=?";
    private final String WORDA_LIST_ = "select * from VOCAA";

    public Wordadao() {
    }

    public void insertWordA(Worddto dto) {
        System.out.println("===> JDBC로 insertWord() 기능 처리");

        try {
            this.psmt = this.con.prepareStatement("insert into  VOCAA(word, MEANINGA, MEANINGB, MEANINGC, SIMILAR_WORDA, SIMILAR_WORDB, SIMILAR_WORDC, day) values (?,?,?,?,?,?,?,?)");
            this.psmt.setString(1, dto.getWord());
            this.psmt.setString(2, dto.getMeaninga());
            this.psmt.setString(3, dto.getMeaningb());
            this.psmt.setString(4, dto.getMeaningc());
            this.psmt.setString(5, dto.getSimilar_worda());
            this.psmt.setString(6, dto.getSimilar_wordb());
            this.psmt.setString(7, dto.getSimilar_wordc());
            this.psmt.setInt(8, dto.getDay());
            this.psmt.executeUpdate();
        } catch (SQLException var3) {
            throw new RuntimeException(var3);
        }
    }

    public void updateWordA(Worddto dto) {
        System.out.println("===> JDBC로 updateWord() 기능 처리");

        try {
            this.psmt = this.con.prepareStatement("update VOCAA set  MEANINGA=?, MEANINGB=?, MEANINGC=?, SIMILAR_WORDA=?, SIMILAR_WORDB=?, SIMILAR_WORDC=?, day=? where word = ?");
            this.psmt.setString(1, dto.getMeaninga());
            this.psmt.setString(2, dto.getMeaningb());
            this.psmt.setString(3, dto.getMeaningc());
            this.psmt.setString(4, dto.getSimilar_worda());
            this.psmt.setString(5, dto.getSimilar_wordb());
            this.psmt.setString(6, dto.getSimilar_wordc());
            this.psmt.setInt(7, dto.getDay());
            this.psmt.setString(8, dto.getWord());
            this.psmt.executeUpdate();
        } catch (SQLException var3) {
            throw new RuntimeException(var3);
        }
    }

    public void deleteWordA(Worddto dto) {
        System.out.println("===> JDBC로 deleteWord() 기능 처리");

        try {
            this.psmt = this.con.prepareStatement("delete VOCAA where word=?");
            this.psmt.setString(1, dto.getWord());
            this.psmt.executeUpdate();
        } catch (SQLException var3) {
            throw new RuntimeException(var3);
        }
    }

    public Worddto getWordA(Worddto dto) {
        System.out.println("===> JDBC로 getWord() 기능 처리");
        Worddto worddto = null;

        try {
            this.psmt = this.con.prepareStatement("select * from VOCAA where word=?");
            this.psmt.setString(1, dto.getWord());
            this.rs = this.psmt.executeQuery();
            if (this.rs.next()) {
                worddto = new Worddto();
                worddto.setWord(this.rs.getString("word"));
                worddto.setMeaninga(this.rs.getString("MEANINGA"));
                worddto.setMeaningb(this.rs.getString("MEANINGB"));
                worddto.setMeaningc(this.rs.getString("MEANINGC"));
                worddto.setSimilar_worda(this.rs.getString("SIMILAR_WORDA"));
                worddto.setMeaningb(this.rs.getString("SIMILAR_WORDB"));
                worddto.setMeaningc(this.rs.getString("SIMILAR_WORDC"));
                worddto.setDay(this.rs.getInt("day"));
            }

            return worddto;
        } catch (SQLException var4) {
            throw new RuntimeException(var4);
        }
    }

    public List<Worddto> getWordList(Worddto dto) {
        System.out.println("===> JDBC로 getWordList() 기능 처리");
        List<Worddto> WordList = new ArrayList();

        try {
            this.psmt = this.con.prepareStatement("select * from VOCAA where day=?");
            this.psmt.setInt(1, dto.getDay());
            this.rs = this.psmt.executeQuery();

            while (this.rs.next()) {
                Worddto worddto = new Worddto();
                worddto.setWord(this.rs.getString("word"));
                worddto.setMeaninga(this.rs.getString("MEANINGA"));
                worddto.setMeaningb(this.rs.getString("MEANINGB"));
                worddto.setMeaningc(this.rs.getString("MEANINGC"));
                worddto.setSimilar_worda(this.rs.getString("SIMILAR_WORDA"));
                worddto.setSimilar_wordb(this.rs.getString("SIMILAR_WORDB"));
                worddto.setSimilar_wordc(this.rs.getString("SIMILAR_WORDC"));
                worddto.setDay(this.rs.getInt("day"));
                WordList.add(worddto);
            }

            return WordList;
        } catch (SQLException var4) {
            throw new RuntimeException(var4);
        }
    }

    public List<Worddto> selectListPage(Map<String, Object> map) {
        List<Worddto> board = new ArrayList();
        String query = " SELECT * FROM (     SELECT Tb.*, ROWNUM rNum FROM (         SELECT * FROM vocaa ";
        if (map.get("searchWord") != null) {
            query = query + " WHERE word LIKE '%" + map.get("searchWord") + "%' ";
        }

        if (map.get("searchWord") != null && map.get("wordDay") != null) {
            query = query + "and day =" + map.get("wordDay");
        }

        if (map.get("searchWord") == null && map.get("wordDay") != null) {
            query = query + " WHERE day =" + map.get("wordDay");
        }

        query = query + "        ORDER BY WORD ASC     ) Tb  )  WHERE rNum BETWEEN ? AND ?";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, map.get("start").toString());
            this.psmt.setString(2, map.get("end").toString());
            this.rs = this.psmt.executeQuery();

            while (this.rs.next()) {
                Worddto dto = new Worddto();
                dto.setWord(this.rs.getString(1));
                dto.setMeaninga(this.rs.getString(2));
                dto.setMeaningb(this.rs.getString(3));
                dto.setMeaningc(this.rs.getString(4));
                dto.setSimilar_worda(this.rs.getString(5));
                dto.setSimilar_worda(this.rs.getString(6));
                dto.setSimilar_worda(this.rs.getString(7));
                dto.setDay(this.rs.getInt(8));
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
        String query = "SELECT COUNT(*) FROM vocaa";
        if (map.get("searchWord") != null) {
            query = query + " WHERE word  LIKE '%" + map.get("searchWord") + "%'";
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

    public int insertMyvoc(String insertingword) {
        int working = 0;
        String query1 = "SELECT * FROM vocaa where word = ?";
        String query2 = "insert into sel values (?, ?, ?, ?, ?, ?, ?, ?, 'aaa', 1)";

        try {
            this.stmt = this.con.createStatement();
            this.psmt = this.con.prepareStatement(query1);
            this.psmt.setString(1, insertingword);
            this.rs = this.psmt.executeQuery();
            if (this.rs.next()) {
                String word = this.rs.getString(1);
                String meaninga = this.rs.getString(2);
                String meaningb = this.rs.getString(3);
                String meaningc = this.rs.getString(4);
                String similar_meaninga = this.rs.getString(5);
                String similar_meaningb = this.rs.getString(6);
                String similar_meaningc = this.rs.getString(7);
                int day = this.rs.getInt(8);
                this.psmt = this.con.prepareStatement(query2);
                this.psmt.setString(1, word);
                this.psmt.setString(2, meaninga);
                this.psmt.setString(3, meaningb);
                this.psmt.setString(4, meaningc);
                this.psmt.setString(5, similar_meaninga);
                this.psmt.setString(6, similar_meaningb);
                this.psmt.setString(7, similar_meaningc);
                this.psmt.setInt(8, day);
                working = this.psmt.executeUpdate();
            }
        } catch (SQLException var13) {
            var13.printStackTrace();
        }

        return working;
    }

    public List<Worddto> getWordAList() {
        System.out.println("===> JDBC로 getWordAList() 기능 처리");
        List<Worddto> WordList = new ArrayList();

        try {
            this.psmt = this.con.prepareStatement("select * from VOCAA");
            this.rs = this.psmt.executeQuery();

            while (this.rs.next()) {
                Worddto worddto = new Worddto();
                worddto.setWord(this.rs.getString("word"));
                worddto.setMeaninga(this.rs.getString("MEANINGA"));
                worddto.setMeaningb(this.rs.getString("MEANINGB"));
                worddto.setMeaningc(this.rs.getString("MEANINGC"));
                worddto.setSimilar_worda(this.rs.getString("SIMILAR_WORDA"));
                worddto.setSimilar_wordb(this.rs.getString("SIMILAR_WORDB"));
                worddto.setSimilar_wordc(this.rs.getString("SIMILAR_WORDC"));
                worddto.setDay(this.rs.getInt("day"));
                WordList.add(worddto);
            }

            return WordList;
        } catch (SQLException var3) {
            throw new RuntimeException(var3);
        }
    }
}
