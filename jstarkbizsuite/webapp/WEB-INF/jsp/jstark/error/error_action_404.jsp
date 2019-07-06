<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %><%
%><%@ page import = "jstark.framework.*,org.jstark.framework.core.*" %><%

response.setStatus(HttpServletResponse.SC_OK);

String jcontext = CoreUtils.getContext();
if(jcontext==null)
{
    jcontext="";
}

%><!DOCTYPE html>
<html style="width:100%;">
<head>
<script type="text/javascript">
    window.onload = function()
    {
    	try{parent.jskfn_offloading();}catch(e){}
    };
</script>
</head>
<body style="padding:0px;margin:0px;background-color:#F1F3F4;">
<div style="width:100%;height:120px;line-height:23px;text-align:center;color:#697A98;margin:auto;top:0;bottom:0;position:absolute;">
<div align="center">
<table style="width:250px">
<tr>
<td style="width:2px;background:#697A98"></td>
<td style="text-align:left;padding-left:20px;font-family:'Apple SD Gothic Neo',arial,sans-serif;font-size:small;">
<b>OOPS! PAGE NOT FOUND,</b>
<br />The requested page was not found.
</td>
</tr>
</table>
</div>
</div>
</body>
</html>