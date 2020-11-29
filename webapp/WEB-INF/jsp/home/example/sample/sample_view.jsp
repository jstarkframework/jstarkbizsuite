<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="data" class="org.jstark.framework.core.DData" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="mid" id="mid" value="<%=ro.getEncode("mid")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">View</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

    <button type="button" onclick="fn_modify(); return false;">Modify</button>
    <button type="button" onclick="fn_delete(); return false;">Delete</button>
    <img src="/web/jstark/platform/img/jskimg_bar.gif" alt="bar" />
    <button type="button" onclick="fn_list(); return false;">List</button>

    </div>
    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_y">
    <tr>
    <th width="120" class="jskui_left">Title</th>
    <td class="jskui_left"><%=data.getString("title")%></td>
    </tr>
    <tr>
    <th class="jskui_left">Money</th>
    <td class="jskui_left"><%=CoreUtils.toComma(data.getString("money"))%></td>
    </tr>
    <tr>
    <th class="jskui_left">Open Year</th>
    <td class="jskui_left"><%=data.getString("open_year")%></td>
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

    function fn_list()
    {
        document.location = jskfn_open_url("/example/sample/sample_list.do");
    };

    function fn_modify()
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_modify.do");
        jskfn_document(document.jskform);
    };

    function fn_delete()
    {
        parent.jskfn_confirm("삭제하시겠습니까?", fn_delete_save);
    };

    function fn_delete_save()
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_delete_save.do");
        jskfn_submit(document.jskform);
    };

</script>
</body>
</html>