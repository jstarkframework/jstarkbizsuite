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
    <div class="jskui_header_title">Alert</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
    <tr>
    <th>Type</th>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert1();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Short Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert2();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Long Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert3();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Short Red Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert4();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Long Red Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert5();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Short Green Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert6();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Long Green Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert7();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Short Orange Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert8();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Long Orange Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert9();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Short Blue Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert10();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Long Blue Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert11();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Gray Message</td>
    </tr>
    <tr onclick="jskfn_tr_click_one(this);fn_alert12();" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td>Long Gray Message</td>
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

    function fn_alert1()
    {
        parent.jskfn_alert('Short Message');
    };

    function fn_alert2()
    {
        parent.jskfn_alert_long("Long Message");
    };

    function fn_alert3()
    {
        parent.jskfn_alert_red("Short Red Message");
    };

    function fn_alert4()
    {
        parent.jskfn_alert_long_red("Long Red Message");
    };

    function fn_alert5()
    {
        parent.jskfn_alert_green("Green Message");
    };

    function fn_alert6()
    {
        parent.jskfn_alert_long_green("Long Green Message");
    };

    function fn_alert7()
    {
        parent.jskfn_alert_orange("Orange Message");
    };

    function fn_alert8()
    {
        parent.jskfn_alert_long_orange("Long Orange Message");
    };

    function fn_alert9()
    {
        parent.jskfn_alert_blue("Blue Message");
    };

    function fn_alert10()
    {
        parent.jskfn_alert_long_blue("Long Blue Message");
    };

    function fn_alert11()
    {
        parent.jskfn_alert_gray("Gray Message");
    };

    function fn_alert12()
    {
        parent.jskfn_alert_long_gray("Long Gray Message");
    };

</script>
</body>
</html>