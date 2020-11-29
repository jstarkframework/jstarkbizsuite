<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="userdata" class="org.jstark.framework.core.DData" scope="request" />
<jsp:useBean id="userinfo" class="org.jstark.framework.core.DData" scope="request" />
<jsp:useBean id="user" class="org.jstark.framework.core.hs.UserBean" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">User</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_y">
    <tr>
    <th width="100" class="jskui_left">client.</th>
    <td class="jskui_left"><%=user.client%></td>
    </tr>
    <tr>
    <th width="100" class="jskui_left">id</th>
    <td class="jskui_left"><%=user.id%></td>
    </tr>
    <tr>
    <th width="100" class="jskui_left">u_no</th>
    <td class="jskui_left"><%=user.u_no%></td>
    </tr>
    <tr>
    <th width="100" class="jskui_left">name</th>
    <td class="jskui_left"><%=user.name%></td>
    </tr>
    <tr>
    <th width="100" class="jskui_left">timezone</th>
    <td class="jskui_left"><%=user.timezone%></td>
    </tr>
    <tr>
    <th width="100" class="jskui_left">block</th>
    <td class="jskui_left"><%=userdata.getString("block_flag")%></td>
    </tr>
    <tr>
    <th width="100" class="jskui_left">department</th>
    <td class="jskui_left"><%=userinfo.getString("department")%></td>
    </tr>
    <tr>
    <th width="100" class="jskui_left">login</th>
    <td class="jskui_left"><%=user.isLogin%></td>
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

</script>
</body>
</html>