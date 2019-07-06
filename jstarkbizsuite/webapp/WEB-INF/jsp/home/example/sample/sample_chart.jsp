<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">Chart</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_layout">
<tr>
<th colspan="3">

</th>
</tr>
<tr>
<td style="width:40%">

    <iframe name="chart_frame1" id="chart_frame1" scrolling="auto" src="<%=jcontext%>/example/sample/sample_chart_left.do" frameborder="0" width="100%" height="340" style="padding:0px;margin:0px;"></iframe>

</td>
<td style="width:46%">

    <iframe name="chart_frame2" id="chart_frame2" scrolling="auto" src="<%=jcontext%>/example/sample/sample_chart_right.do" frameborder="0" width="100%" height="340" style="padding:0px;margin:0px;"></iframe>

</td>
<td style="width:14%">
    <div id="jskid_chart_label" style="overflow-y:auto;width:100%;height:340px">
    </div>
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
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

</script>
</body>
</html>