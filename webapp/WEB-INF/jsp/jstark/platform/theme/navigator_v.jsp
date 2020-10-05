<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header_navigator_v.jsp" flush="false" />
</head>
<body>
<iframe name="jskid_session_frame" id="jskid_session_frame" class="jskui_frame_none" style="display:none" src="${jcontext}/platform/session.do"></iframe>
<!--iframe name="jskid_notice_frame" id="jskid_notice_frame" class="jskui_frame_none" style="display:none" src=""></iframe-->
<form name="jskid_topchange_form" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="g_no" id="g_no" value="${jskfn:encode(ro, ro.g_no)}" />
</form>
<div id="jskid_submenu_back" class="jskui_submenu_back"></div>
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
            <td class="jsknv29">
            <img src="${jcontext}/web/jstark/platform/img/logout_v.png" alt="logout" title="logout" style="cursor:pointer" onclick="jskfn_logoff(); return false;">
            <img src="${jcontext}/web/jstark/platform/img/setting.png" onclick="jskfn_top_clear();jskfn_userinfo(); return false;" style="cursor:pointer">
            </td>
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
    <td colspan="2" class="jsknv11">
    
        <table  style="width:100%;border:0px;border-spacing: 0px;background:#F5F5F5">
        <tr><td style="height:1px;" class="jsknv27" style="padding:0px"></td></tr>
        </table>
        
        <table class="jsknv12">
        <tr>
        <td class="jsknv13"><img src="${jcontext}/web/jstark/platform/img/menu.png" border="0" onclick="jskfn_top_menu();" style="width:30px;cursor:pointer;" alt="Menu" /></td>
        <td class="jsknv14"><img src="${jcontext}/web/jstark/platform/img/JSTARK_B.png" height="30" border="0" onclick="jskfn_home();" style="cursor:pointer" alt="Home" style="vertical-align:middle" /></td>
        <td id="jskid_navi_center"></td>
        <td class="jsknv15"><img src="${jcontext}/web/jstark/platform/img/logout.png" alt="logout" title="logout" style="cursor:pointer" onclick="jskfn_logoff(); return false;"></td>
        </tr>
        </table>
                
        <table  style="width:100%;border:0px;border-spacing: 0px;background:#EDEBE9">
        <tr><td style="height:1px;" class="jsknv27" style="padding:0px"></td></tr>
        </table>

    </td>
    </tr>
    <tr> 
    <td class="jsknv112" id="jskid_submenu_width">
        <table class="jsknv21">        
        <tr>
        <td class="jsknv23">
        <div id="jskid_main_menu" class="jsknv24">
            <table class="jsknv252">
            <tr>
            <td onclick="jskfn_submenu();return false;" id="jskid_submenu_height" class="jskui_header_menu_td2">
            <img src="${jcontext}/web/jstark/platform/img/menu2.png" border="0" style="width:25px;cursor:pointer;-webkit-filter: opacity(.6) drop-shadow(0 0 0 #ffffff); filter: opacity(.5) drop-shadow(0 0 0 #ffffff);" alt="Sub Menu" />
            </td>
            </tr>
            </table>

            <table class="jsknv252" id="jskid_submenu_table" style="width:220px">
            <c:forEach var="list" items="${mlist}">
            <tr>
            <td onclick="jskfn_show_menu(this,${list.depth1});" class="jskui_header_menu_td" style="width:220px;height:30px;">${list.m_name}</td>
            </tr>
            </c:forEach>
            <tr>
            <td style="cursor:default"><span style="white-space:nowrap">&nbsp;</span></td>
            </tr>
            </table>

        </div>
        </td>
        </tr>
        </table>
    </td>
    <td style="padding:0px;vertical-align:top">
        <table width="100%" style="border:0px;border-spacing: 0px;">
        <tr><td style="height:1px;" class="jsknv27" id="jskid_main_tabs" style="padding:0px"></td></tr>
        <tr><td id="jskid_main_frames" class="jsknv28" style="padding:0px"></td></tr>
        </table>
    </td>
    </tr>
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