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
    <div class="jskui_header_title">Win Popup</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_button_bar">
        <button type="button" onclick="fn_button1(); return false;">Popup</button>
        <button type="button" onclick="fn_button2(); return false;">Popup Middle</button>
        <button type="button" onclick="fn_button3(); return false;">Popup Fullscreen</button>
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

    function fn_button1()
    {
        //jskfn_popup(name, url, left, top, width, height, scrollbar, resizable)
        jskfn_popup("pop1", "/example/index.do", 10, 10, 500, 500, true, true);
    };
    
    function fn_button2()
    {
        //jskfn_popup_middle(name, url, width, height, scrollbar, resizable)
        jskfn_popup_middle("pop2", "/example/index.do", 500, 500, true, true);
    };
    
    function fn_button3()
    {
        //jskfn_popup_full(name, url, scrollbar, resizable)
        jskfn_popup_full("pop3", "/example/index.do", true, true);
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>