<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%
   Connection conn=null;
   Statement stmt=null;
   ResultSet rs=null;
  

   try{
	   String url = "jdbc:oracle:thin:@ptax15g6ez0tr2te_low?TNS_ADMIN=C://LSM//wallet//Wallet_PTAX15G6EZ0TR2TE" ;
	   
	   
	   String user="ADMIN";
      String password="JaewonChung73";
      
      Class.forName("oracle.jdbc.OracleDriver");
      
      conn = DriverManager.getConnection(url,user,password);
      out.println("연결 성공");
      
      // Exequery 파일에서 복붙여서 두 줄 정도 수정
      String sql2 = "insert into member (id,name,pwd,email,tel,hint,hint_asw) values('REAR2','1234','이승민','a','a',1,'a')";   
      /* String sql = "select * from member";*/
      stmt = conn.createStatement();
      stmt.executeUpdate(sql2); 
   
      
         
      
      
      /* while(rs.next()){
         String id = rs.getString("id");
         String pass = rs.getString("pass");
         String name = rs.getString("name");
         Date regidate = rs.getDate("regidate"); //날짜는 스트링 타입으로 받아도 상관없다.getString()
      
         out.println(String.format("%s %s %s",id, pass, name, regidate) + "<br/>");
      } */
      
//      rs.close();
//      conn.close(); 
//      stmt.close();
//      psmt.close();
      
      
      } catch (SQLException e) {
         out.println("연결 실패");
         out.print("SQLException : " + e.getMessage());
      } finally{
         try{
               if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            
            if(conn != null) conn.close();   
         }catch(Exception e){
            e.printStackTrace();
         }
         
      }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




</body>
</html>