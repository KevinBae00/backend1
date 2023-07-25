//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.member.model;

import com.algoda.util.DBConnPool;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Memberdao extends DBConnPool {
    public Memberdao() {
    }

    public int addMember(Memberdto dto) {
        int insertCount = 0;
        String sql = "insert into member (id, name, pwd, email, tel, hint, hint_asw, scorea, scoreb, scorec, acount, bcount, ccount) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            this.psmt = this.con.prepareStatement(sql);
            this.psmt.setString(1, dto.getId());
            this.psmt.setString(2, dto.getName());
            this.psmt.setString(3, dto.getPwd());
            this.psmt.setString(4, dto.getEmail());
            this.psmt.setString(5, dto.getTel());
            this.psmt.setInt(6, dto.getHint());
            this.psmt.setString(7, dto.getHint_asw());
            this.psmt.setInt(8, dto.getScorea());
            this.psmt.setInt(9, dto.getScoreb());
            this.psmt.setInt(10, dto.getScorec());
            this.psmt.setInt(11, dto.getAcount());
            this.psmt.setInt(12, dto.getBcount());
            this.psmt.setInt(13, dto.getCcount());
            insertCount = this.psmt.executeUpdate();
            this.con.close();
            this.psmt.close();
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return insertCount;
    }

    public List<Memberdto> listMember() {
        List<Memberdto> memberlist = new ArrayList();
        String sql = "select * from member";

        try {
            this.psmt = this.con.prepareStatement(sql);
            this.rs = this.psmt.executeQuery();

            while (this.rs.next()) {
                Memberdto dto = new Memberdto();
                dto.setId(this.rs.getString(1));
                dto.setName(this.rs.getString(2));
                dto.setPwd(this.rs.getString(3));
                dto.setEmail(this.rs.getString(4));
                dto.setTel(this.rs.getString(5));
                dto.setHint(this.rs.getInt(6));
                dto.setHint_asw(this.rs.getString(7));
                dto.setScorea(this.rs.getInt(8));
                dto.setScoreb(this.rs.getInt(9));
                dto.setScorec(this.rs.getInt(10));
                dto.setAcount(this.rs.getInt(11));
                dto.setBcount(this.rs.getInt(12));
                dto.setCcount(this.rs.getInt(13));
                memberlist.add(dto);
            }

            this.con.close();
            this.psmt.close();
            this.rs.close();
        } catch (Exception var4) {
            var4.printStackTrace();
        }

        return memberlist;
    }

    public int updateMember(Memberdto dto) {
        int updateCount = 0;
        String sql = "update member set id =?, name=?, pwd=?, email=?, tel=?, hint=?, hint_asw=? scorea=? scoreb=? score=c, acount=?,bcount=? ccount=? where id = ?";

        try {
            this.psmt = this.con.prepareStatement(sql);
            this.psmt.setString(1, dto.getId());
            this.psmt.setString(2, dto.getName());
            this.psmt.setString(3, dto.getPwd());
            this.psmt.setString(4, dto.getEmail());
            this.psmt.setString(5, dto.getTel());
            this.psmt.setInt(6, dto.getHint());
            this.psmt.setString(7, dto.getHint_asw());
            this.psmt.setInt(8, dto.getScorea());
            this.psmt.setInt(9, dto.getScoreb());
            this.psmt.setInt(10, dto.getScorec());
            this.psmt.setInt(11, dto.getAcount());
            this.psmt.setInt(12, dto.getBcount());
            this.psmt.setInt(13, dto.getCcount());
            updateCount = this.psmt.executeUpdate();
            this.con.close();
            this.psmt.close();
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return updateCount;
    }

    public int deleteMember(Memberdto dto) {
        int deleteCount = 0;
        String sql = "delete from member where id =?";

        try {
            this.psmt = this.con.prepareStatement(sql);
            this.psmt.setString(1, dto.getId());
            deleteCount = this.psmt.executeUpdate();
            this.psmt.close();
            this.con.close();
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return deleteCount;
    }

    public Memberdto selectloginMember(String id, String pwd) {
        Memberdto dto = null;
        String query = "select id, name, pwd, email, tel, hint, hint_asw, scorea, scoreb, scorec, acount, bcount, ccount from member where id = ? and pwd = ?";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, id);
            this.psmt.setString(2, pwd);
            this.rs = this.psmt.executeQuery();
            if (this.rs.next()) {
                dto = new Memberdto();
                dto.setId(this.rs.getString(1));
                dto.setName(this.rs.getString(2));
                dto.setPwd(this.rs.getString(3));
                dto.setEmail(this.rs.getString(4));
                dto.setTel(this.rs.getString(5));
                dto.setHint(this.rs.getInt(6));
                dto.setHint_asw(this.rs.getString(7));
                dto.setScorea(this.rs.getInt(8));
                dto.setScoreb(this.rs.getInt(9));
                dto.setScorec(this.rs.getInt(10));
                dto.setAcount(this.rs.getInt(11));
                dto.setBcount(this.rs.getInt(12));
                dto.setCcount(this.rs.getInt(13));
            }

            this.rs.close();
            this.con.close();
            this.psmt.close();
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return dto;
    }

    public Memberdto searchId(String email, String pwd, int hint, String hint_asw) {
        Memberdto dto = null;
        String query = "SELECT id,name FROM member WHERE email = ? AND pwd = ? AND hint = ? AND hint_asw = ?";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, email);
            this.psmt.setString(2, pwd);
            this.psmt.setInt(3, hint);
            this.psmt.setString(4, hint_asw);
            this.rs = this.psmt.executeQuery();
            if (this.rs.next()) {
                dto = new Memberdto();
                dto.setId(this.rs.getString(1));
                dto.setName(this.rs.getString(2));
            }

            this.rs.close();
            this.psmt.close();
        } catch (Exception var8) {
            var8.printStackTrace();
        }

        return dto;
    }

    public Memberdto searchPwd(String id, String email, int hint, String hint_asw) {
        Memberdto dto = null;
        String query = "SELECT pwd,name FROM member WHERE id = ? and email = ? AND hint = ? AND hint_asw = ?";

        try {
            this.psmt = this.con.prepareStatement(query);
            this.psmt.setString(1, id);
            this.psmt.setString(2, email);
            this.psmt.setInt(3, hint);
            this.psmt.setString(4, hint_asw);
            this.rs = this.psmt.executeQuery();
            if (this.rs.next()) {
                dto = new Memberdto();
                dto.setPwd(this.rs.getString(1));
                dto.setName(this.rs.getString(2));
            }

            this.rs.close();
            this.psmt.close();
        } catch (Exception var8) {
            var8.printStackTrace();
        }

        return dto;
    }

    public int checkId(String id) {
        String sql = "select * from member where id =?";
        int idCheck = 0;

        try {
            this.psmt = this.con.prepareStatement(sql);
            this.psmt.setString(1, id);
            this.rs = this.psmt.executeQuery();
            if (!this.rs.next() && !id.equals("")) {
                idCheck = 1;
            } else {
                idCheck = 0;
            }
        } catch (SQLException var8) {
            var8.printStackTrace();
        } finally {
            this.close();
        }

        return idCheck;
    }

    public int checkword(String word) {
        String sql = "select * from VOCAA where word =?";
        int wordCheck = 0;

        try {
            this.psmt = this.con.prepareStatement(sql);
            this.psmt.setString(1, word);
            this.rs = this.psmt.executeQuery();
            if (!this.rs.next() && !word.equals("")) {
                sql = "select * from VOCAB where word =?";
                this.psmt = this.con.prepareStatement(sql);
                this.psmt.setString(1, word);
                this.rs = this.psmt.executeQuery();
                if (!this.rs.next() && !word.equals("")) {
                    sql = "select * from VOCAC where word =?";
                    this.psmt = this.con.prepareStatement(sql);
                    this.psmt.setString(1, word);
                    this.rs = this.psmt.executeQuery();
                    if (!this.rs.next() && !word.equals("")) {
                        wordCheck = 1;
                    } else {
                        wordCheck = 0;
                    }
                } else {
                    wordCheck = 0;
                }
            } else {
                wordCheck = 0;
            }
        } catch (SQLException var8) {
            var8.printStackTrace();
        } finally {
            this.close();
        }

        return wordCheck;
    }

    public Memberdto getMemberByEmail(String email) throws SQLException {
        Memberdto dto = null;
        String sql = "SELECT * FROM member WHERE email = ?";
        this.psmt = this.con.prepareStatement(sql);
        this.psmt.setString(1, email);
        this.rs = this.psmt.executeQuery();
        if (this.rs.next()) {
            dto = new Memberdto();
            dto.setId(this.rs.getString("id"));
            dto.setName(this.rs.getString("name"));
            dto.setPwd(this.rs.getString("pwd"));
            dto.setEmail(this.rs.getString("email"));
            dto.setTel(this.rs.getString("tel"));
            dto.setHint(this.rs.getInt("hint"));
            dto.setHint_asw(this.rs.getString("hint_asw"));
            dto.setScorea(this.rs.getInt("scorea"));
            dto.setScoreb(this.rs.getInt("scoreb"));
            dto.setScorec(this.rs.getInt("scorec"));
            dto.setAcount(this.rs.getInt("acount"));
            dto.setBcount(this.rs.getInt("bcount"));
            dto.setCcount(this.rs.getInt("ccount"));
            System.out.println("dto" + this.rs.getString("email"));
        }

        return dto;
    }

    public void updateMemberPassword(Memberdto member) throws SQLException {
        try {
            String sql = "UPDATE member SET pwd = ? WHERE email = ?";
            this.psmt = this.con.prepareStatement(sql);
            this.psmt.setString(1, member.getPwd());
            this.psmt.setString(2, member.getEmail());
            this.psmt.executeUpdate();
        } finally {
            this.con.close();
            this.psmt.close();
        }

    }
}
