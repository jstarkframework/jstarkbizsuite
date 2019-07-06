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

<div class="jskui_header">
    <div class="jskui_header_title">AutoComplete</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_button_bar">
        <button type="button" onclick="alert('save'); return false;">Save</button>
    </div>

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_y">
    <tr>
    <th width="100">Search 1</th>
    <td class="jskui_left"><script type="text/javascript">jskfn_autocomplete("in1","타이","default_value",200,25,100,jskfn_open_url("/example/sample/sample_auto_complete_data.do"),"");</script></td>
    </tr>
    <tr>
    <th width="100">Search 2</th>
    <td class="jskui_left"><script type="text/javascript">jskfn_autocomplete("in2","스파","default_value",250,25,200,jskfn_open_url("/example/sample/sample_auto_complete_data.do"),"");</script></td>
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
        try{parent.jskfn_offloading();}catch(e){}
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    function jskfn_ac_select(obj_nm,obj_text,obj_value)
    {
        if(obj_nm=="in1" && obj_text=="타이타닉")
        {
            jskfn_autocomplete_submit("in2","슈렉","");
        }
        else if(obj_nm=="in2" && obj_text=="슈렉3")
        {
            jskfn_autocomplete_submit("in1","스타","");
        }
    };

</script>
</body>
</html>