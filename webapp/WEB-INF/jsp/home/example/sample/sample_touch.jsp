<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<style type="text/css">
.style_table{border-collapse:collapse;border-spacing:0px;border:1px solid #c9c9c9;width:100%;}
.style_th{border:1px solid #dddddd;background:#ffffff;width:20%;height:30px;text-align:center;}
.style_td{border:1px solid #dddddd;background:#ffffff;height:10px;text-align:center;"}
</style>
</head>
<body style="overflow-x:hidden;">

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">TOUCH</div>
    <div class="jskui_header_sub"></div>
</div>

<div class="jskui_group jskui_left_bar_orange">
    <table style="border:0px">
    <tr><td style="width:60px;text-align:right">Link :</td><td style="padding-left:10px"><%=ro.getString("jskroot_url")%></td></tr>  
    <tr><td style="width:60px;text-align:right">Action :</td><td style="padding-left:10px"><%=ro.getString("jskroot_actionclass")%>.<%=ro.getString("jskroot_domethod")%></td></tr>  
    <tr><td style="width:60px;text-align:right">JSP :</td><td style="padding-left:10px"><%=ro.getRequest().getAttribute("jskroot_view_page")%></td></tr>    
    </table>
</div>

<table class="style_table">
<tr>
<td class="style_th" onclick="fn_touch_link(0)" style="cursor:pointer" id="hpage0"><b>MAIN</b></td>
<td class="style_th" onclick="fn_touch_link(1)" style="cursor:pointer" id="hpage1"><b>NEWS</b></td>
<td class="style_th" onclick="fn_touch_link(2)" style="cursor:pointer" id="hpage2"><b>SPORTS</b></td>
<td class="style_th" onclick="fn_touch_link(3)" style="cursor:pointer" id="hpage3"><b>SHOPPING</b></td>
<td class="style_th" onclick="fn_touch_link(4)" style="cursor:pointer" id="hpage4"><b>VIDEO</b></td>
</tr>
<tr>
<td class="style_td" id="page0"></td>
<td class="style_td" id="page1"></td>
<td class="style_td" id="page2"></td>
<td class="style_td" id="page3"></td>
<td class="style_td" id="page4"></td>
</tr>
</table>
<br />

<div id="jskid_touch_screens" onmousedown="event.preventDefault?event.preventDefault():event.returnValue=false" style="width:100%;height:100%;overflow:hidden;">

<div id="jskid_touch_screen" name="jskid_touch_screen" style="width:100%;left:200%;position:absolute;background:red;">
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
<a href="javascript:fn_link_click()">MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN</a><br />
</div>
<div id="jskid_touch_screen" name="jskid_touch_screen" style="width:100%;left:200%;position:absolute;background:green;">
NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />
NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />
NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />NEWS<br />
</div>
<div id="jskid_touch_screen" name="jskid_touch_screen" style="width:100%;left:200%;position:absolute;background:yellow;">
<a href="javascript:fn_link_click()"><img src="/web/jstark/platform/img/jskimg_login.jpg" /></a><br />
<a href="javascript:fn_link_click()"><img src="/web/jstark/platform/img/jskimg_login.jpg" /></a><br />
SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />
SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />SPORTS<br />
</div>
<div id="jskid_touch_screen" name="jskid_touch_screen" style="width:100%;left:200%;position:absolute;background:blue;">
SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />
SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />SHOPPING<br />
</div>
<div id="jskid_touch_screen" name="jskid_touch_screen" style="width:100%;left:200%;position:absolute;background:pink;">
VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />
VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />VIDEO<br />
</div>
</div>

</form>
<script type="text/javascript" src="/web/jstark/platform/js/jstark.touch.min.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript">

    var page_now=-1;
    function jskfn_touch_load(page)
    {
        if(page_now!=page)
        {
            page_now=page;
            for(var i=0;i<jskvar_touch_obj_length;i++)
            {
                if(page!=i)
                {
                    jskfn.getId("page"+i).style.background="white";
                    jskfn.getId("hpage"+i).style.color="black";
                }
                else if(page==i)
                {
                    jskfn.getId("page"+i).style.background="green";
                    jskfn.getId("hpage"+i).style.color="red";
                }
            }
        }
    };

    function fn_touch_link(page)
    {
        jskvar_touch_obj_num=page;
        jskvar_touch_obj_screen[jskvar_touch_obj_num].style.left="0px";
        jskvar_touch_obj_screen[jskvar_touch_obj_num].style.display="";
        for(var i=0;i<jskvar_touch_obj_length;i++)
        {
            if(page!=i)
            {
                jskvar_touch_obj_screen[i].style.display="none";
            }
        }
        jskfn_touch_load(page);
    };

    function fn_link_click()
    {
        parent.jskfn_alert("link click");
    };

</script>
</body>
</html>