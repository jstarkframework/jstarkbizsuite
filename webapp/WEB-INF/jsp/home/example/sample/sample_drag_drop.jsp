<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<jsp:useBean id="list" class="org.jstark.framework.core.DList" scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<style>

	.dd_div
	{
	  height: 50px;
	  margin: 0px;
	  padding: 0px;
	  border: 0px;
	  text-align:center;
	  line-height:48px;
	}
    
    div.table {
	    display: table;
	    width: 100%;	    
	}	
	div.table-cell {
	    display: table-cell;
	}
    .col1{width:100px;}
    .col2{width:auto;}
    .col3{width:100px;}
    .col4{width:100px;}
    .col5{width:100px;}
    .col6{width:100px;}
    .col7{width:100px;}
    .col8{width:100px;}

</style>
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />
<input type="hidden" name="fid" id="fid" value="" />

<div class="jskui_header">
    <div class="jskui_header_title">Drag & Drop</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

<div id="div_swap" style="display:none"></div>

<div class="dd_div" id="div_0" >
    <div id="dd_0" style="width:100%;height:50px;background:#F5F5F5;">
    <div style="border-top: 1px solid #DDD; border-bottom: 1px solid #DDD;">
		<div class="table">
		  <div class="table-cell col1">No</div>
		  <div class="table-cell col2">Title</div>
		  <div class="table-cell col3">Name</div>
		  <div class="table-cell col4">Price</div>
		  <div class="table-cell col5">Option</div>
		  <div class="table-cell col6">Unit</div>
		  <div class="table-cell col7">Delete</div>
		  <div class="table-cell col8">Note</div>
		</div>
    </div>
    </div>
</div>

<div class="dd_div" id="div_1" dropable="true" ondrop="fn_drag_set(event); fn_drop(event);" ondragover="fn_drag_set(event)" ondragleave="fn_dragleave(this); fn_drag_set(event);" ondragenter="fn_dragenter(this); fn_drag_set(event);">
    <div id="dd_1" dragable="true" draggable="true" style="width:100%;height:50px;" ondragstart="fn_dragstart(event)" ondragend="fn_dragend(event)" >
    <div class="table" style="border-bottom: 1px solid #DDD;">
        <div class="table-cell col1">No</div>
        <div class="table-cell col2">Title</div>
        <div class="table-cell col3">Name</div>
        <div class="table-cell col4">Price</div>
        <div class="table-cell col5">Option</div>
        <div class="table-cell col6">Unit</div>
        <div class="table-cell col7">Delete</div>
        <div class="table-cell col8">Note</div>
    </div>
    </div>
</div>

<div class="dd_div" id="div_2" dropable="true" ondrop="fn_drag_set(event); fn_drop(event);" ondragover="fn_drag_set(event)" ondragleave="fn_dragleave(this); fn_drag_set(event);" ondragenter="fn_dragenter(this); fn_drag_set(event);">
    <div id="dd_2" dragable="true" draggable="true" style="width:100%;height:50px;" ondragstart="fn_dragstart(event)" ondragend="fn_dragend(event)" >
    <div class="table" style="border-bottom: 1px solid #DDD;">
        <div class="table-cell col1">No</div>
        <div class="table-cell col2"><input type="text" /></div>
        <div class="table-cell col3">Name</div>
        <div class="table-cell col4">Price</div>
        <div class="table-cell col5">Option</div>
        <div class="table-cell col6">Unit</div>
        <div class="table-cell col7">Delete</div>
        <div class="table-cell col8">Note</div>
    </div>    
    </div>
</div>

<div class="dd_div" id="div_3" dropable="true" ondrop="fn_drag_set(event); fn_drop(event);" ondragover="fn_drag_set(event)" ondragleave="fn_dragleave(this); fn_drag_set(event);" ondragenter="fn_dragenter(this); fn_drag_set(event);">
    <div id="dd_3" dragable="true" draggable="true" style="width:100%;height:50px;" ondragstart="fn_dragstart(event)" ondragend="fn_dragend(event)" >
    <div class="table" style="border-bottom: 1px solid #DDD;">
        <div class="table-cell col1">No</div>
        <div class="table-cell col2"><input type="radio" /></div>
        <div class="table-cell col3">Name</div>
        <div class="table-cell col4">Price</div>
        <div class="table-cell col5">Option</div>
        <div class="table-cell col6">Unit</div>
        <div class="table-cell col7">Delete</div>
        <div class="table-cell col8">Note</div>
    </div>  
    </div>
