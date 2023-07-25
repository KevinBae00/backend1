//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.word.model;

public class Worddto {
    String word;
    String meaninga;
    String meaningb;
    String meaningc;
    String similar_worda;
    String similar_wordb;
    String similar_wordc;
    int day;

    public Worddto() {
    }

    public String getWord() {
        return this.word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getMeaninga() {
        return this.meaninga;
    }

    public void setMeaninga(String meaninga) {
        this.meaninga = meaninga;
    }

    public String getMeaningb() {
        return this.meaningb;
    }

    public void setMeaningb(String meaningb) {
        this.meaningb = meaningb;
    }

    public String getMeaningc() {
        return this.meaningc;
    }

    public void setMeaningc(String meaningc) {
        this.meaningc = meaningc;
    }

    public String getSimilar_worda() {
        return this.similar_worda;
    }

    public void setSimilar_worda(String similar_worda) {
        this.similar_worda = similar_worda;
    }

    public String getSimilar_wordb() {
        return this.similar_wordb;
    }

    public void setSimilar_wordb(String similar_wordb) {
        this.similar_wordb = similar_wordb;
    }

    public String getSimilar_wordc() {
        return this.similar_wordc;
    }

    public void setSimilar_wordc(String similar_wordc) {
        this.similar_wordc = similar_wordc;
    }

    public int getDay() {
        return this.day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "Worddto{" +
                "word='" + word + '\'' +
                ", meaninga='" + meaninga + '\'' +
                ", meaningb='" + meaningb + '\'' +
                ", meaningc='" + meaningc + '\'' +
                ", similar_worda='" + similar_worda + '\'' +
                ", similar_wordb='" + similar_wordb + '\'' +
                ", similar_wordc='" + similar_wordc + '\'' +
                ", day=" + day +
                '}';
    }
}
