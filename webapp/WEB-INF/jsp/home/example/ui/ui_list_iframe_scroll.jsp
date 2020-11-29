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
    <div class="jskui_header_title">List Iframe Scroll</div>
    <div class="jskui_header_sub"></div>
</div>

<div class="jskui_group jskui_left_bar_orange">
    <table style="border:0px">
    <tr><td style="width:60px;text-align:right">Link :</td><td style="padding-left:10px"><%=ro.getString("jskroot_url")%></td></tr>  
    <tr><td style="width:60px;text-align:right">Action :</td><td style="padding-left:10px"><%=ro.getString("jskroot_actionclass")%>.<%=ro.getString("jskroot_domethod")%></td></tr>  
    <tr><td style="width:60px;text-align:right">JSP :</td><td style="padding-left:10px"><%=ro.getRequest().getAttribute("jskroot_view_page")%></td></tr>    
    </table>
</div>

<div class="jskui_main">
    <div class="jskui_button_bar">
        <button type="button" onclick="; return false;">Button</button>
    </div>
    <div class="jskui_group">
	    <table class="jskui_search jskui_nostripe_y">
	    <tr>
	    <th width="100">Search 1</th>
	    <td></td>
	    </tr>
	    <tr>
	    <th width="100">Search 2</th>
	    <td></td>
	    </tr>
	    </table>
    </div>
    <div class="jskui_group">
        <iframe name="jskid_content_frame" id="jskid_content_frame" scrolling="no" src="<%=jcontext%>/example/ui/ui_list_iframe_data.do" frameborder="0" width="100%" height="100%" style="padding:0px;margin:0px;"></iframe>
    </div>
</div>

</form>
<script type="text/javascript">

    window.onload = function()
    {
        jskfn_frame_height("jskid_content_frame",0,0,0);
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>