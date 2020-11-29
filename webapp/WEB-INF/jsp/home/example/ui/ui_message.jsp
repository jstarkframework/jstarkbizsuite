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
    <div class="jskui_header_title">List Message</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_button_bar">
    <button type="button" onclick="fn_submit(); return false;">Save</button>
    <button type="button" onclick="fn_list(); return false;">List</button>
    </div>
    
    <div style="display:none" id="id_message"></div>
    
    <div class="jskui_group">
    <br />
    <br />
    <br />
    <br />
    <br />
    </div>
    
    <div class="jskui_group jskui_left_bar_orange">
       It has been saved.
    </div>
    <div class="jskui_group jskui_left_bar_red">
       It has been saved.
    </div>
    <div class="jskui_alert_success">
       It has been saved.
    </div>
    <div class="jskui_alert_info">
       It has been saved.
    </div>
    <div class="jskui_alert_warning">
       It has been saved.
    </div>
    <div class="jskui_alert_danger">
       It has been saved.
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

    function fn_submit()
    {
        fn_message_danger("값을 입력하세요.");
    };
    
    function fn_list()
    {
        fn_message_success("정상적으로 처리가 완료되었습니다.");
    }
    
    function fn_message_danger(msg)
    {
        jskfn.getId("id_message").className="jskui_alert_danger";
        jskfn.getId("id_message").innerHTML=msg;
        jskfn.getId("id_message").style.display="block";
    };
    
    function fn_message_success(msg)
    {
        jskfn.getId("id_message").className="jskui_alert_success";
        jskfn.getId("id_message").innerHTML=msg;
        jskfn.getId("id_message").style.display="block";
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>