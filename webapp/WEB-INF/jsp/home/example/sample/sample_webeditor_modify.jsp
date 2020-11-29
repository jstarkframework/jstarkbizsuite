<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%

    String content="";

%><!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform_webedit" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">Web Editor</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">
        <button type="button" onclick="fn_save(); return false;">Save</button>
    </div>
    <div class="jskui_group">
	    <table class="jskui_table">
	    <tr>
	        <th class="jskui_left"><jsp:include page="/WEB-INF/jsp/home/common/webedit/editor_header.jsp" flush="false" /></th>
		</tr>
		<tr>
	        <td>
	            <iframe name="jskid_webedit_frame" id="jskid_webedit_frame" src="<%=jcontext%>/example/sample/sample_webeditor_body.do?param=<%=ro.getString("param")%>" frameborder="0" width="100%" height="260" scrolling="auto" tabindex="2"></iframe>
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
    };

    function fn_save()
    {
        if(!jskfn_webedit_check())
        {
            parent.jskfn_alert("내용을 입력하세요.");
        }
        else
        {
            document.jskform_webedit.action = jskfn_open_url("/example/sample/sample_webeditor_modify_save.do");
            jskfn_document(document.jskform_webedit);
        }
    };

</script>
</body>
</html>