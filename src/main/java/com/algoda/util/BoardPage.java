//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.util;

public class BoardPage {
    public BoardPage() {
    }

    public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
        String pagingStr = "";
        int totalPages = (int) Math.ceil((double) totalCount / (double) pageSize);
        int pageTemp = (pageNum - 1) / blockPage * blockPage + 1;
        if (pageTemp != 1) {
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=1 ';\"> << </button>";
            pagingStr = pagingStr + "&nbsp;";
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=" + (pageTemp - 1) + " ';\"> < </button>";
        }

        for (int blockCount = 1; blockCount <= blockPage && pageTemp <= totalPages; ++blockCount) {
            if (pageTemp == pageNum) {
                pagingStr = pagingStr + "&nbsp;" + pageTemp + "&nbsp;";
            } else {
                pagingStr = pagingStr + "&nbsp;<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href=' " + reqUrl + "?pageNum=" + pageTemp + " ';\"> " + pageTemp + "</button>&nbsp;";
            }

            ++pageTemp;
        }

        if (pageTemp <= totalPages) {
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=" + totalPages + " ';\"> > </button>";
            pagingStr = pagingStr + "&nbsp;";
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=" + totalPages + " ';\"> >> </a>";
        }

        return pagingStr;
    }

    public static String pagingStr(int totalCount, int pageSize, int blockPage, String wordLevel, String wordDay, int pageNum, String reqUrl) {
        String pagingStr = "";
        int totalPages = (int) Math.ceil((double) totalCount / (double) pageSize);
        int pageTemp = (pageNum - 1) / blockPage * blockPage + 1;
        if (pageTemp != 1) {
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=1&wordLevel=" + wordLevel + "&wordDay=" + wordDay + " ';\"> << </button>";
            pagingStr = pagingStr + "&nbsp;";
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=" + (pageTemp - 1) + "&wordLevel=" + wordLevel + "&wordDay=" + wordDay + " ';\"> < </button>";
        }

        for (int blockCount = 1; blockCount <= blockPage && pageTemp <= totalPages; ++blockCount) {
            if (pageTemp == pageNum) {
                pagingStr = pagingStr + "&nbsp;" + pageTemp + "&nbsp;";
            } else {
                pagingStr = pagingStr + "&nbsp;<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href=' " + reqUrl + "?wordLevel=" + wordLevel + "&wordDay=" + wordDay + "&pageNum=" + pageTemp + " ';\"> " + pageTemp + "</button>&nbsp;";
            }

            ++pageTemp;
        }

        if (pageTemp <= totalPages) {
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=" + totalPages + "&wordLevel=" + wordLevel + "&wordDay=" + wordDay + " ';\"> > </button>";
            pagingStr = pagingStr + "&nbsp;";
            pagingStr = pagingStr + "<button type=\"button\" class=\"btn btn-round btn-default\"onclick=\"location.href=' " + reqUrl + "?pageNum=" + totalPages + "&wordLevel=" + wordLevel + "&wordDay=" + wordDay + " ';\"> >> </a>";
        }

        return pagingStr;
    }
}
