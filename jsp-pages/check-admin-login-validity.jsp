<%@ page language="java" import="java.sql.*,javax.servlet.*,javax.servlet.http.*,java.io.*"%>

<%
    String emailId = request.getParameter("email-id");
    String password = request.getParameter("password");
    
    try{
        if(emailId.equals("admin@123") && password.equals("admin")){
            response.sendRedirect("../admin-dashboard.html");
        } else {
            String ERROR_MSG = "<center>"+
                                    "<font size=5 color=red>"+
                                        "<br><br>Invalid credentials!<br><br>"+
                                        "<a href=\"../admin-dashboard.html\"> Click here to go back... </a>"+
                                    "</font>"+
                               "</center>";
            out.println(ERROR_MSG);
        }
    } catch(Exception e){
        out.println(" Admin Login: " +e);
    }
%>
