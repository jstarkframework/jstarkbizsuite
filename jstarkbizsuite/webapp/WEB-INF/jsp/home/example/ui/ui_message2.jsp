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
    <div class="jskui_header_title">Message</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">


<div id="message_bar" class="jskui_message" style="display:none">
  <span class="jskui_message_close" onclick="this.parentElement.style.display='none';">&times;</span> 
  <span id="message_content"></span>
</div>

    <div class="jskui_button_bar">
        <button type="button" onclick="jskfn_message('D', 'WOW'); return false;">Danger</button>
        <button type="button" onclick="jskfn_message('S', 'WOW'); return false;">Success</button>
        <button type="button" onclick="jskfn_message('I', 'WOW'); return false;">Info</button>
        <button type="button" onclick="jskfn_message('W', 'WOW'); return false;">Warning</button>
        <button type="button" onclick="jskfn_message('', 'WOW'); return false;">Normal</button>
    </div>
    
    <div class="jskui_group">

    

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
    
</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>