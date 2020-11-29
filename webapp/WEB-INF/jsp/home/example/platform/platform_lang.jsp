<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="j_param" id="j_param" value="set" />

<div class="jskui_header">
    <div class="jskui_header_title">Language</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
    <tr>
    <th width="100">CODE</th>
    <th>${jskfn:lang(ro,"JSTARKPLATFORM00014","명칭")}</th>
    </tr>
    <tr>
        <td>LANG00001</td>
        <td class="jskui_left">${jskfn:lang(ro,"LANG00001","등록")}</td>
    </tr>
    <tr>
        <td>LANG00002</td>
        <td class="jskui_left">${jskfn:lang(ro,"LANG00002","검색")}</td>
    </tr>
    <tr>
        <td>LANG00003</td>
        <td class="jskui_left">${jskfn:lang(ro,"LANG00003","목록")}</td>
    </tr>
    <tr>
        <td>LANG00004</td>
        <td class="jskui_left">${jskfn:lang(ro,"LANG00004","수정")}</td>
    </tr>
    <tr>
        <td>LANG00005</td>
        <td class="jskui_left">${jskfn:lang(ro,"LANG00005","삭제")}</td>
    </tr>
    <tr>
        <td>LANG00006</td>
        <td class="jskui_left">${jskfn:lang(ro,"LANG00006","전체")}</td>
    </tr>
    <tr>
        <td>LANG00007</td>
        <td class="jskui_left">${jskfn:lang(ro,"LANG00007","취소")}</td>
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