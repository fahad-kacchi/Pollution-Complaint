<%@ page language="java" import="java.sql.*"%>
<%@include file="common-database.jsp" %>

<%
    String policeStationName = request.getParameter("police_station_name");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    String contactNo = request.getParameter("contact_no");
    
    try{
        boolean flag = storePoliceStationRecord(policeStationName, address, city, pincode, contactNo, out);
        if(flag){
            out.println("<center> Details sucessfully stored! <br> <br> <a href=\"../admin-add-police-station.html\">Click here to go back!</a> </center>");
        } else {
            out.println("0");
        }
    } catch(Exception e){
        out.println(" Store exception: " +e);
    }
%>

<%!
    public static boolean storePoliceStationRecord(String policeStationName, String address, String city, String pincode, String contactNo, JspWriter out) throws Exception{
        boolean flag = false;
        try{
            String newId = getNewId(out);
            con = fetchConnection();
            stmt = con.createStatement();
            String query = "insert into police_station_record values('"+newId+"','"+policeStationName+"','"+address+"','"+city+"','"+pincode+"', '"+contactNo+"')";
            stmt.executeUpdate(query);
            flag = true;
        } catch(Exception e){
            out.println(" Store police station record exception: " +e);
        } finally {
            closeConnection();
        }
        return flag;
    }
%>


<%!
    public static String getNewId(JspWriter out) throws Exception{
        String newId = "";
        try{
            con = fetchConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "select ps_id from police_station_record";
            rs = stmt.executeQuery(query);
            if(!rs.next()){
                newId = "PS1";
            } else {
                rs.last();
                int intRegId = Integer.parseInt(rs.getString("ps_id").split("PS")[1]);
                intRegId++;
                newId = "PS"+intRegId;
            }
        } catch(Exception e){
            out.println(" Get new registration id exception: " +e);
        } finally {
            closeConnection();
        }
        return newId;
    }
%>