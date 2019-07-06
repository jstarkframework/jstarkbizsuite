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
<input type="hidden" name="j_unique" id="j_unique" value="<%=ro.setUnique()%>" />

<div class="jskui_header">
    <div class="jskui_header_title">Add Bean</div>
    <div class="jskui_header_sub"></div>
</div>

<div class="jskui_main">

    <div class="jskui_button_bar">
    <button type="button" onclick="fn_submit(); return false;">Save</button>
    <button type="button" onclick="fn_list(); return false;">List</button>
    </div>

    <div class="jskui_group">
    <table class="jskui_table jskui_nostripe_y">
    <tr>
    <th width="120" class="jskui_left">Title <div class="jskui_required" title="Required field"></div></th>
    <td class="jskui_left"><input type="text" name="title" id="title" value="" style="width:100%" maxlength="50" /></td>
    </tr>
    <tr>
    <th class="jskui_left">Money <div class="jskui_required" title="Required field"></div></th>
    <td class="jskui_left"><input type="text" name="money" id="money" value="" style="width:100%" maxlength="20" /></td>
    </tr>
    <tr>
    <th class="jskui_left">Open Year <div class="jskui_required" title="Required field"></div></th>
    <td class="jskui_left"><input type="text" name="open_year" id="open_year" value="" style="width:100%" maxlength="4" /></td>
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

    function fn_list()
    {
        document.location = jskfn_open_url("/example/sample/sample_list_bean.do");
    };

    function fn_submit()
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_add_bean_save.do");
        jskfn_submit(document.jskform);
    };

</script>
</body>
</html>