<%@ page language="java" import="java.sql.*"%>
<%@include file="common-database.jsp" %>

<%
    try{
        con = fetchConnection();
        stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String selectQuery = "select * from register_complaint";
        rs = stmt.executeQuery(selectQuery);
        if(!rs.next()){
            out.println(" Records not found!");
        } else {
            rs.beforeFirst();
            String data = "";
            data = "<tr>"+
                        "<th> Name </th>"+
                        "<th> City </th>"+
                        "<th> Pincode </th>"+
                        "<th> Type of Complaint </th>"+
                        "<th> Action </th>"+
                    "</tr>";
            while(rs.next()){
                String regId = rs.getString("reg_id");
                String showLink = "show-complaint-details.html?regId="+regId;
                String replyLink = "reply-to-complaint.html?regId="+regId;
                
                data += "<tr>"+
                            "<td valign=\"middle\">"+rs.getString("name")+"</td>"+
                            "<td valign=\"middle\">"+rs.getString("city")+"</td>"+
                            "<td valign=\"middle\">"+rs.getString("pincode")+"</td>"+
                            "<td valign=\"middle\">"+rs.getString("type_of_pollution")+"</td>"+
                            "<td><a type=\"button\" href="+showLink+" class=\"btn btn-primary\">Show</a> &nbsp;&nbsp;&nbsp;&nbsp;"+
                            "<a type=\"button\" href="+replyLink+" class=\"btn btn-primary\">Reply</a></td>"+
                        "</tr>";
            }
            out.println(data);
        }
    } catch(Exception e){
        out.println(" Print complaint details exception: " +e);
    } finally {
        closeConnection();
    }
%>
