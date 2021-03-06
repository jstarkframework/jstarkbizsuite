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
    <div class="jskui_header_title">List Header Scroll Resize</div>
    <div class="jskui_header_sub"></div>
</div>

<div class="jskui_group jskui_left_bar_orange">
    <table style="border:0px">
    <tr><td style="width:60px;text-align:right">Link :</td><td style="padding-left:10px"><%=ro.getString("jskroot_url")%></td></tr>  
    <tr><td style="width:60px;text-align:right">Action :</td><td style="padding-left:10px"><%=ro.getString("jskroot_actionclass")%>.<%=ro.getString("jskroot_domethod")%></td></tr>  
    <tr><td style="width:60px;text-align:right">JSP :</td><td style="padding-left:10px"><%=ro.getRequest().getAttribute("jskroot_view_page")%></td></tr>    
    </table>
</div>

<div class="jskui_main">

    <div class="jskui_group_zero" id="jskid_more_div" onclick="jskfn_more('jskid_more'); return false;" style="cursor:pointer" title="More...">
    <table style="width:100%"><tr><td height="12"><div class="jskui_hr"></div></td><td style="width:20px" align="center"><img src="/web/jstark/platform/img/plus_circle.png" width="18" id="jskid_more_img"></td></tr></table>
    </div>
    <div class="jskui_group_top_zero" id="jskid_more" style="display:">
        <table onclick="jskfn_more('jskid_more'); return false;" style="width:100%;cursor:pointer"><tr><td height="12"><div class="jskui_hr"></div></td><td style="width:20px" align="center"><img src="/web/jstark/platform/img/minus_circle.png" width="18"></td></tr></table>
        
	    <table class="jskui_search jskui_nostripe_y">
	    <tr>
	    <th width="100">Search 1</th>
	    <td></td>
	    </tr>
	    <tr>
	    <th width="100">Search 2</th>
	    <td></td>
	    </tr>
	    </table>
    </div>
    <div class="jskui_group_top_zero">
	    <div style="width:100%" class="jskui_right">
	    <img src="/web/jstark/platform/img/excel.png" onclick="jskfn_table_excel('jskid_scroll_td', 'excelfile', 'jskid_scroll_th')" width="18" style="cursor:pointer" title="Excel Download">
	    <img src="/web/jstark/platform/img/filter.png" onclick="jskfn_table_filter_init(this, 'jskid_scroll_th', 'jskid_scroll_td')" width="18" style="cursor:pointer" title="Table Filter" id="jskid_table_filter">
	    </div>
	    
    <div id="jskid_scroll_th_div" class="jskui_scroll_th_div">
    <div class="jskui_resizable_table">
	    <table id="jskid_scroll_th" class="jskui_scroll noselect">
	    <tr>
	    <th width="100" onclick="jskfn_table_sort(this, true);" style="cursor:pointer">Sort1</th>
	    <th width="300" onclick="jskfn_table_sort(this, true);" style="cursor:pointer">Sort2</th>
	    <th width="300" table_filter="NOHIDDEN">Label</th>
	    <th width="300" table_filter="NOHIDDEN">Label</th>
	    <th width="300" table_filter="NOHIDDEN">Label</th>
	    <th width="300" table_filter="NOHIDDEN">Label</th>
	    <th width="300" table_filter="NOHIDDEN">Label</th>
	    <th width="300" table_filter="NOHIDDEN">Label</th>
	    <th width="300" table_filter="NOHIDDEN">Label</th>
	    <th width="100" table_filter="NOHIDDEN">Label</th>
	    </tr>
	    </table>
	    </div>
	    </div>
	    <div id="jskid_scroll_td_div" class="jskui_scroll_td_div">
	    <table id="jskid_scroll_td" class="jskui_scroll">
	    <%
	    for(int i=0;i<20;i++)
	    {
	    %>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td class="jskui_left"><%=i%></td>
	    <td class="jskui_left"><%=(20-i)%></td>
	    <td class="jskui_left">CCC</td>
	    <td class="jskui_left">DDD</td>
	    <td class="jskui_left">EEE</td>
	    <td class="jskui_left">FFF</td>
	    <td class="jskui_left">GGG</td>
	    <td class="jskui_left">HHH</td>
	    <td class="jskui_left">III</td>
	    <td class="jskui_left">JJJ</td>
	    </tr>
	    <%
	    }
	    %>
	    </table>
    </div>
    </div>
</div>

</form>
<script type="text/javascript">

    window.onload = function()
    {
        jskfn_more_set("jskid_more");
        
        jskfn_resizable_table("jskid_scroll_th");
        jskfn_frame_resize("jskid_content_frame", 0);
        
        jskfn_table_sort_set("jskid_scroll_td", 0);        
        jskfn_table_sort_storage("jskid_scroll_td");        
        jskfn_table_filter_storage("jskid_scroll_th", "jskid_scroll_td");
        
        jskfn_scroll_resize();
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>