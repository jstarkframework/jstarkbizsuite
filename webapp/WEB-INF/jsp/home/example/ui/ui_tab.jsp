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
<input type="hidden" name="j_tab" id="j_tab" value="<%=ro.getString("j_tab")%>" />
<input type="hidden" name="j_tab2" id="j_tab2" value="<%=ro.getString("j_tab2")%>" />
<input type="hidden" name="j_tab3" id="j_tab3" value="<%=ro.getString("j_tab3")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">Tab</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <%
    ro.setDefault("j_tab", "A");
    DList tablist = new DList();
    tablist.add(new String[]{"Tab First","A"});
    tablist.add(new String[]{"Tab Second","B"});
    tablist.add(new String[]{"Tab Third","C"});
    %><%=HtmlUtils.getTabList(ro, tablist, true)%>
    <div class="jskui_button_bar">
        <button type="button" onclick="; return false;">Button</button>
    </div>
    <div class="jskui_group">
	    <%
        ro.setDefault("j_tab2", "B");
   	    DList tablist2 = new DList();
   	    tablist2.add(new String[]{"Tab First","A"});
   	    tablist2.add(new String[]{"Tab Second","B"});
   	    tablist2.add(new String[]{"Tab Third","C"});
	    %><%=HtmlUtils.getTabList(ro, tablist2, "fn_tab2", "j_tab2", false, 150)%>
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
    <div class="jskui_group">
	    <%
        ro.setDefault("j_tab3", "C");
   	    DList tablist3 = new DList();
   	    tablist3.add(new String[]{"Tab First","A"});
   	    tablist3.add(new String[]{"Tab Second","B"});
   	    tablist3.add(new String[]{"Tab Third","C"});
	    %><%=HtmlUtils.getTabList(ro, tablist3, "fn_tab3", "j_tab3", false, 0)%>
	    <table class="jskui_table jskui_nostripe_x">
	    <tr>
	    <th width="100">Table</th>
	    <th>Table</th>
	    <th width="100">Table</th>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td>Content</td>
	    <td>Content</td>
	    <td>Content</td>
	    </tr>
	    <tr onclick="jskfn_tr_click(this);" onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);" style="cursor:pointer">
	    <td>Content</td>
	    <td>Content</td>
	    <td>Content</td>
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
    };

    function fn_tab(j_tab)
    {
        jskfn.getId("j_tab").value=j_tab;
        document.jskform.action="<%=jcontext%>/example/ui/ui_tab.do";
        jskfn_document(document.jskform);
    };

    function fn_tab2(j_tab)
    {
        jskfn.getId("j_tab2").value=j_tab;
        document.jskform.action="<%=jcontext%>/example/ui/ui_tab.do";
        jskfn_document(document.jskform);
    };

    function fn_tab3(j_tab)
    {
        jskfn.getId("j_tab3").value=j_tab;
        document.jskform.action="<%=jcontext%>/example/ui/ui_tab.do";
        jskfn_document(document.jskform);
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>