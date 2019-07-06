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

<div class="jskui_header">
    <div class="jskui_header_title">Select</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_layout">
<tr>
<td class="jskui_left">

<input type="text" name="title_desc" id="title_desc" value="" readonly="readonly" style="cursor:pointer;width:300px" onclick="jskfn_select_init(this,'title',0,250);" />
<select name="title" id="title" multiple="multiple" style="display:none">
<%
while(list.next())
{
    %>
    <option value="<%=list.getString("title")%>" <%if(list.isFirst()){%> selected="selected" <%}%>><%=list.getString("title")%></option>
    <%
}
%>
</select>

</td>
</tr>

<tr>
<td class="jskui_left">

<input type="text" name="money_desc" id="money_desc" value="" readonly="readonly" style="cursor:pointer;width:300px" onclick="jskfn_select_init(this,'money',200,250);" />
<select name="money" id="money" multiple="multiple" style="display:none">
<%
list.init();
while(list.next())
{
    %>
    <option value="<%=list.getString("money")%>" <%if(list.isFirst()){%> selected="selected" <%}%>><%=list.getString("money")%></option>
    <%
}
%>
</select>

</td>
</tr>

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

        jskvar_select_blank="ALL";
        jskfn_select_set("title");
        jskfn_select_set("money");
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    function jskfn_select()
    {
        if(jskvar_select_name=="title_desc")
        {
            parent.jskfn_alert("TITLE 선택");
        }
        else if(jskvar_select_name=="money_desc")
        {
            parent.jskfn_alert("MONEY 선택");
        }
    };

</script>
</body>
</html>