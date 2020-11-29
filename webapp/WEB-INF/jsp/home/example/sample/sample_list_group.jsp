<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%@ page import = "java.text.*" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">List Group(Sum/Avg)</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    
    <div class="jskui_group">    
    <table class="jskui_table">
	    <tr>
		    <th width="50"><%=LangUtils.lang(ro, "JSTARKPLATFORM00015","순번")%></th>
		    <th width="300">Title</th>
		    <th width="100">Money</th>
		    <th></th>
	    </tr>
        <%
        while(list.next())
        {
        %>
	    <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	        <td><%=list.i%></td>
	        <td><%=list.getString("title")%></td>
	        <td class="jskui_right"><%=CoreUtils.toComma(list.getString("money"))%></td>
	        <td></td>
	    </tr>
	    <%
	    }
        if(!list.isNull())
        {
            list.setGroup(new String[]{"money"});
            
            NumberFormat sum = new DecimalFormat("#0");
            NumberFormat avg = new DecimalFormat("#0.0");
        %>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
            <td colspan="2">Sum</td>
            <td class="jskui_right"><%=CoreUtils.toComma(sum.format(list.getSum("money")))%></td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
            <td colspan="2">Avg</td>
            <td class="jskui_right"><%=CoreUtils.toComma(avg.format(list.getAvg("money")))%></td>
            <td></td>
        </tr>
        <%
        }        
	    %>
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