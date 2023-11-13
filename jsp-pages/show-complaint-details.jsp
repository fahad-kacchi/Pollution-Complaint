<%@ page language="java" import="java.sql.*"%>
<%@include file="common-database.jsp" %>

<%
    String regId = request.getParameter("regId");
    try{
        con = fetchConnection();
        stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String selectQuery = "select * from register_complaint where reg_id = '"+regId+"'";
        rs = stmt.executeQuery(selectQuery);
        if(!rs.next()){
            out.println(" Records not found!");
        } else {
            String name = rs.getString("name");
            String address = rs.getString("address");
            String city= rs.getString("city");
            String emailid = rs.getString("emailid");
            String registerDate = rs.getString("register_date");
            String pincode = rs.getString("pincode");
            String description = rs.getString("write_to_us");
            String typeOfPollution = rs.getString("type_of_pollution");
            String photo = rs.getString("photo");
            
            String data = "";
            data = "<thead>"+
                        "<tr>"+
                            "<th>Name</th>"+
                            "<th>"+name+"</th>"+
                        "</tr>"+
                        "<tr>"+
                            "<th>Address</th>"+
                            "<th>"+address+"</th>"+
                        "</tr>"+
                        "<tr>"+
                            "<th>City</th>"+
                            "<th>"+city+"</th>"+
                        "</tr>"+
                        "<tr>"+
                            "<th>Email-Id</th>"+
                            "<th>"+emailid+"</th>"+
                        "</tr>"+
                        "<tr>"+
                            "<th>Register Date</th>"+
                            "<th>"+registerDate+"</th>"+
                        "</tr>"+
                        "<tr>"+
                            "<th>Pincode</th>"+
                            "<th>"+pincode+"</th>"+
                        "</tr>"+
                        "<tr>"+
                            "<th>Descrption</th>"+
                            "<th>"+description+"</th>"+
                        "</tr>"+
                        "<tr>"+
                            "<th>Type of Pollution</th>"+
                            "<th>"+typeOfPollution+"</th>"+
                        "</tr>"+
                    "</thead>";
            out.println(data + "$" + photo);
        }
    } catch(Exception e){
        out.println(" Print complaint details exception: " +e);
    } finally {
        closeConnection();
    }
%>
