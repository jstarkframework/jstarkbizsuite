<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
<jsp:useBean id="open_year_list" class="org.jstark.framework.core.DList" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="j_param" id="j_param" value="set" />
<input type="hidden" name="j_page" id="j_page" value="<%=ro.getPage("j_page")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">Parameter Cache</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

    <button type="button" onclick="fn_init(); return false;">Reset</button>

    <button type="button" onclick="fn_search(); return false;">Search</button><%
    if(!ro.nullString("search_title"))
    {
    %> <button type="button" onclick="jskfn.getId('search_title').value='';fn_search(); return false;">All</button>
    <%
    }
    %>

    </div>
    <div class="jskui_group">

    <table class="jskui_search jskui_nostripe_y">
    <tr>
    <th width="100">Movie Title</th>
    <td><input type="text" name="search_title" id="search_title" value="<%=ro.getString("search_title")%>" style="width:100%" /></td>
    </tr>
    <tr>
    <th width="100">Open Year</th>
    <td>
    
    <%
    while(open_year_list.next())
    {
        %>
        <input type="checkbox" name="open_year" id="open_year_<%=open_year_list.i%>" value="<%=open_year_list.getString("open_year")%>" class="jskui_style_checkbox" <%
        
        if(ro.isArrayIn("open_year", open_year_list.getString("open_year")))
        {
            %>checked="checked"<%
        }
        
        %> />
        <label for="open_year_<%=open_year_list.i%>" class="jskui_style_checkbox_label"><%=open_year_list.getString("open_year")%></label>&nbsp;&nbsp;&nbsp;
        <%
    }
    %>
    
    </td>
    </tr>
    </table>

    </div>
    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
    <tr>
	    <th width="50">No</th>
	    <th>Title</th>
	    <th width="100">Money</th>
	    <th width="80">Open Year</th>
    </tr>
    <%
    while(list.next())
    {
    %>
    <tr>
        <td><%=list.getCountDesc()%></td>
        <td><%=list.getString("title")%></td>
        <td class="jskui_right"><%=CoreUtils.toComma(list.getString("money"))%></td>
        <td><%=list.getInt("open_year")%></td>
    </tr>
    <%
    }
    if(list.isNull())
    {
    %>
    <tr>
        <td colspan="4">Data not found.</td>
    </tr>
    <%
    }
    %>
    </table>

    </div>
    <div class="jskui_group jskui_center"><%=HtmlUtils.getPageList(list)%></div>
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

    function fn_page(page_no)
    {
        jskfn.getId("j_page").value = page_no;
        document.jskform.action = jskfn_open_url("/example/sample/sample_parameter_cache.do");
        jskfn_document(document.jskform);
    };

    function fn_search()
    {
        jskfn.getId("j_page").value = "1";
        document.jskform.action = jskfn_open_url("/example/sample/sample_parameter_cache.do");
        jskfn_document(document.jskform);
    };

    function fn_init()
    {
        document.location = jskfn_open_url("/example/sample/sample_parameter_cache.do")+"?j_param=init";
    };

</script>
</body>
</html>