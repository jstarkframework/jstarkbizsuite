<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %><%
%><%@ page import = "jstark.framework.*,jstark.platform.*,org.jstark.framework.core.*" %><%

response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//response.setStatus(HttpServletResponse.SC_OK);

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
    	//JSTARK_ERROR_MSG
    	try
    	{
    	    jskfn_alert_long_red("<%=PlatformMessage.getErrorMessage()%>");
    	}
    	catch(e)
    	{
    	    try
    	    {
    	        parent.jskfn_alert_long_red("<%=PlatformMessage.getErrorMessage()%>");
    	    }
    	    catch(ee)
    	    {
    	        try
    	        {
    	            parent.parent.jskfn_alert_long_red("<%=PlatformMessage.getErrorMessage()%>");
    	        }
    	        catch(eee)
    	        {
    	            try
    	            {
    	                parent.parent.parent.jskfn_alert_long_red("<%=PlatformMessage.getErrorMessage()%>");
    	            }
    	            catch(eeee)
    	            {
    	                alert("<%=PlatformMessage.getErrorMessage()%>");
    	            }
    	        }
    	    }
    	}
    	try{parent.jskfn_offloading();}catch(e){}
    };
</script>
</head>
<body style="padding:0px;margin:0px;background-color:#F1F3F4;">
<div style="width:100%;height:120px;line-height:23px;text-align:center;color:#697A98;margin:auto;top:0;bottom:0;position:absolute;">
<div align="center">
<table style="width:415px">
<tr>
<td style="width:2px;background:#697A98"></td>
<td style="text-align:left;padding-left:20px;font-family:'Apple SD Gothic Neo',arial,sans-serif;font-size:small;">
<b>SORRY FOR THE INCONVENIENCE,</b> 
<br />Please try again in a few minutes.
<br />If you see this message repeatedly, contact your administrator. 
</td>
</tr>
</table>
</div>
</div>
</body>
</html>