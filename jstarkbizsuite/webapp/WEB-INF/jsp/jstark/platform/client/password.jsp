<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<link rel="stylesheet" type="text/css" href="${jcontext}/web/jstark/platform/css/jstark.platform.min.css?<%=CoreUtils.getRevision()%>" />
</head>
<body>

<form name="loginform" method="post" action="">
    <input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
    <input type="hidden" name="j_unique" id="j_unique" value="${unique}" />
    <input type="hidden" name="client" id="client" value="${user_client}" />

<div class="jskui_header">
    <div class="jskui_header_title">${jskfn:lang(ro,"JSTARKPLATFORM00105","Password change")}</div>
    <div class="jskui_header_sub">Client : ${user_client}</div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">
        <button name="button" id="button" type="button" onclick="fn_change(); return false;" style="width:70px">${jskfn:lang(ro,"JSTARKPLATFORM00109","Change")}</button>
        <button name="button" id="button" type="button" onclick="fn_home(); return false;" style="width:70px">${jskfn:lang(ro,"JSTARKPLATFORM00110","Cancel")}</button>
    </div>
    <div class="jskui_group">
	    <table class="jskui_table jskui_nostripe_y">
	    <tr>
	        <th width="120" class="jskui_left">${jskfn:lang(ro,"JSTARKPLATFORM00102","User ID")}</th>
	        <td class="jskui_left"><input name="u_id" id="u_id" type="text" value="${user_id}" maxlength="30" style="width:100%" readonly="readonly" /></td>
	    </tr>
	    <tr>
	        <th class="jskui_left">${jskfn:lang(ro,"JSTARKPLATFORM00106","Old Password")}</th>
	        <td class="jskui_left"><input name="u_pw" id="u_pw" type="password" value="" maxlength="30" style="width:100%" autocomplete="off" /></td>
	    </tr>
	    <tr>
	        <th class="jskui_left">${jskfn:lang(ro,"JSTARKPLATFORM00107","New Password")}</th>
	        <td class="jskui_left"><input name="u_pw_n" id="u_pw_n" type="password" value="" maxlength="30" style="width:100%" autocomplete="off" /></td>
	    </tr>
	    <tr>
	        <th class="jskui_left">${jskfn:lang(ro,"JSTARKPLATFORM00108","Confirm Password")}</th>
	        <td class="jskui_left"><input name="u_pw_c" id="u_pw_c" type="password" value="" maxlength="30" style="width:100%" autocomplete="off" /></td>
	    </tr>
	    </table>
    </div>
</div>
</form>

<script type="text/javascript" src="${jcontext}/web/jstark/platform/js/jstark.platform.min.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript">

    window.onload = function()
    {
        jskfn.getId("u_pw").focus();
    };
    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };
    window.onresize = function()
    {

    };
    function fn_change()
    {
        document.loginform.action = jskfn_open_url("/platform/user/user_password_save.do");
        jskfn_submit(document.loginform);
    };
    function fn_home()
    {
        document.location = jskfn_open_url("/platform/index.do");
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>