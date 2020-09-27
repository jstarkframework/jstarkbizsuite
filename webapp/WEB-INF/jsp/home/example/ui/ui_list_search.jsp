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
<input type="hidden" name="j_page" id="j_page" value="<%=ro.getPage("j_page")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">List Search</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">
        <button type="button" onclick="; return false;">Button</button>
    </div>
    <div class="jskui_group">
	    <table class="jskui_search jskui_nostripe_y">
	    <tr>
	    <th width="100">Search 1</th>
	    <td><input type="text" name="search1" id="search1" value="" style="width:100%" onkeydown="if(event.keyCode==13)fn_search();" class="jskui_orange_color" /></td>
	    </tr>
	    <tr>
	    <th width="100">Search 2</th>
	    <td><input type="text" name="search2" id="search2" value="" style="width:100%" onkeydown="if(event.keyCode==13)fn_search();" class="jskui_orange_color" /></td>
	    </tr>
	    </table>
    </div>
    <div class="jskui_group">
	    <table class="jskui_table jskui_nostripe_x">
	    <tr>
	    <th width="100">Table</th>
	    <th width="200">Table</th>
	    <th width="100">Table</th>
	    <th></th>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td></td>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td></td>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td></td>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td></td>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td align="center">Content</td>
	    <td></td>
	    </tr>
	    </table>
    </div>
    <div class="jskui_group jskui_center"><%=HtmlUtils.getPageList(list)%></div>
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

    function fn_page(page_no)
    {
        jskfn.getId("j_page").value = page_no;
        document.jskform.action = jskfn_open_url("/example/ui/ui_list_search.do");
        jskfn_document(document.jskform);
    };

    function fn_search()
    {
        jskfn.getId("j_page").value = "1";
        document.jskform.action = jskfn_open_url("/example/ui/ui_list_search.do");
        jskfn_document(document.jskform);
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>