<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%

    String content=ro.getString("content","Web Editor Example");

%><!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<style type="text/css">p{margin:0px auto;}img{max-width:100%;}</style>
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

    <button type="button" onclick="fn_modify(); return false;">Modify</button>

    </div>
    <div class="jskui_group">

    <table class="jskui_table">
    <tr>
    <td class="jskui_left" style="padding:10px;word-break:break-all;table-layout:fixed;" valign="top">
<div style="width:100%;overflow:hidden;word-wrap:break-word;word-break:break-all" id="jskid_webedit_area"  name="jskid_webedit_area">
<%=CoreUtils.toScript(CoreUtils.reHtml(content))%>
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

    var jskvar_webedit_img_resize_padding=60;
    //var jskvar_webedit_img_resize_padding=document.documentElement.clientWidth-700;//fixed width
    var jskvar_webedit_img_resize_data_image_only=false;

    window.onload = function()
    {
        try{parent.jskfn_offloading();}catch(e){}

        jskfn_webedit_img_resize();
    };

    window.onresize = function()
    {
        jskfn_webedit_img_resize();
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    function jskfn_webedit_resize(iheight)
    {

    };

    function fn_modify()
    {
        document.jskform_webedit.action = jskfn_open_url("/example/sample/sample_webeditor_modify.do");
        jskfn_document(document.jskform_webedit);
    };

</script>
</body>
</html>