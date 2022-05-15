<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding = "ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Regjsp</title>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
        String nam = request.getParameter("name"); 
        String mob = request.getParameter("mobile");
        String usr = request.getParameter("username");
        String pwd = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root"); 
        
        PreparedStatement pStm = conn.prepareStatement("insert into admin(username ,password) values(? ,?)");
        pStm.setString(1 ,usr ) ;
        pStm.setString(2 ,pwd ) ;
//        pStmt.setString(3 ,usr ) ;
        int y= pStm.executeUpdate() ;
        
        PreparedStatement pStmt = conn.prepareStatement("insert into client(mobile ,cname ,username ) values(? ,? ,?)");
        pStmt.setString(1 ,mob ) ;
        pStmt.setString(2 ,nam ) ;
        pStmt.setString(3 ,usr ) ;
        int x= pStmt.executeUpdate() ;
        
        
        ResultSet rs;
        
        out.println("<h1><b><i>") ;
        out.println("Registered");
        out.println("</h1></b></i>") ;

        %>
        <h2><a href = "index.html">Home</a></h2>
    </body>
</html>