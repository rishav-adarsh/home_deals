<%-- 
    Document   : ind
    Created on : 17-Apr-2021, 8:42:18 pm
    Author     : rishav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.io.*"%>
        <%@ page import="javax.sql.*"%>
        <%
        String city = request.getParameter("city"); 
        String room = request.getParameter("room");
        String type = request.getParameter("type");
//        String pwd = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root"); 
        Statement stmt = conn.createStatement() ;
//        out.println(city+" "+type+" "+room) ;
        out.println("\n");
        ResultSet rs = stmt.executeQuery("select property_id ,room_count ,area ,price ,location ,city ,agent.agent_id ,aname from property ,agent where agent.agent_id=property.agent_id and city='"+
                            city+"' and room_count>="+room+" and status='"+type+"'");
//         ResultSet rs = stmt.executeQuery("select property_id from property where city='"+
//                            city+"' and room_count<="+room+" and status='"+type+"'");
        
    out.println("<h2><b>");
            out.println(" Property_ID |-------| Type |-------| Area(in sq ft) |-------| Price(INR) |-------| Locality |-------| City |-------| Agent ID |-------| Agent Name") ;
            out.println("</h2></b><br>");
            int count= 1 ;
    while(rs.next()) {
//            out.println(rs.getInt(1));
            out.println("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- <br>");
            out.println("<h1>");
            out.println(count+"--> "+rs.getInt(1)+"|-------|"+rs.getInt(2)+"BHK |-------|"+rs.getInt(3)+"sq ft |-------|Rs."+rs.getInt(4)+"|-------|"+rs.getString(5)+"|-------|"+rs.getString(6)+"|-------|"+rs.getInt(7)+"|-------|"+rs.getString(8)) ;
            out.println("</h1><br>");
            count++ ;
        }
        out.println("<br><br><br><br><i><b><h2>"+(count-1)+" Result(s) found !!!</h2></b></i><br><br>");
        
        %>
        <h2><a href = "index.html">Go Back</a></h2><br>
        <h2><a href = "slr.html">Contact Agent</a></h2>
    </body>
</html>
