<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%
    String param=ro.getString("param");

    //Load Data METHOD
    String content="Web Editor Example";

%><!DOCTYPE html>
<html lang="ko">
<head>
<title>JSTARK WEB EDITOR</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta name="autocomplete" content="off" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" type="text/css" href="<%=jcontext%>/web/jstark/platform/css/jstark.min.css?<%=CoreUtils.getRevision()%>" />
<script type="text/javascript">

var range, selection;
var getRange = function()
{
    if(window.getSelection)
    {
        selection = window.getSelection();
        range = selection.getRangeAt(0);
    }
    return range;
};
var setRange = function(range)
{
    selection.removeAllRanges();
    selection.addRange(range);
};
document.onpaste = function(event)
{
    var items = (event.clipboardData  || event.originalEvent.clipboardData).items;
    var blob = null;
    for(var i = 0; i < items.length; i++)
    {
        if (items[i].type.indexOf("image") == 0)
        {
            blob = items[i].getAsFile();
        }
    }
    if(blob !== null)
    {
        var reader = new FileReader();
        reader.onload = function(event)
        {
            parent.jskfn_webedit_insertimage(event.target.result);
        };
        reader.readAsDataURL(blob);
    }
    return;
};

</script>
<style type="text/css">p{margin:0px auto;}body{padding:5px;}img{max-width:100%}</style>
</head>
<body onload="parent.jskfn_webedit_init();" class="jskui_body_white" style="height:100%"><%=content%></body>
</html>