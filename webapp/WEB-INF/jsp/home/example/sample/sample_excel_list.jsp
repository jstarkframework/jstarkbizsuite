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
<input type="hidden" name="fid" id="fid" value="" />

<div class="jskui_header">
    <div class="jskui_header_title">Excel Upload + Read</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

    <button type="button" name="btn_upload" id="btn_upload" onclick="fn_action_insert(); return false;">Upload</button>

    </div>
    <div class="jskui_group">

    <table class="jskui_search jskui_nostripe_y">
    <tr>
    <th width="100">File 1</th>
    <td><input type="file" name="attach_file" style="width:100%" /></td>
    </tr>
    </table>

    </div>

    <div class="jskui_fileupload_progress" id="jskid_fileupload_progress"></div>

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_x">
	    <tr>
		    <th width="50">No</th>
		    <th>File Name</th>
		    <th width="50">Ext.</th>
		    <th width="100">Size</th>
		    <th width="150">Added Date</th>
		    <th width="50">Delete</th>
	    </tr>
    <%
    while(list.next())
    {
    %>
        <tr>
            <td><%=list.getCountDesc()%></td>
            <td><a onclick="fn_file_read('<%=ro.toEncode(list.getString("fid"))%>'); return false;"><%=list.getString("file_name")%></a></td>
            <td><%=list.getString("file_ext")%></td>
            <td class="jskui_right"><%=CoreUtils.toComma(list.getString("file_size"))%></td>
            <td><%=list.getString("a_date")%></td>
            <td><a onclick="fn_delete_file('<%=ro.toEncode(list.getString("fid"))%>'); return false;">Delete</a></td>
        </tr>
    <%
    }
    if(list.isNull())
    {
    %>
        <tr>
            <td colspan="6">Data not found.</td>
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

    function fn_action_insert()
    {
        document.jskform.enctype="multipart/form-data";
        
        jskfn.getId("btn_upload").style.display="none";
        jskfn_fileupload_status();

        document.jskform.action = jskfn_open_url("/example/sample/sample_excel_file_upload_save.do");

        jskfn_submit(document.jskform);
        
        document.jskform.enctype="";
    };

    var v_fid;
    function fn_delete_file(fid)
    {
        v_fid=fid;
        parent.jskfn_confirm("Do you want to delete?", fn_delete_file_save);
    };

    function fn_delete_file_save()
    {
        jskfn.getId("fid").value=v_fid;
        document.jskform.action = jskfn_open_url("/example/sample/sample_excel_file_delete_save.do");
        jskfn_submit(document.jskform);
    };

    function jskfn_show_file_upload(msg)
    {
        jskfn.getId("jskid_fileupload_progress").innerHTML=msg;
    };

    function fn_submit_back()
    {
        jskfn.getId("btn_upload").style.display="";
    };

    function fn_file_read(fid)
    {
        document.location = jskfn_open_url("/example/sample/sample_excel_file_read.do")+"?fid="+fid;
    };

</script>
</body>
</html>