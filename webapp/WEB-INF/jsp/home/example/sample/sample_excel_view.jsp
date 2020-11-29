<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%

    String[][][] sheet_list = (String[][][])ro.get("list");

    DList list=null;
    int rows=0;
    int cols=0;

%><!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">Excel Read</div>
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
    <div class="jskui_button_bar">

    <button type="button" onclick="fn_list(); return false;">List</button>

    </div>
    <div class="jskui_group">

    <div id="jskid_scroll_td_div" class="jskui_scroll_td_div">

    <%
if(sheet_list!=null)
{
for(int i=0;i<sheet_list.length;i++)
{
    if(sheet_list[i]!=null && sheet_list[i].length>0)
    {
        if(sheet_list[i][0].length>0)
        {
        %>
        &nbsp;SHEET <%=i+1%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rows=<%=sheet_list[i].length%> , cols=<%=sheet_list[i][0].length%>
        <div class="jskui_br"></div>
        <table class="jskui_scroll">
            <tr>
                <th width="50"></th>
                <%
                for(int k=0;k<sheet_list[i][0].length;k++)
                {
                %>
                <th width="100"><%=k+1%></th>
                <%
                }
                %>
            </tr>
            <%
            for(int j=0;j<sheet_list[i].length;j++)
            {
            %>
            <tr>
                <th width="50"><%=j+1%></th>
                <%
                for(int k=0;k<sheet_list[i][j].length;k++)
                {
                    %><td width="100"><%=sheet_list[i][j][k]%></td><%
                }
                %>
            </tr>
            <%
            }
            %>
        </table>
        <br />
        <%
        }
    }
}
}
%>

    </div>

    </div>

</div>

</form>
<script type="text/javascript">

    window.onload = function()
    {
        jskfn_frame_resize("jskid_content_frame",0);
    };

    function fn_list()
    {
        document.location = jskfn_open_url("/example/sample/sample_excel_file_upload.do");
    };

</script>
</body>
</html>