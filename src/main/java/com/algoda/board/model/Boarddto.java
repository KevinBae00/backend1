//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.board.model;

import java.sql.Date;

public class Boarddto {
    private String title;
    private String writer;
    private String update_pwd;
    private String content;
    private Date postdate;
    private int visitcount;
    private String ID;

    public Boarddto() {
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return this.writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getUpdate_pwd() {
        return this.update_pwd;
    }

    public void setUpdate_pwd(String update_pwd) {
        this.update_pwd = update_pwd;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPostdate() {
        return this.postdate;
    }

    public void setPostdate(Date postdate) {
        this.postdate = postdate;
    }

    public int getVisitcount() {
        return this.visitcount;
    }

    public void setVisitcount(int visitcount) {
        this.visitcount = visitcount;
    }

    public String getID() {
        return this.ID;
    }

    public void setID(String iD) {
        this.ID = iD;
    }
}
