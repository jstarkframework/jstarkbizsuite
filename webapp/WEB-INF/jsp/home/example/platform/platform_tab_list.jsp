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
    <div class="jskui_header_title">Tab Menu</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
    <tr>
    <th width="100">No.</th>
    <th>Table</th>
    <th width="100">Table</th>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_view('No.1');" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>1</td>
    <td>Content</td>
    <td>Content</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_view('No.2');" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>2</td>
    <td>Content</td>
    <td>Content</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_view('No.3');" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>3</td>
    <td>Content</td>
    <td>Content</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_view('No.4');" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>4</td>
    <td>Content</td>
    <td>Content</td>
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

    function fn_view(no)
    {
        parent.jskfn_tab_new(""+no,jskfn_open_url("/example/platform/platform_tab_view.do")+"?no="+no);
    };

</script>
</body>
</html>