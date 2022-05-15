<%-- 
    Document   : log
    Created on : 05-Apr-2021, 9:19:25 pm
    Author     : rishav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
	<title>Propdeal.Com/login?signup</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- Meta tag Keywords -->

	<!-- css files -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->

	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext"
	 rel="stylesheet">
	<!-- //web-fonts -->
</head>
    
    <body>
    
        <h3>
        <%@ page import="java.sql.* ,java.io.*"%>
        <%@ page import="javax.sql.*"%>
        <%
           String userId= request.getParameter("username") ;
           session.putValue("userId", userId) ;
           String pwd= request.getParameter("password") ;
           
//           try {
                Class.forName("com.mysql.jdbc.Driver");

	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&password=root&useSSL=false");
           
                Statement stmt= conn.createStatement() ;
           ResultSet res= stmt.executeQuery("select * from admin where username='"+userId+"'") ;
           
           if(res.next()) {
                if(res.getString(2).equals(pwd)) {
                    out.println("Welcome "+ userId) ;
                }else {
                    out.println("Invalid Password !!! Try Again...") ;
                }
            }else {
                out.println("Username Doesn't Exists !!! Register first...");
            }

//            }
//            catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//	} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//	}
           
        %>
        </h3>
        <br><br><br><br><br>
        <h2><a href = "index.html">Home</a></h2>
    </body>
</html>
