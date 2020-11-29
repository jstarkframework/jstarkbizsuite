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
<input type="hidden" name="j_page" id="j_page" value="<%=ro.getPage("j_page")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">List Bean</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_button_bar">

    <button type="button" onclick="fn_add(); return false;">Add</button>

    </div>
    
    <div class="jskui_group">
    <div class="jskui_resizable_table">
    <table class="jskui_table jskui_nostripe_x" id="jskid_resizable_table">
	    <tr>
	        <th width="50">No.</th>
		    <th>Title</th>
		    <th width="100">Money</th>
		    <th width="60">Open</th>
	    </tr>
	    <c:forEach var="list" items="${list}">
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('${list.mid}'); return false;" style="cursor:pointer">
            <td>${list.jstarkDesc}</td>
            <td>${list.title}</td>
            <td class="jskui_right">${list.money}</td>
            <td>${list.openYear}</td>
        </tr>
        </c:forEach>    
    </table>
    </div>
    </div>
    <div class="jskui_group jskui_center">${jskfn:page_ro(ro)}</div>
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
        jskfn_resizable_table("jskid_resizable_table");
    };

    function fn_page(page_no)
    {
        jskfn.getId("j_page").value = page_no;
        document.jskform.action = jskfn_open_url("/example/sample/sample_list_bean.do");
        jskfn_document(document.jskform);
    };
    
    function fn_add()
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_add_bean.do");
        jskfn_document(document.jskform);
    };

    function fn_view(mid)
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_view_bean.do")+"?mid="+mid;
        jskfn_document(document.jskform);
    };

</script>
</body>
</html>