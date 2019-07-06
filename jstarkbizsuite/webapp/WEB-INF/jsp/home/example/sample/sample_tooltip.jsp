<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body class="body_bgcolor">

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">Tooltip</div>
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

	<div class="jskui_group">
	    <div id="jskid_scroll_td_div" class="jskui_scroll_td_div">
	        <table class="jskui_scroll">
		    <tr>
		        <th width="100">tooltip</th>
		        <th width="200">tooltip</th>
		        <th width="200">tooltip</th>
		        <th width="50">tooltip</th>
		        <th width="80">tooltip</th>
		        <th width="150">tooltip</th>
		    </tr>
		    <%
		    for(int i=0;i<10;i++)
		    {
		    %>
		    <tr>
			    <td>
                    <div class="jskui_tooltip"><div><span onmouseover="jskfn_tooltip_show(this, 500);" onmouseout="jskfn_tooltip_hide();">abcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyz</span></div></div>
			    </td>
			    <td>
				    <div class="jskui_tooltip"><div><span onmouseover="jskfn_tooltip_show(this, 200);" onmouseout="jskfn_tooltip_hide();">1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890</span></div></div>
			    </td>
			    <td>
			        <div class="jskui_tooltip"><div><span onmouseover="jskfn_tooltip_show(this, 500);" onmouseout="jskfn_tooltip_hide();">abcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyz</span></div></div>
			    </td>
			    <td>
			        <div class="jskui_tooltip"><div><span onmouseover="jskfn_tooltip_show(this, 500);" onmouseout="jskfn_tooltip_hide();">abcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyz</span></div></div>
			    </td>
			    <td>
			        <div class="jskui_tooltip"><div><span onmouseover="jskfn_tooltip_show(this, 500);" onmouseout="jskfn_tooltip_hide();">abcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyz</span></div></div>
			    </td>
			    <td>
			        <div class="jskui_tooltip"><div><span onmouseover="jskfn_tooltip_show(this, 500);" onmouseout="jskfn_tooltip_hide();">abcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz<br />abcdefghijklmnopqrstuvwxyz</span></div></div>
			    </td>
		    </tr>
		    <%
		    }
		    %>
		    </table>

		</div>
    </div>

</div>

</form>
<script type="text/javascript">

    window.onload = function()
    {
        try{parent.jskfn_offloading();}catch(e){}
        jskfn_frame_resize("",0);
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    window.onresize = function()
    {
        jskfn_frame_resize("",0);
    };

</script>
</body>
</html>