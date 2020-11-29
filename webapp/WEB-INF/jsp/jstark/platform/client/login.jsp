<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<link rel="stylesheet" type="text/css" href="${jcontext}/web/jstark/platform/css/jstark.platform.min.css?<%=CoreUtils.getRevision()%>" />
<link rel="stylesheet" type="text/css" href="${jcontext}/web/jstark/platform/css/jstark.login.min.css?<%=CoreUtils.getRevision()%>" />
<meta name="viewport" content="user-scalable=no, initial-scale=0.58, maximum-scale=0.58, minimum-scale=0.58, width=device-width" />
<style type="text/css">
@media only screen and (min-device-width:768px) and (max-device-width:1024px)
{
    html {zoom:1.5;}
}
.lgi1
{
    float:left;width:370px;
}
.lgi2
{
    float:left;padding-top:20px;width:240px;
}
</style>
</head>
<body style="overflow:hidden">

<div class="wrap">
	<div class="header">
	   &nbsp;&nbsp;<a onclick="fn_home(); return false;"><font color="#7E7E7E">JSTARK : Business Suite</font></a>
	</div>
</div>

<div class="footer">
    <font color="#7E7E7E">Since 2006, Copyright the JSTARK Foundation.<br />JSTARK is a trademark of the JSTARK Foundation.</font>
</div>

<form name="loginform" method="post" action="">
<div class="container">
     <table style="width:100%;border:0px">
     <tr>
	     <td align="center">

			     <input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
			     <div class="lgi1">
                     <table>
                     <tr>
                         <td style="width:100%;border:0px;height:130px;text-align:center"><a onclick="fn_home(); return false;"><img src="${jcontext}/web/jstark/platform/img/jskimg_login.jpg" /></a></td>
                     </tr>
                     </table>
			     </div>
			     <div class="lgi2">
				     <table style="width:100%;border:0px">
                     <tr>
                         <td align="left" width="80"><b>${jskfn:lang(ro,"JSTARKPLATFORM00101","Client")}</b></td>
                         <td width="160" style="padding:1px" align="left"><input name="client" id="client" type="text" value="${client}" style="width:50px" /></td>
                     </tr>
                     <tr>
                         <td align="left"><b>${jskfn:lang(ro,"JSTARKPLATFORM00102","User ID")}</b></td>
                         <td style="padding:1px" align="left"><input name="u_id" id="u_id" type="text" value="${userid}" maxlength="30" style="width:80px;ime-mode: disabled;" tabindex="1" title="Id" onkeydown="if(event.keyCode==13)fn_password();" autocomplete="off" />
                         <input type="checkbox" name="save_id" id="save_id" value="SAVE" class="jskui_style_checkbox" <c:if test="${not empty userid}"> checked="checked" </c:if> />
                         <label for="save_id" class="jskui_style_checkbox_label">SAVE</label>
                         </td>
                     </tr>
                     <tr>
                         <td align="left"><b>${jskfn:lang(ro,"JSTARKPLATFORM00103","Password")}</b></td>
                         <td style="padding:1px" align="left"><input name="u_pw" id="u_pw" type="password" value="" maxlength="30" style="width:150px" tabindex="2" onkeydown="if(event.keyCode==13)fn_login();" title="Passowrd" autocomplete="off" /></td>
                     </tr>
                     <tr>
                         <td height="34"></td>
                         <td style="padding:1px" align="left"><button name="button" type="button" onclick="fn_login(); return false;" style="width:150px;" class="jskui_nomargin" tabindex="3">${jskfn:lang(ro,"JSTARKPLATFORM00087","Login")}</button></td>
                     </tr>
                     </table>
			     </div>
	     </td>
     </tr>
     </table>
</div>
</form>
<script type="text/javascript" src="${jcontext}/web/jstark/platform/js/jstark.platform.min.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript">

    window.onload = function()
    {
        fn_screen();
        <c:if test="${empty userid}">
        jskfn.getId("u_id").focus();
        </c:if>
        <c:if test="${not empty userid}">
        jskfn.getId("u_pw").focus();
        </c:if>
    };
    window.onresize = function()
    {
        //fn_screen();
    };
    function fn_password()
    {
        jskfn.getId("u_pw").focus();
    };
    function fn_login()
    {
        document.loginform.action = "${domain}" + jskfn_open_url("/platform/login_save.do");
        jskfn_submit(document.loginform);
    };
    function fn_home()
    {
        document.location = jskfn_open_url("/platform/index.do");
    };
    function fn_screen()
    {
        var u_screen_width = document.documentElement.clientWidth;
        var u_screen_height = document.documentElement.clientHeight;
        var url = jskfn_open_url("/platform/user/user_screen_save.do");
        jskfn_ajax("XML", "get", url, "u_screen_width="+u_screen_width+"&u_screen_height="+u_screen_height,"");
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>