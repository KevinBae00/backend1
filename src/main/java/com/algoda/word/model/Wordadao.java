package com.algoda.word.model;

import com.algoda.util.DBConnPool;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class Wordadao extends DBConnPool implements Worddao {

    private final String WORD_INSERT = "insert into  VOCAA(" +
            "word, MEANINGA, MEANINGB, MEANINGC, SIMILAR_WORDA, SIMILAR_WORDB, SIMILAR_WORDC, day) " +
            "values (?,?,?,?,?,?,?,?)";
    private final String WORD_UPDATE = "update VOCAA " +
            "set  MEANINGA=?, MEANINGB=?, MEANINGC=?, " +
            "SIMILAR_WORDA=?, SIMILAR_WORDB=?, SIMILAR_WORDC=?, day=? " +
            "where word = ?";
    private final String WORD_DELETE = "delete VOCAA where word=?";
    private final String WORD_GET = "select * from VOCAA where word=?";
    private final String WORD_LIST = "select * from VOCAA where day=?";
    private final String WORDA_LIST_ = "select * from VOCAA";

    public Wordadao() {
        super();
    }

    //      퀴즈(배병주)
    //    글 등록
    public void insertWordA(Worddto dto) {
        System.out.println("===> JDBC로 insertWord() 기능 처리");

        try {
            psmt = con.prepareStatement(WORD_INSERT);
            psmt.setString(1, dto.getWord());
            psmt.setString(2, dto.getMeaninga());
            psmt.setString(3, dto.getMeaningb());
            psmt.setString(4, dto.getMeaningc());
            psmt.setString(5, dto.getSimilar_worda());
            psmt.setString(6, dto.getSimilar_wordb());
            psmt.setString(7, dto.getSimilar_wordc());
            psmt.setInt(8, dto.getDay());
            psmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //    글 수정
    public void updateWordA(Worddto dto) {
        System.out.println("===> JDBC로 updateWord() 기능 처리");

        try {
            psmt = con.prepareStatement(WORD_UPDATE);
            psmt.setString(1, dto.getMeaninga());
            psmt.setString(2, dto.getMeaningb());
            psmt.setString(3, dto.getMeaningc());
            psmt.setString(4, dto.getSimilar_worda());
            psmt.setString(5, dto.getSimilar_wordb());
            psmt.setString(6, dto.getSimilar_wordc());
            psmt.setInt(7, dto.getDay());
            psmt.setString(8, dto.getWord());
            psmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //    글 삭제
    public void deleteWordA(Worddto dto) {
        System.out.println("===> JDBC로 deleteWord() 기능 처리");

        try {
            psmt = con.prepareStatement(WORD_DELETE);
            psmt.setString(1, dto.getWord());
            psmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //    글 상세 조회
    public Worddto getWordA(Worddto dto) {
        System.out.println("===> JDBC로 getWord() 기능 처리");

        Worddto worddto = null;
        try {
            psmt = con.prepareStatement(WORD_GET);
            psmt.setString(1, dto.getWord());
            rs = psmt.executeQuery();

            if (rs.next()) {
                worddto = new Worddto();
                worddto.setWord(rs.getString("word"));
                worddto.setMeaninga(rs.getString("MEANINGA"));
                worddto.setMeaningb(rs.getString("MEANINGB"));
                worddto.setMeaningc(rs.getString("MEANINGC"));
                worddto.setSimilar_worda(rs.getString("SIMILAR_WORDA"));
                worddto.setSimilar_wordb(rs.getString("SIMILAR_WORDB"));
                worddto.setSimilar_wordc(rs.getString("SIMILAR_WORDC"));
                worddto.setDay(rs.getInt("day"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return worddto;
    }

    //    글 목록 조회
    public List<Worddto> getWordList(Worddto dto) {
        System.out.println("===> JDBC로 getWordList() 기능 처리");

        List<Worddto> WordList = new ArrayList<Worddto>();
        try {
            psmt = con.prepareStatement(WORD_LIST);
            psmt.setInt(1, dto.getDay());
            rs = psmt.executeQuery();

            while (rs.next()) {
                Worddto worddto = new Worddto();
                worddto.setWord(rs.getString("word"));
                worddto.setMeaninga(rs.getString("MEANINGA"));
                worddto.setMeaningb(rs.getString("MEANINGB"));
                worddto.setMeaningc(rs.getString("MEANINGC"));
                worddto.setSimilar_worda(rs.getString("SIMILAR_WORDA"));
                worddto.setSimilar_wordb(rs.getString("SIMILAR_WORDB"));
                worddto.setSimilar_wordc(rs.getString("SIMILAR_WORDC"));
                worddto.setDay(rs.getInt("day"));
                WordList.add(worddto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return WordList;
    }


    // 단어 리스트(이승민)

    // 검색 조건에 맞는 게시물 목록을 반환(페이징 기능 지원).
    public List<Worddto> selectListPage(Map<String, Object> map) {
        List<Worddto> board = new ArrayList<Worddto>();
        String query = " "
                + "SELECT * FROM ( "
                + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                + "        SELECT * FROM vocaa ";

        if (map.get("searchWord") != null) {
            query += " WHERE word"
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }

        if (map.get("searchWord") != null && map.get("wordDay") != null) {
            query += "and day =" + map.get("wordDay");


        }
        if (map.get("searchWord") == null && map.get("wordDay") != null) {
            query += " WHERE day =" + map.get("wordDay");
        }
        query += "        ORDER BY WORD ASC "
                + "    ) Tb "
                + " ) "
                + " WHERE rNum BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while (rs.next()) {
                Worddto dto = new Worddto();


                dto.setWord(rs.getString(1));
                dto.setMeaninga(rs.getString(2));
                dto.setMeaningb(rs.getString(3));
                dto.setMeaningc(rs.getString(4));
                dto.setSimilar_worda(rs.getString(5));
                dto.setSimilar_worda(rs.getString(6));
                dto.setSimilar_worda(rs.getString(7));
                dto.setDay(rs.getInt(8));

                board.add(dto);
            }
        } catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {

        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM vocaa";
        if (map.get("searchWord") != null) {
            query += " WHERE word "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;

    }

    //나만의 단어장에 단어를 추가 합니다.
    public int insertMyvoc(String insertingword) {
        int working = 0;
        String query1 = "SELECT * FROM vocaa where word = ?";
        String query2 = "insert into sel values (?, ?, ?, ?, ?, ?, ?, ?, 'aaa', 1)";

        try {
            stmt = con.createStatement();
            psmt = con.prepareStatement(query1);
            psmt.setString(1, insertingword);
            rs = psmt.executeQuery();

            if (rs.next()) {
                //word로 레벨별 단어 테이블에서 값을 찾아
                String word = rs.getString(1);
                String meaninga = rs.getString(2);
                String meaningb = rs.getString(3);
                String meaningc = rs.getString(4);
                String similar_meaninga = rs.getString(5);
                String similar_meaningb = rs.getString(6);
                String similar_meaningc = rs.getString(7);
                int day = rs.getInt(8);


                //레벨별 단어장 테이블에 값을 넣어줌
                psmt = con.prepareStatement(query2);
                psmt.setString(1, word);
                psmt.setString(2, meaninga);
                psmt.setString(3, meaningb);
                psmt.setString(4, meaningc);
                psmt.setString(5, similar_meaninga);
                psmt.setString(6, similar_meaningb);
                psmt.setString(7, similar_meaningc);
                psmt.setInt(8, day);

                working = psmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return working;
    }

    //    관리자 섹션
    public List<Worddto> getWordAList() {
        System.out.println("===> JDBC로 getWordAList() 기능 처리");

        List<Worddto> WordList = new ArrayList<Worddto>();
        try {
            psmt = con.prepareStatement(WORDA_LIST_);
            rs = psmt.executeQuery();

            while (rs.next()) {
                Worddto worddto = new Worddto();
                worddto.setWord(rs.getString("word"));
                worddto.setMeaninga(rs.getString("MEANINGA"));
                worddto.setMeaningb(rs.getString("MEANINGB"));
                worddto.setMeaningc(rs.getString("MEANINGC"));
                worddto.setSimilar_worda(rs.getString("SIMILAR_WORDA"));
                worddto.setSimilar_wordb(rs.getString("SIMILAR_WORDB"));
                worddto.setSimilar_wordc(rs.getString("SIMILAR_WORDC"));
                worddto.setDay(rs.getInt("day"));
                WordList.add(worddto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return WordList;
    }
}