<%@ page language="java"%>
<%@include file="common-database.jsp" %>

<%
    String firstName = request.getParameter("first-name");
    String middleName = request.getParameter("middle-name");
    String lastName = request.getParameter("last-name");
    
    String address = request.getParameter("postal-address");
    String emailID = request.getParameter("email");
    String registerDate = request.getParameter("register-date");
    
    String pincode = request.getParameter("pincode");
    String writeToUs = request.getParameter("write-to-us");
    String registerFlag = request.getParameter("flag");
    
    String city = request.getParameter("city");
    String fullName = firstName +" "+ middleName +" "+ lastName;
    String typeOfPollution = request.getParameter("type_of_pollution");
    try{
        String newId = getNewRegisterComplaintId(out);
        con = fetchConnection();
        stmt = con.createStatement();
        String query = "insert into register_complaint(reg_id, name, address, city, emailid, register_date, pincode, write_to_us, register_flag, type_of_pollution) values('"+newId+"', '"+fullName+"', '"+address+"', '"+city+"', '"+emailID+"', '"+registerDate+"', "+pincode+", '"+writeToUs+"', '"+registerFlag+"', '"+typeOfPollution+"')";
        
        stmt.executeUpdate(query);
        out.println(" <center> <font size=5 color=green> <b>!!!...Details successfully stored...!!!</b> </font> </center>");
        response.sendRedirect("../upload-pollution-photo.html");
    } catch(Exception e){
        out.println(" <center> <font size=5 color=red> <b>!!!...Error occurred...!!!</b> </font> <br><br>" +e+ "</center>");
    } finally {
        closeConnection();
    }
%>

<%!
    public static String getNewRegisterComplaintId(JspWriter out) throws Exception{
        String newRegId = "";
        try{
            con = fetchConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "select reg_id from register_complaint";
            rs = stmt.executeQuery(query);
            if(!rs.next()){
                newRegId = "R1";
            } else {
                rs.last();
                int intRegId = Integer.parseInt(rs.getString("reg_id").split("R")[1]);
                intRegId++;
                newRegId = "R"+intRegId;
            }
        } catch(Exception e){
            out.println(" Get new registration id exception: " +e);
        } finally {
            closeConnection();
        }
        return newRegId;
    }
%>
