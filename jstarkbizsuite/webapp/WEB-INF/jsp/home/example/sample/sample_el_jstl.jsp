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
<input type="hidden" name="j_page" id="j_page" value="${ro.j_page}" />
<input type="hidden" name="jskvar_sort" id="jskvar_sort" value="${ro.jskvar_sort}" />
<input type="hidden" name="jskvar_sort_type" id="jskvar_sort_type" value="${ro.jskvar_sort_type}" />

<div class="jskui_header">
    <div class="jskui_header_title">${ro.title}</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_button_bar">

    <button type="button" onclick="fn_search(); return false;">Search</button>

    <c:if test="${not empty ro.search_title}">
    <button type="button" onclick="jskfn.getId('search_title').value='';fn_search(); return false;">All</button>
    </c:if>

    </div>
    <div class="jskui_group">

    <table class="jskui_search jskui_nostripe_y">
    <tr>
    <th width="100">Title</th>
    <td><input type="text" name="search_title" id="search_title" value="${ro.search_title}" style="width:100%" /></td>
    </tr>
    </table>

    </div>

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
    <tr>
    <th width="100">${jskfn:lang(ro,"JSTARKPLATFORM00015","순번")}</th>
    <th width="100">No</th>
    <th>Title</th>
    <th><a href="javascript:fn_sort('title')">Title ${jskfn:sort(ro,"title")}</a></th>
    <th width="100"><a href="javascript:fn_sort('money')">Money ${jskfn:sort(ro,"money")}</a></th>
    <th width="50"><a href="javascript:fn_sort('open_year')">Open ${jskfn:sort(ro,"open_year")}</a></th>
    </tr>
    <c:forEach var="list" items="${list}">
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('${jskfn:encode(ro, list.mid)}'); return false;" style="cursor:pointer">
            <td>${list.jstark_desc}</td>
            <td>${list.jstark_asc}</td>
            <td><c:out value="${list.title}" escapeXml="false" /></td>
            <td>${list.title}</td>
            <td class="jskui_right">${list.money}</td>
            <td>${list.open_year}</td>
        </tr>
    </c:forEach>

    <c:if test="${fn:length(list)==0}">
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);">
            <td colspan="6">Data not found.</td>
        </tr>
    </c:if>

    </table>

    </div>

    <div class="jskui_group jskui_center">${jskfn:page(list)}</div>

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

    function fn_page(page_no)
    {
        jskfn.getId("j_page").value = page_no;
        document.jskform.action = jskfn_open_url("/example/sample/sample_el_jstl.do");
        jskfn_document(document.jskform);
    };

    function fn_sort(column)
    {
        if(jskfn.getId("jskvar_sort_type").value=="desc")
        {
            jskfn.getId("jskvar_sort_type").value="asc";
        }
        else
        {
            jskfn.getId("jskvar_sort_type").value="desc";
        }
        jskfn.getId("jskvar_sort").value=column;
        fn_search();
    };

    function fn_search()
    {
        jskfn.getId("j_page").value = "1";
        document.jskform.action = jskfn_open_url("/example/sample/sample_el_jstl.do");
        jskfn_document(document.jskform);
    };

    function fn_view(mid)
    {
        alert(mid);
    };

</script>
</body>
</html>