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
<input type="hidden" name="j_sample_tab" id="j_sample_tab" value="<%=ro.getString("j_sample_tab")%>" />

<div class="jskui_header">
    <%
    DList tablist = new DList();
    tablist.add(new String[]{"Sample","A"});
    tablist.add(new String[]{"UI","C"});
    tablist.add(new String[]{"Platform","D"});
    %><%=HtmlUtils.getTabList(ro, tablist, "fn_tab", "j_sample_tab", true, 150)%>
</div>

<div class="jskui_main">

    <div class="jskui_group">
    <div class="jskui_resizable_table">
    <table class="jskui_table jskui_nostripe_x" id="jskid_resizable_table">
	    <tr>
		    <th width="250">Name</th>
		    <th>Description</th>
	    </tr>
	    <%
	    if(ro.equals("j_sample_tab","A"))
	    {
	    %>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_list.do?j_param=init'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List + Excel</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_list_bean.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Bean</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_excel_file_upload.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Excel Upload + Read</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_include.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Include</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_el_jstl.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">EL & JSTL</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_mobile.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Mobile</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_list_group.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Group(Sum/Avg)</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_file_upload.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">File(Image) Upload</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_parameter_cache.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Parameter Cache</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_multi_col.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Multi Colspan</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_multi_row.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Multi Rowspan</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_ajax.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Ajax</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_auto_complete.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">AutoComplete</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_webeditor.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Web Editor</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_clob.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">CLOB</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_blob.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">BLOB</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_calendar.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Calendar</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_select.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Select</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_chart.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Chart</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_tooltip.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Tooltip</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_dynamic_table.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Dynamic Table</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_touch.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Touch</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_grid.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Grid</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_scroll_paging.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Scroll Paging</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/sample/sample_pdf.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">PDF Download</td>
            <td></td>
        </tr>
        <%
        }
        else if(ro.equals("j_sample_tab","C"))
        {
        %>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_search.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Search</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_resize.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Resize</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_more.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List More</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_small.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Small</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_scroll.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Scroll</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_scroll_resize.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Scroll Resize</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_header_scroll.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Header Scroll</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_header_scroll_resize.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Header Scroll Resize</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_iframe_scroll.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Iframe Scroll</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_iframe_scroll_resize.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Iframe Scroll Resize</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_list_color.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">List Color</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_view.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">View</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_add.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Add</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_tab.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Tab</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_button.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Button</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_message.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Message</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_message2.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Message2</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_table_search.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Table Search</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_table_sort.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Table Sort</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_step.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Step</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_change_layout.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Change Layout</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/ui/ui_item.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Item</td>
            <td></td>
        </tr>
        <%
        }
        else if(ro.equals("j_sample_tab","D"))
        {
        %>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_tab_list.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Tab Menu</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_alert.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Alert</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_lang.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Language</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_timezone.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">TimeZone</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_code_list.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Code</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_tree_list.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Tree</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_user_view.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">User</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_confirm.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Inner Confirm</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_input.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Inner Input</td>
            <td></td>
        </tr>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="fn_view('/example/platform/platform_frame.do'); return false;" style="cursor:pointer" >
            <td class="jskui_left">Inner Frame</td>
            <td></td>
        </tr>
        <%
	    }
        %>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" onclick="return false;" style="cursor:pointer" >
            <td class="jskui_left"></td>
            <td></td>
        </tr>
    </table>
    </div>
    </div>

</div>

</form>
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

    function fn_tab(j_tab)
    {
        jskfn.getId("j_sample_tab").value=j_tab;
        document.jskform.action = jskfn_open_url("/example/index.do")+"?j_param=set";
        jskfn_document(document.jskform);
    };

    function fn_view(url)
    {
        document.jskform.action = "<%=jcontext%>"+url;
        jskfn_document(document.jskform);
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>