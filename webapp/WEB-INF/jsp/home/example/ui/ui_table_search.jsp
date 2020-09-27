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
    <div class="jskui_header_title">Table Search</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">
	    <table class="jskui_table jskui_nostripe_x" id="search_table">
	    <tr>
	    <th width="100">Col1</th>
	    <th>Col2</th>
	    <th width="100">Col2</th>
	    </tr>
	    <tr>
        <th><input type="text" onkeyup="jskfn_table_search(this, 'search_table', 2, 0)" placeholder="Serach for col1" class="jskui_table_search jskui_orange_color" /></th>
        <th><input type="text" onkeyup="jskfn_table_search(this, 'search_table', 2, 1)" placeholder="Serach for col2" class="jskui_table_search jskui_orange_color" /></th>
        <th><input type="text" onkeyup="jskfn_table_search(this, 'search_table', 2, 2)" placeholder="Serach for col3" class="jskui_table_search jskui_orange_color" /></th>
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
	    <td>3</td>
	    <td>C</td>
	    <td>다</td>
	    </tr>
	    <tr>
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
        try{parent.jskfn_offloading();}catch(e){}
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>