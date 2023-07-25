//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.algoda.util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class DBConnPool {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    public DBConnPool() {
        try {
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");
            this.con = source.getConnection();
            System.out.println("DB 커넥션 풀 연결 성공");
        } catch (SQLException var4) {
            var4.printStackTrace();
        } catch (NamingException var5) {
            System.out.println("DB 커넥션 풀 연결 실패");
            var5.printStackTrace();
        }

    }

    public void close() {
        try {
            if (this.rs != null) {
                this.rs.close();
            }

            if (this.stmt != null) {
                this.stmt.close();
            }

            if (this.psmt != null) {
                this.psmt.close();
            }

            if (this.con != null) {
                this.con.close();
            }

            System.out.println("자원 해제");
        } catch (SQLException var2) {
            var2.printStackTrace();
        }

    }
}
