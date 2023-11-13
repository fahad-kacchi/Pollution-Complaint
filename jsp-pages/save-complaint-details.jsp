<%@ page language="java" import="java.sql.*"%>
<%@include file="common-database.jsp" %>

<%
    String message = request.getParameter("message");
    String regId = request.getParameter("regId");

    try{
        boolean flag = saveComplaintDetails(regId, message, out);
        if(flag){
            out.println(" Reply successful.");
        } else {
            out.println(" There was an error occurred! ");
        }
    } catch(Exception e){
        out.println(" Exception: " +e);
    }
%>

<%!
    public static boolean saveComplaintDetails(String regId, String message, JspWriter out) throws Exception{
        boolean flag = false;
        try{
            String newId = getNewId(out);
            con = fetchConnection();
            stmt = con.createStatement();
            
            String query = "insert into reply values('"+newId+"', '"+message+"', '"+regId+"')";
            stmt.executeUpdate(query);
            flag = true;
        } catch(Exception e){
            out.println(" Save complaint details exception: " +e);
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
            String query = "select reply_id from reply";
            rs = stmt.executeQuery(query);
            if(!rs.next()){
                newId = "RE1";
            } else {
                rs.last();
                int oldId = Integer.parseInt(rs.getString("reply_id").split("RE")[1]);
                oldId++;
                newId = "RE"+oldId;
            }
        } catch(Exception e){
            out.println(" Get new registration id exception: " +e);
        } finally {
            closeConnection();
        }
        return newId;
    }
%>