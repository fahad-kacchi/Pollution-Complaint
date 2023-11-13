<%@ page language="java" import="java.sql.*, java.io.*, java.util.*, java.time.*, com.oreilly.servlet.MultipartRequest"%>
<%@include file="common-database.jsp" %>

<%
    String fileName = request.getParameter("fileName");
    try{
        String path = System.getProperty("user.dir");
        String uploadFolderPath = path + File.separator +".."+File.separator+ "webapps" + File.separator + "Pollution-Complaint" + File.separator + "uploaded-docs" + File.separator;
        MultipartRequest m = new MultipartRequest(request, uploadFolderPath);
        String regId = getCurrentRegId(out);
        changeFileName(fileName,  uploadFolderPath, regId, out);
        out.print("Photo uploaded successfully.");  
    } catch(Exception e){
        out.println(" Exception: " +e);
    }
%>

<%!
    public static void changeFileName(String fileName, String path, String regId, JspWriter out) throws Exception{
        try{
            StringTokenizer splitString = new StringTokenizer(fileName, ".");
            splitString.nextToken(); // Its filename not an extension thats why we traverse it.
            String extension = splitString.nextToken();
            String newFileName = regId + "-PHOTO." + extension;
            File originalFile = new File(path + fileName);
            File renameFile = new File(path + newFileName);
            originalFile.renameTo(renameFile);
            String photoPath = path + newFileName;
            updatePollutionComplaint(regId, photoPath, out);
        } catch(Exception e){
            out.println(" Change file name exception: " +e);
        }
    }
%>

<%!
    public static String getCurrentRegId(JspWriter out) throws Exception{
        String regId = "";
        try{
            con = fetchConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "select reg_id from register_complaint";
            rs = stmt.executeQuery(query);
            if(!rs.next()){
                regId = "";
            } else {
                rs.last();
                regId = rs.getString("reg_id");
            }
        }catch(Exception e){
            out.println(" Get current reg id exception: " +e);
        } finally {
            closeConnection();
        }
        return regId;
    }
%>

<%!
    public static void updatePollutionComplaint(String regId, String photoPath, JspWriter out) throws Exception{
        try{
            con = fetchConnection();
            stmt = con.createStatement();
            String updateQuery = "update register_complaint set photo = '"+photoPath+"' where reg_id = '"+regId+"'";
            stmt.executeUpdate(updateQuery);
        } catch(Exception e){
            out.println(" Update pollution table exception: " +e);
        } finally {
            closeConnection();
        }
    }
%>
