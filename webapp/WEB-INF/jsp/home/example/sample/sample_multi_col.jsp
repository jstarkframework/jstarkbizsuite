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
    <div class="jskui_header_title">Multi Colspan</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
        <tr>
            <th>Title</th>
            <th>Title</th>
            <th>Title</th>
        </tr>
    <%
    list.setCol(3);

    while(list.next())
    {
        if(list.isColFirst())
        {
        %>
        <tr>
        <%
        }
        %>
            <td><%=list.getString("title","&nbsp;")%></td>
        <%

        if(list.isColLast())
        {
        %>
        </tr>
        <%
        }
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
        try{parent.jskfn_offloading();}catch(e){}
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

</script>
</body>
</html>