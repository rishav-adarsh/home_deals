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
        String name = request.getParameter("aname"); 
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root"); 
        Statement stmt = conn.createStatement() ;
//        out.println(city+" "+type+" "+room) ;
        out.println("<h3>") ;
        out.println("\n Showing results for agent : "+ name) ;
        out.println("</h3><br>") ;
        ResultSet rs = stmt.executeQuery("select agent.agent_id ,aname ,room_count ,area ,price ,location ,city ,status from property ,agent where agent.agent_id=property.agent_id and aname='"+
                            name+"'");
//         ResultSet rs = stmt.executeQuery("select property_id from property where city='"+
//                            city+"' and room_count<="+room+" and status='"+type+"'");
        
    out.println("<h2><b>");
            out.println(" Agent_ID |-------| Agent Name |-------| Type |-------| Area |-------| Price(INR) |-------| Locality |-------| City |-------| Status") ;
            out.println("</h2></b><br>");
            int count= 1 ;
            int sold= 0 ;
            int unsold= 0 ;
       
    while(rs.next()) {
//            out.println(rs.getInt(1));
            out.println("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- <br>");
            out.println("<h1>");
            out.println(count+"--> "+rs.getInt(1)+"|-------|"+rs.getString(2)+" |-------|"+rs.getInt(3)+"BHK |-------| "+rs.getInt(4)+"sq ft |-------| Rs."+rs.getInt(5)+"|-------|"+rs.getString(6)+"|-------|"+rs.getString(7)+"|-------|"+rs.getString(8)) ;
            out.println("</h1><br>");
            if(rs.getString(8).equals("Unsold")) {
                unsold++ ;
            }else {
                sold++ ;
            }
            count++ ;
        }
        out.println("<br><br><br><br><i><b><h2>"+(count-1)+" Result(s) found !!!</h2></b></i><br><br>");
        

        out.println("<br><b><h1> Statistics : <br><br></h1><h2>") ;
        out.println("No. properties sold under "+name+" : "+sold+"<br>") ;
        out.println("No. properties unsold under "+name+" : "+unsold+"<br><></h2></b>") ;
        %>
        <h2><a href = "index.html">HOME</a></h2><br>
        <h2><a href = "slr.html">Go Back</a></h2>
    </body>
</html>
