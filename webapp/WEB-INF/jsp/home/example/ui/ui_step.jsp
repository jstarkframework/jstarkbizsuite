<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<link rel="stylesheet" type="text/css" href="${jcontext}/web/jstark/platform/css/jstark.step.min.css?<%=CoreUtils.getRevision()%>" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">Step</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_button_bar" ondragstart="return false" onselectstart="return false">
    
    <ul class="jskui_step_navi">
    <li class="jskui_step_item jskui_step_selected" id="navi_step_10" onclick="fn_navi_change(10);"><div class="jskui_step_title" title="step1">step1</div></li>
    <li class="jskui_step_item" id="navi_step_20" onclick="fn_navi_change(20);"><div class="jskui_step_title" title="step2">step2</div></li>
    <li class="jskui_step_item" id="navi_step_30" onclick="fn_navi_change(30);"><div class="jskui_step_title" title="step3">step3</div></li>
    <li class="jskui_step_item" id="navi_step_40" onclick="fn_navi_change(40);"><div class="jskui_step_title" title="step4">step4</div></li>    
    <li class="jskui_step_item" id="navi_step_50" onclick="fn_navi_change(50);"><div class="jskui_step_title" title="step5">step5</div></li>
    </ul>
 
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

    function fn_navi_change(m_no)
    {
        var navi_num = 50;
        
        for(var i=10 ; i<=navi_num ; i=i+10)
        {
            if(i==m_no)
            {
                jskfn.getId("navi_step_"+i).className="jskui_step_item jskui_step_selected";                
            }
            else
            {
                jskfn.getId("navi_step_"+i).className="jskui_step_item";                
            }
        }
    }

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>