<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
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
<input type="hidden" name="jskvar_sort" id="jskvar_sort" value="<%=ro.getString("jskvar_sort")%>" />
<input type="hidden" name="jskvar_sort_type" id="jskvar_sort_type" value="<%=ro.getString("jskvar_sort_type")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">List + Excel</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

    <button type="button" onclick="fn_search(); return false;">Search</button><%

    if(!ro.nullString("search_title"))
    {
    %> <button type="button" onclick="jskfn.getId('search_title').value='';fn_search(); return false;">All</button>
    <%
    }

    %>
    <button type="button" onclick="fn_down_excel(); return false;">Excel</button>
    <img src="/web/jstark/platform/img/jskimg_bar.gif" alt="bar" />
    <button type="button" onclick="fn_add(); return false;">Add</button>

    </div>
    <div class="jskui_group">

    <table class="jskui_search jskui_nostripe_y">
	    <tr>
		    <th width="100">Title</th>
		    <td><input type="text" name="search_title" id="search_title" value="<%=ro.getString("search_title")%>" style="width:100%" onkeydown="if(event.keyCode==13)fn_search();" class="jskui_orange_color" /></td>
	    </tr>
    </table>

    </div>
    <div class="jskui_group">
    <div class="jskui_resizable_table">
    <table class="jskui_table jskui_nostripe_x" id="jskid_resizable_table">
	    <tr>
		    <th width="50"><%=LangUtils.lang(ro, "JSTARKPLATFORM00015","순번")%></th>
		    <th><a href="javascript:fn_sort('title')">Title <%=HtmlUtils.sort(ro, "title")%></a></th>
		    <th width="100"><a href="javascript:fn_sort('money')">Money <%=HtmlUtils.sort(ro, "money")%></a></th>
		    <th width="60"><a href="javascript:fn_sort('open_year')">Open <%=HtmlUtils.sort(ro, "open_year")%></a></th>
	    </tr>
        <%
        /*
        if(ro.equals("jskvar_sort","money") || ro.equals("jskvar_sort","open_year"))
        {
            list.setSortInt(ro.getString("jskvar_sort"),ro.getString("jskvar_sort_type"));
        }
        else
        {
            list.setSort(ro.getString("jskvar_sort"),ro.getString("jskvar_sort_type"));
        }
        */

        while(list.next())
        {
        %>
	    <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('<%=ro.toEncode(list.getString("mid"))%>'); return false;" style="cursor:pointer">
	        <td><%=list.getCountAsc()%></td>
	        <td><%=list.getString("title")%></td>
	        <td class="jskui_right"><%=CoreUtils.toComma(list.getString("money"))%></td>
	        <td><%=list.getInt("open_year")%></td>
	    </tr>
	    <%
	    }
        if(list.isNull())
        {
	    %>
	    <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);">
	        <td colspan="4">Data not found.</td>
	    </tr>
	    <%
	    }
	    %>
    </table>
    </div>
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
        try{parent.jskfn_offloading();}catch(e){}
        jskfn_resizable_table_init("jskid_resizable_table",false);
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    function fn_page(page_no)
    {
        jskfn.getId("j_page").value = page_no;
        document.jskform.action = jskfn_open_url("/example/sample/sample_list.do");
        jskfn_document(document.jskform);
    };

    function fn_down_excel()
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_excel_down.do");
        jskfn_document(document.jskform);
    };

    function fn_search()
    {
        jskfn.getId("j_page").value = "1";
        document.jskform.action = jskfn_open_url("/example/sample/sample_list.do");
        jskfn_document(document.jskform);
    };

    function fn_view(mid)
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_view.do")+"?mid="+mid;
        jskfn_document(document.jskform);
    };

    function fn_add()
    {
        document.jskform.action = jskfn_open_url("/example/sample/sample_add.do");
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

</script>
</body>
</html>