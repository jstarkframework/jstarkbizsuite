<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header_navigator.jsp" flush="false" />
</head>
<body>
<iframe name="jskid_session_frame" id="jskid_session_frame" class="jskui_frame_none" style="display:none" src="${jcontext}/platform/session.do"></iframe>
<!--iframe name="jskid_notice_frame" id="jskid_notice_frame" class="jskui_frame_none" style="display:none" src=""></iframe-->
<form name="jskid_topchange_form" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="g_no" id="g_no" value="${jskfn:encode(ro, ro.g_no)}" />
</form>
<div id="jskid_submenu" class="jskui_submenu">
<table class="jsknv1"><tr><td class="jsknv2"><table class="jsknv2" id="jskid_submenu_area"><tr><td></td></tr></table></td></tr></table>
</div>
<div id="jskid_topmenu_div" class="jsknv4">
    <div class="jsknv3">
        <table class="jsknv5">
        <tr>
            <td class="jsknv8">Last Login : ${user_last}</td>
            <td class="jsknv9">Client : ${user_client}</td>
        </tr>
        <tr>
            <td class="jsknv16"><div class="jsknv17"><div class="jsknv18"><span class="jsknv19" title="${user_id}">${user_id}</span></div></div></td>
            <td class="jsknv29"><img src="${jcontext}/web/jstark/platform/img/setting.png" onclick="jskfn_top_clear();jskfn_userinfo(); return false;" style="cursor:pointer"></td>
        </tr>
        </table>
    </div>
    <div class="jsknv30">
        <table class="jsknv6">
        <c:if test="${fn:length(toplist)>1}">
        <c:forEach var="list" items="${toplist}">
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);"><td onclick="jskfn_top_change('${jskfn:encode(ro, list.g_no)}');" class="jsknv7" <c:if test="${ro.g_no eq list.g_no}"> bgcolor="#1CAEDA" style="color:#ffffff" </c:if>>${jskfn:lang(ro, list.g_no, list.g_name)}</td></tr>
        </c:forEach>
        </c:if>
        </table>
    </div>
</div>
<table id="jskid_main_layout" class="jsknv10">
    <tr>
    <td class="jsknv11">
        <table class="jsknv12">
        <tr>
        <td class="jsknv13"><img src="${jcontext}/web/jstark/platform/img/jskimg_navi_menu.jpg" border="0" onclick="jskfn_top_menu();" style="cursor:pointer" alt="Menu" /></td>
        <td class="jsknv14"><img src="${jcontext}/web/jstark/platform/img/jskimg_navi_home_jstark.jpg" border="0" onclick="jskfn_home();" style="cursor:pointer" alt="Home" /></td>
        <td class="jsknv15"><img src="${jcontext}/web/jstark/platform/img/logout.png" alt="logout" title="logout" style="cursor:pointer" onclick="jskfn_logoff(); return false;"></td>
        </tr>
        </table>
    </td>
    </tr>
    <tr>
    <td class="jsknv20">
        <table class="jsknv21">
        <tr>
        <td class="jsknv22"><img id="jskid_menu_move_left" src="${jcontext}/web/jstark/platform/img/jskimg_navi_left.gif" border="0" onmousedown="jskfn_move_menu('L');" style="cursor:pointer;display:none" alt="left" /></td>
        <td class="jsknv23">
        <div id="jskid_main_menu" class="jsknv24">
            <table class="jsknv25">
            <tr>
            <c:forEach var="list" items="${mlist}">
            <td onclick="jskfn_show_menu(this,${list.depth1});" class="jskui_header_menu_td"><span style="white-space:nowrap">${list.m_name}</span></td>
            </c:forEach>
            <td style="cursor:default"><span style="white-space:nowrap">&nbsp;</span></td>
            </tr>
            </table>
        </div>
        </td>
        <td class="jsknv26"><img id="jskid_menu_move_right" src="${jcontext}/web/jstark/platform/img/jskimg_navi_right.gif" border="0" onmousedown="jskfn_move_menu('R');" style="cursor:pointer;display:none" alt="right" /></td>
        </tr>
        </table>
    </td>
    </tr>
    <tr><td style="height:1px;" class="jsknv27" id="jskid_main_tabs"></td></tr>
    <tr><td id="jskid_main_frames" class="jsknv28"></td></tr>
</table>
<script type="text/javascript">
${menuscript}
var jsk_home_url = "${home_url}";
var jsk_home_name = "${home_name}";
var jsk_new_tab = ${jsk_new_tab};
var jsk_top_list_size = ${fn:length(toplist)};
</script>
</body>
</html>