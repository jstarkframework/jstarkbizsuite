<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="j_param" id="j_param" value="set" />
<input type="hidden" name="j_page" id="j_page" value="<%=ro.getPage("j_page")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">Multi Rowspan</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
    <tr>
    <th width="100">Open Year</th>
    <th>Title</th>
    <th width="100">Score</th>
    <th width="50">Rank</th>
    </tr>
    <%
    list.setRow(new String[]{"open_year"});

    while(list.next())
    {
        %>
    <tr>
        <%
        if(list.isRow(0))
        {
        %>
        <td rowspan="<%=list.getRow(0)%>"><%=list.getString("open_year")%></td>
        <%
        }
        %>
        <td style="border-left-width:1px !important;"><%=list.getString("title")%></td>
        <td><%=CoreUtils.toComma(list.getString("money"))%></td>
        <td><%=list.getString("rank")%></td>
    </tr>
        <%
    }
    %>
    </table>

    </div>

</div>

</form>

<div class="jskui_group jskui_left_bar_orange">
    <table style="border:0px">
    <tr><td style="width:60px;text-align:right">Link :</td><td style="padding-left:10px"><%=ro.getString("jskroot_url")%></td></tr>  
    <tr><td style="width:60px;text-align:right">Action :</td><td style="padding-left:10px"><%=ro.getString("jskroot_actionclass")%>.<%=ro.getString("jskroot_domethod")%></td></tr>  
    <tr><td style="width:60px;text-align:right">JSP :</td><td style="padding-left:10px"><%=ro.getRequest().getAttribute("jskroot_view_page")%></td></tr>    
    </table>
</div>
<script type="text/javascript">

    window.onload = function()
    {
    };

</script>
</body>
</html>