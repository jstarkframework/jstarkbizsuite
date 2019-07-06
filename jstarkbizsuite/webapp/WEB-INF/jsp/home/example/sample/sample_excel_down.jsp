<%@ page contentType = "application/vnd.ms-excel;charset=utf-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
<%
    String realFileName = "Sample_Excel_"+DateUtils.getTime("yyyyMMdd");

    response.reset();
    response.setHeader("Pragma", "no-cache;");
    response.setHeader("Expires", "-1;");
    response.setHeader("Content-Transfer-Encoding", "binary;");
    response.setHeader("Content-Disposition", "attachment;filename="+new String(realFileName.getBytes(),"ISO-8859-1")+".xls");
    response.setContentType("application/vnd.ms-excel;charset=utf-8");

%><!DOCTYPE html>
<html lang="ko">
<head></head>
<body>
<h1>Movie Score</h1>
<table border="1">
    <tr>
        <td align="center">Open</td>
        <td align="center">Rank</td>
        <td align="center">Title</td>
        <td align="center">Money</td>
    </tr>
    <%
    while(list.next())
    {
    %>
    <tr>
        <td align="center" style="mso-number-format:\@"><%=list.getString("open_year")%></td>
        <td align="center" style="mso-number-format:\@"><%=list.getString("rank")%></td>
        <td align="center" style="mso-number-format:\@"><%=list.getString("title")%></td>
        <td align="center" style="mso-number-format:\@"><%=CoreUtils.toComma(list.getString("money"))%></td>
    </tr>
    <%
    }
    %>
</table>
</body>
</html>