</div>

<div class="dd_div" id="div_4" dropable="true" ondrop="fn_drag_set(event); fn_drop(event);" ondragover="fn_drag_set(event)" ondragleave="fn_dragleave(this); fn_drag_set(event);" ondragenter="fn_dragenter(this); fn_drag_set(event);">
    <div id="dd_4" dragable="true" draggable="true" style="width:100%;height:50px;" ondragstart="fn_dragstart(event)" ondragend="fn_dragend(event)" >
    <div class="table" style="border-bottom: 1px solid #DDD;">
        <div class="table-cell col1">No</div>
        <div class="table-cell col2"><input type="checkbox" /></div>
        <div class="table-cell col3">Name</div>
        <div class="table-cell col4">Price</div>
        <div class="table-cell col5">Option</div>
        <div class="table-cell col6">Unit</div>
        <div class="table-cell col7">Delete</div>
        <div class="table-cell col8">Note</div>
    </div>
    </div>
</div>


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

    var start_node;
    var end_node;
    
    var hl_css = "background: #DEEBFF; height: 44px; border: 3px dotted #004ABC;";
    var nm_css = "background: #FFFFFF; height: 50px; border: 0px;";

    var last_obj;
    
    function fn_drag_set(event)
    {
        event.stopPropagation(); 
        event.preventDefault();
    };

    function fn_dragstart(event) 
    {
        if(event.target.getAttribute("dragable")=="true")
        {        
            start_node = event.target.parentNode;
	        
	        event.dataTransfer.setData("text", event.target.id);
        }
    };
    
    function fn_dragend(event)
    {
        if(last_obj!=null)
        {
            fn_dragleave2(last_obj);
        }
    };

    function fn_drop(event)
    {
        if(event.target.getAttribute("dropable")=="true")
        {
            end_node = event.target;
	        
	        var data = event.dataTransfer.getData("text");
	        
	        event.target.appendChild(document.getElementById(data));
	        
	        event.target.style = nm_css;
	        
	        fn_swap();
        }        
    };

    function fn_dragenter(obj)
    {    
        if(last_obj!=null && last_obj != obj)
        {
            fn_dragleave2(last_obj);
        }
        
        if(obj.firstElementChild)
        {
            document.getElementById("div_swap").firstElementChild=null;
            document.getElementById("div_swap").appendChild(obj.firstElementChild);
        }
        
        obj.style = hl_css;
        
        last_obj = obj;
        
    };

    function fn_dragleave(obj)
    {
        obj.style = nm_css;
    };
    
    function fn_dragleave2(obj)
    {
        try
        {
            obj.appendChild(document.getElementById("div_swap").firstElementChild);
        }
        catch(e){}
        
        obj.style = nm_css;
    };

    function fn_swap()
    {    
        if(start_node != end_node)
        {
	        var s_node = parseInt(start_node.id.split("_")[1]);
	        var e_node = parseInt(end_node.id.split("_")[1]);
	        
	        if(s_node != e_node)
	        {
	            if(s_node > e_node) //up
	            {
	                for(var i=s_node-1 ; i>e_node ; i--)
	                {
	                    document.getElementById("div_"+(i+1)).appendChild(document.getElementById("div_"+(i)).firstElementChild);
	                }
	                
	                document.getElementById("div_"+(e_node+1)).appendChild(document.getElementById("div_swap").firstElementChild);
	            }
	            else //down
	            {
	                for(var i=s_node+1 ; i<e_node ; i++)
	                {
	                    document.getElementById("div_"+(i-1)).appendChild(document.getElementById("div_"+(i)).firstElementChild);
	                }
	                
	                document.getElementById("div_"+(e_node-1)).appendChild(document.getElementById("div_swap").firstElementChild);
	            }    
	        }
        }
    };
    
</script>
</body>
</html>