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
    <div class="jskui_header_title">BLOB</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

    <button type="button" name="btn_upload" id="btn_upload" onclick="fn_save(); return false;">Save</button>

    </div>
    <div class="jskui_group">

    <table class="jskui_search jskui_nostripe_y">
    <tr>
    <th width="120">파일</th>
    <td><input type="file" name="file" style="width:100%;" /></td>
    </tr>
    </table>

    </div>

    <div class="jskui_fileupload_progress" id="jskid_fileupload_progress"></div>

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
    <tr>
    <th width="50">NO</th>
    <th>CODE</th>
    <th>NAME</th>
    <th width="100">DELETE</th>
    </tr>
    <%
    while(list.next())
    {
    %>
        <tr onmouseover="jskfn_tr_mouseover(this);" onmouseout="jskfn_tr_mouseout(this);">
            <td><%=list.getCountAsc()%></td>
            <td class="jskui_left"><a onclick="fn_download('<%=list.getString("a")%>'); return false;"><%=list.getString("a")%></a></td>
            <td><%=list.getString("c")%></td>
            <td><button type="button" class="jskui_button_small" onclick="fn_delete('<%=list.getString("a")%>'); return false;">delete</button></td>
        </tr>
    <%
    }
    %>
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

    function fn_download(a)
    {
        jskfn_location(jskfn_open_url("/example/sample/sample_blob_download_save.do")+"?a="+a);
    };

    function fn_delete(a)
    {
        document.location = jskfn_open_url("/example/sample/sample_blob_delete_save.do")+"?a="+a;
    };

    function fn_save()
    {
        document.jskform.enctype="multipart/form-data";
        
        jskfn.getId("btn_upload").style.display="none";
        jskfn_fileupload_status();

        jskform.action = jskfn_open_url("/example/sample/sample_blob_upload_save.do");
        jskfn_submit(document.jskform);
        
        document.jskform.enctype="";
    };

    function jskfn_show_file_upload(msg)
    {
        jskfn.getId("jskid_fileupload_progress").innerHTML=msg;
    };

    function fn_submit_back()
    {
        jskfn.getId("btn_upload").style.display="";
    };

</script>
</body>
</html>