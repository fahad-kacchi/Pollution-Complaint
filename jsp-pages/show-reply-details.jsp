<%@ page language="java" import="java.util.*"%>
<%@include file="common-database.jsp" %>

<%
    try{
        List<List<String>> replyRecords = getReplyRecords(out);
        if(replyRecords != null){
            Map<String, String> complaintRecord = getComplaintRecord(replyRecords, out);
            String printDetails = "";
            if(complaintRecord != null){
                int index = 0;
                for(Map.Entry<String, String> entry : complaintRecord.entrySet()){
                    String name = entry.getKey();
                    String message = entry.getValue();
                    printDetails += ""
                      + "<tr>"
                           + "<th>"+(index+1)+"</th>"
                           + "<th>"+name+"</th>"
                           + "<th>"+message+"</th>"
                      + "</tr>";
                    ++index;
                }
                out.println(printDetails);
            } else {
                out.println(" Records not found! ");
            }
        }
    } catch(Exception e){
        out.println(" Exception: " +e);
    }
%>

<%!
    public static List<List<String>> getReplyRecords(JspWriter out) throws Exception{
        List<List<String>> replyRecordList = new ArrayList<List<String>>();
        try{
            con = fetchConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "select * from reply";
            rs = stmt.executeQuery(query);
            
            if(!rs.next()){
                out.println(" <center> <font size=5 color=red> <b>!!!...There is no data is present...!!!</b> </font> <br><br> </center>");            
            } else {
                int counter = 1;
                rs.previous();
                while(rs.next()){
                    List<String> replyRecord = new ArrayList<String>();
                    replyRecord.add(rs.getString("reply_message"));
                    replyRecord.add(rs.getString("reg_id"));
                    replyRecordList.add(replyRecord);
                }
            }
        } catch(Exception e){
            out.println(" <center> <font size=5 color=red> <b>!!!...Error occurred...!!!</b> </font> <br><br>" +e+ "</center>");
        } finally {
            closeConnection();
        }
        return replyRecordList;
    }
%>

<%!
    public static Map<String, String> getComplaintRecord(List<List<String>> replyRecords, JspWriter out) throws Exception{
        Map<String, String> complaintRecords = new HashMap<String, String>();
        try{
            con = fetchConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            for(List<String> record : replyRecords){
                String query = "select * from register_complaint where reg_id = '"+record.get(1)+"'";
                rs = stmt.executeQuery(query);
                rs.next();
                String name = rs.getString("name");
                complaintRecords.put(name, record.get(0));
            }
        } catch(Exception e){
            out.println(" Get complaint record exception: " +e);
        } finally {
            closeConnection();
        }
        return complaintRecords;
    }
%>