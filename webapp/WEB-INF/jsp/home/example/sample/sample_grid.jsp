<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<style type="text/css">

input:focus 
{
  outline: none !important;
}

input[type=text]::-ms-clear 
{
    display:none;
}

</style>
</head>
<body class="jskui_body_white" onmouseup="jskfn_grid_mouseup()" onclick="jskfn_grid_menu_close()" onkeydown="jskfn_grid_keydown(event)">

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="grid_data" id="grid_data" value="" />

<div class="jskui_header">
    <div class="jskui_header_title">Grid</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_button_bar">

    <button type="button" name="btn_delete" id="btn_delete" onclick="jskfn_grid_all_line_delete(); return false;">All Delete</button>

    </div>

    <div class="jskui_group">
        
        <table class="jskui_table no-drag jskui_grid_table" id="grid_table">
        <tr gline="false">
        <th width="50"></th>
        <th width="150">1</th>
        <th width="150">2</th>
        <th width="150">3</th>
        <th width="150">4</th>    
        <th width="150">5</th>
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

<script type="text/javascript" src="/web/jstark/platform/js/jstark.grid.min.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript">
    
    var grid_align="center";

    window.onload = function()
    {
        jskfn_grid_init(grid_align);
    };

    var jskvar_grid_name = "grid_table"; 
    
    function jskfn_grid_new_line_blank(insert_line)
    {
        jskfn_grid_new_line(insert_line, "", "", "", "", "", "");
    };
    
    function jskfn_grid_new_line(insert_line, col1, col2, col3, col4, col5, col6)
    {
        var row;        
        if(insert_line==-1)
        {
            row = jskfn.getId(jskvar_grid_name).insertRow();
        }
        else
        {
            row = jskfn.getId(jskvar_grid_name).insertRow(insert_line);
        }
        
        row.setAttribute("gline", "true");
        row.setAttribute("gmenu", "true");
        row.setAttribute("gdelete", "true");
                        
        var cell1 = document.createElement("th");
        cell1.oncontextmenu = function () { jskfn_grid_mouserightdown(event, this); return false; };                
        cell1.onmousedown = function () { jskfn_grid_mousedown(this); };
        cell1.onmousemove = function () { jskfn_grid_mouseover(this); };
        cell1.style.cursor="pointer";
        row.appendChild(cell1);
        cell1.innerHTML = col1;
        
        var cell2 = row.insertCell(1);          
        cell2.onclick = function () { jskfn_grid_click(this); };
        cell2.setAttribute("gedit", "true");
        cell2.setAttribute("gtype", "int");
        cell2.style.cursor="pointer";
        cell2.style.textAlign=grid_align;
        cell2.innerHTML = col2;
          
        var cell3 = row.insertCell(2);          
        cell3.onclick = function () { jskfn_grid_click(this); };
        cell3.setAttribute("gedit", "true");
        cell3.setAttribute("gtype", "int");
        cell3.style.cursor="pointer";
        cell3.style.textAlign=grid_align;
        cell3.innerHTML = col3;
           
        var cell4 = row.insertCell(3);
        cell4.innerHTML = col4;
        
        var cell5 = row.insertCell(4);
        cell5.innerHTML = col5;
        
        var cell6 = row.insertCell(5);
        cell6.innerHTML = col6;
    };
    
    function jskfn_grid_basic_line()
    {
        var check_cols = 1;
        var max_blank = 10;
        var blank_cnt = 0;
        
        var len_rows = jskfn.getId(jskvar_grid_name).rows.length;
        
        for(var i=0;i<len_rows;i++)
        {
            if(jskfn.getId(jskvar_grid_name).rows[i].cells[check_cols].textContent=="")
            {
                blank_cnt++;
            }
        }
             
        if(blank_cnt<max_blank)
        {
            for(var i=blank_cnt;i<max_blank;i++)
            {
                jskfn_grid_new_line(-1, "", "", "", "", "", "");
            }
        }        
    };
    
    function jskfn_grid_input_dblclick(index, value)
    {
        alert(index+"-"+value);
    };
    
    function jskfn_grid_change()
    {
        jskfn_grid_data_collection();
    };
    
    var grid_data_history = "";
    function jskfn_grid_data_collection()
    {
        try
        {
            var table = jskfn.getId("grid_table");
            var len_rows = table.rows.length;
            var col1 = "";
            var col2 = "";
            var col1_t = "";
            var col2_t = "";
            var temp_grid_data="";
            var check_value=true;
            for(var i=2;i<len_rows;i++)
            {
                check_value=true;
                
                col1 = table.rows[i].cells[2].textContent;
                col2 = table.rows[i].cells[3].textContent;
                
                if(col1.indexOf("input")>-1)
                {
                    col1 = jskfn.getId("jskid_grid_input").value;
                }
                else if(col2.indexOf("input")>-1)
                {
                    col2 = jskfn.getId("jskid_grid_input").value;
                }
                
                if(temp_grid_data == "")
                {
                    temp_grid_data += i+"^"+col1+"^"+col2;
                }
                else
                {
                    temp_grid_data += "|"+i+"^"+col1+"^"+col2;
                }
            }
            
            if(grid_data_history != temp_grid_data)
            {
                grid_data_history = temp_grid_data;
                
                jskfn.getId("grid_data").value=temp_grid_data;
                
                //grid data submit
                //document.jskform.action = jskfn_open_url("/");
                //jskfn_submit(document.jskform);
            }
        }
        catch(e)
        {
            console.log(e);
        }
    };

</script>
</body>
</html>