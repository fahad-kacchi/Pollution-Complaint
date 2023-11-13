<%@ page language="java"%>
<%@include file="common-database.jsp" %>

<%
    try{
        con = fetchConnection();
        stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String query = "select * from register_complaint";
        rs = stmt.executeQuery(query);
        
        if(!rs.next()){
            out.println(" <center> <font size=5 color=red> <b>!!!...There is not data is present in the database...!!!</b> </font> <br><br> </center>");            
        } else {
            int counter = 1;
            rs.previous();
            while(rs.next()){
                String printDetails = "<tr>"+
                                        "<td>"+(counter++)+"</td>"+
                                        "<td>"+rs.getString("name")+"</td>"+
                                        "<td>"+rs.getString("address")+"</td>"+
                                        "<td>"+rs.getString("city")+"</td>"+
                                        "<td>"+rs.getString("emailid")+"</td>"+
                                        "<td>"+rs.getString("register_date")+"</td>"+
                                      "</tr>";
                  out.println(printDetails);
            }
        }
    } catch(Exception e){
        out.println(" <center> <font size=5 color=red> <b>!!!...Error occurred...!!!</b> </font> <br><br>" +e+ "</center>");
    } finally {
        closeConnection();
    }
%>