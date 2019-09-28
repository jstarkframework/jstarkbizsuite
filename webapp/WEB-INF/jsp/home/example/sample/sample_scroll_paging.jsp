<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body class="jskui_body_white" >

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />


<div class="jskui_header">
    <div class="jskui_header_title">Scroll Paging</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">
        
        <table class="jskui_table no-drag" id="id_table">
        <tr>
        <th width="50"></th>
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
<script type="text/javascript" src="/web/jstark/platform/js/jstark.grid.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript">
   
    var list = new DList();
    
    var jskvar_scroll_page = 0;
    
    window.onload = function()
    {
        try{parent.jskfn_offloading();}catch(e){}
                
        fn_init_data();
    };

    window.onscroll = function()
    {
        if(jskfn_scroll_end())
        {
            fn_scroll_page();
        }
    }
    
    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    function fn_init_data()
    {
        for(var i=0;i<100000;i++)
        {
            var data = new DData();
            
            data.set("i", i);
            data.set("type", "edit");
            
            list.add(data);            
        }
        
        fn_scroll_page();
    }
    
    function fn_scroll_page()
    {
        for(var i=jskvar_scroll_page ; i<jskvar_scroll_page+100 && i<list.size() ; i++)
        {
            var data = list.get(i);
            
            jskfn_new_line(-1, data.get("i"));    
        }
        
        if(jskvar_scroll_page<list.size())
        {
            jskvar_scroll_page += 100;
        }        
    }
    
    var jskvar_table_name = "id_table";     
    function jskfn_new_line(insert_line, col1)
    {
        var row;        
        if(insert_line==-1)
        {
            row = jskfn.getId(jskvar_table_name).insertRow();
        }
        else
        {
            row = jskfn.getId(jskvar_table_name).insertRow(insert_line);
        }
        
        var cell1 = row.insertCell(0);          
        cell1.innerHTML = col1;
    };
        
</script>
</body>
</html>