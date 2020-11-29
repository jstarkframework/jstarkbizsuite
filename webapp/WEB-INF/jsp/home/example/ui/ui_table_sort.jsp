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


<div class="jskui_header">
    <div class="jskui_header_title">Table Sort</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group_top_zero">
        <div style="width:100%" class="jskui_right">
            <img src="/web/jstark/platform/img/excel.png" onclick="jskfn_table_excel('sort_table', 'tablesort', null)" width="18" style="cursor:pointer" title="Excel Download">
            <img src="/web/jstark/platform/img/filter.png" onclick="jskfn_table_filter_init(this, 'sort_table', null)" width="18" style="cursor:pointer" title="Table Filter" id="jskid_table_filter">
        </div>
        
        <table class="jskui_table jskui_nostripe_x" id="sort_table">
	    <tr>
	    <th class="noselect" width="100" onclick="jskfn_table_sort(this, true)" style="cursor:pointer">Col1</th>
	    <th table_filter="NOHIDDEN" class="noselect" onclick="jskfn_table_sort(this, false)" style="cursor:pointer">Col2</th>
	    <th class="noselect" onclick="jskfn_table_sort(this, false)" style="cursor:pointer">Col3</th>
	    </tr>
	    <tr>
	    <td>1</td>
	    <td>A</td>
	    <td>가</td>
	    </tr>
	    <tr>
	    <td>2</td>
	    <td>B</td>
	    <td>나</td>
	    </tr>
	    <tr>
	    <td> </td>
	    <td>C</td>
	    <td>다</td>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td>4</td>
	    <td>D</td>
	    <td>라</td>
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
        jskfn_table_sort_set("sort_table", -1);
                
        jskfn_table_sort_storage("sort_table");
        //jskfn_table_sort_clear("sort_table");
        
        jskfn_table_filter_storage("sort_table", null);
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>