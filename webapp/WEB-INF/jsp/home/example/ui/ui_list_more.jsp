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
    <div class="jskui_header_title">List More</div>
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
	    <td></td>
	    </tr>
	    <tr>
	    <th width="100">Search 2</th>
	    <td></td>
	    </tr>
	    </table>
    </div>
    <div class="jskui_group">
    <table width="100%"><tr><td height="12"><div class="jskui_hr"></div></td><td style="width:80px" align="center"><b><a onclick="fn_more(); return false;">MORE</a></b></td></tr></table>
	    <table class="jskui_search jskui_nostripe_y" id="jskid_more" style="display:none">
	    <tr>
	    <th width="100">Search 3</th>
	    <td></td>
	    </tr>
	    <tr>
	    <th width="100">Search 4</th>
	    <td></td>
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

    var isMore=false;
    function fn_more()
    {
        if(isMore)
        {
            jskfn.getId("jskid_more").style.display="none";
            isMore=false;
        }
        else
        {
            jskfn.getId("jskid_more").style.display="";
            isMore=true;
        }
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>