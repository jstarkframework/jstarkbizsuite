<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<style type="text/css">

@page {  margin: 0px; }
@page {  size: A3  }
body, table, tr, td, input, textarea, div, strong
{
    font-family: NanumGothic;
    font-size:10pt;
    color:#333!important
}

.jskui_group{border-radius:6px;-moz-border-radius:6px;-webkit-border-radius:6px;border:1px solid #c9c9c9;background-color:#fff;padding:10px;margin:10px}.jskui_group:after{content:"";display:block;clear:both}
.jskui_table{border-collapse:collapse;border-spacing:0;border:1px solid #ddd;background-color:#fff;width:100%}.jskui_table th{border:1px solid #ddd;height:25px;background-color:#f5f5f5;text-align:center;color:#333;font-weight:400;vertical-align:middle;padding:1px 5px}.jskui_table td{border:1px solid #ddd;height:23px;color:#333;text-align:center;word-wrap:break-word;word-break:break-all;font-weight:400;vertical-align:middle;padding:1px 5px}
input[type="text"],textarea,select,input[type="password"]{border:1px solid #e6e6e6;border-radius:4px;-moz-border-radius:4px;-webkit-border-radius:4px;padding:4px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;-o-box-sizing:border-box;box-sizing:border-box;-webkit-appearance:none}
.jskui_left{text-align:left!important}.jskui_right{text-align:right!important}

p{margin:0px auto;}
img{max-width:100%;}

</style>
</head>
<body>

<div class="jskui_group" style="text-align:center">
    <span style="font-size:20px;font-weight:bold;color:#333333">PDF FILE TITLE</span>
</div>
<br />
<div class="jskui_main">
    <div class="jskui_group">
	    <table class="jskui_table jskui_nostripe_y">
	    <tr>
	    <th width="120" class="jskui_left">Column 1</th>
	    <td class="jskui_left">112121</td>
	    </tr>
	    <tr>
	    <th class="jskui_left">Column 2</th>
	    <td class="jskui_left"><img src="http://localhost/web/jstark/platform/img/jskimg_navi_home_jstark.jpg" /></td>
	    </tr>
	    <tr>
	    <th class="jskui_left">Column 3</th>
	    <td class="jskui_left">44444</td>
	    </tr>
	    <tr>
	    <th class="jskui_left">RADIO</th>
	    <td class="jskui_left">55555</td>
	    </tr>
	    <tr>
	    <th class="jskui_left">CHECKBOX</th>
	    <td class="jskui_left">한글 한글</td>
	    </tr>
	    <tr>
	    <th class="jskui_left">ReadOnly</th>
	    <td class="jskui_left">8888</td>
	    </tr>
	    <tr>
        <th class="jskui_left">Disable</th>
        <td class="jskui_left">9999</td>
        </tr>
	    </table>
    </div>
</div>

<div class="jskui_group" style="text-align:center;page-break-before: always;">
    <span style="font-size:20px;font-weight:bold;color:#333333">PAGE 2</span>
</div>

<br />
<div class="jskui_main">
    <div class="jskui_group">
        <table class="jskui_table jskui_nostripe_y">
        <tr>
        <th width="120" class="jskui_left">Column 1</th>
        <td class="jskui_left">112121</td>
        </tr>
        <tr>
        <th class="jskui_left">Column 2</th>
        <td class="jskui_left">33333</td>
        </tr>
        <tr>
        <th class="jskui_left">Column 3</th>
        <td class="jskui_left">44444</td>
        </tr>
        <tr>
        <th class="jskui_left">RADIO</th>
        <td class="jskui_left">55555</td>
        </tr>
        <tr>
        <th class="jskui_left">CHECKBOX</th>
        <td class="jskui_left">7777</td>
        </tr>
        <tr>
        <th class="jskui_left">ReadOnly</th>
        <td class="jskui_left">8888</td>
        </tr>
        <tr>
        <th class="jskui_left">Disable</th>
        <td class="jskui_left">9999</td>
        </tr>
        </table>
    </div>
</div>

<div class="jskui_group jskui_left_bar_orange">
    <table style="border:0px">
    <tr><td style="width:60px;text-align:right">Link :</td><td style="padding-left:10px"><%=ro.getString("jskroot_url")%></td></tr>  
    <tr><td style="width:60px;text-align:right">Action :</td><td style="padding-left:10px"><%=ro.getString("jskroot_actionclass")%>.<%=ro.getString("jskroot_domethod")%></td></tr>  
    <tr><td style="width:60px;text-align:right">JSP :</td><td style="padding-left:10px"><%=ro.getRequest().getAttribute("jskroot_view_page")%></td></tr>    
    </table>
</div>

</body>
</html>