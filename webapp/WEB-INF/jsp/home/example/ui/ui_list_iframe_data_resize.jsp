<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body class="jskui_body_white">

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div id="jskid_scroll_th_div" class="jskui_scroll_th_div">
<div class="jskui_resizable_table">
    <table id="jskid_scroll_th" class="jskui_scroll noselect">
    <tr>
    <th width="100">Label</th>
    <th width="300">Label</th>
    <th width="300">Label</th>
    <th width="300">Label</th>
    <th width="300">Label</th>
    <th width="300">Label</th>
    <th width="300">Label</th>
    <th width="300">Label</th>
    <th width="300">Label</th>
    <th width="100">Label</th>
    </tr>
    </table>
</div>
</div>
<div id="jskid_scroll_td_div" class="jskui_scroll_td_div">
    <table id="jskid_scroll_td" class="jskui_scroll">
    <%
    for(int i=0;i<20;i++)
    {
    %>
    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
    <td class="jskui_left">AAA</td>
    <td class="jskui_left">BBB</td>
    <td class="jskui_left">CCC</td>
    <td class="jskui_left">DDD</td>
    <td class="jskui_left">EEE</td>
    <td class="jskui_left">FFF</td>
    <td class="jskui_left">GGG</td>
    <td class="jskui_left">HHH</td>
    <td class="jskui_left">III</td>
    <td class="jskui_left">JJJ</td>
    </tr>
    <%
    }
    %>
    </table>
</div>

</form>
<script type="text/javascript">

    window.onload = function()
    {
        jskfn_resizable_table("jskid_scroll_th");
        jskfn_frame_resize("jskid_content_frame",0);
        
        jskfn_scroll_resize();
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>