<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
<style type="text/css">

i {
  border: solid black;
  border-width: 0 2px 2px 0;
  display: inline-block;
  padding: 2px;
  border-color:#B8B8B8;
}

.right {
  transform: rotate(-45deg);
  -webkit-transform: rotate(-45deg);
}

.left {
  transform: rotate(135deg);
  -webkit-transform: rotate(135deg);
}

.up {
  transform: rotate(-135deg);
  -webkit-transform: rotate(-135deg);
}

.down {
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
} 
</style>
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">Change Layout</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <table class="jskui_table" >
        <tr>
        <td id="left_frame_layout" width="270" style="padding:10px; vertical-align:top;">        
       
        </td>
        <td style="width:10px;background:#ffffff;padding:0px;vertical-align:top">
        
        <table style="width:100%;height:200px;border-spacing: 0px;padding:0px"><tr height="50%"><td style="border:0px;cursor:sw-resize;padding:0px" onclick="fn_left_frame_change(true)"><i class="right"></i></td></tr><tr height="50%"><td style="border:0px;cursor:se-resize;padding:0px;background:#F5F5F5;" onclick="fn_left_frame_change(false)"><i class="left"></i></td></tr></table>
        
        </td>
        <td style="padding:10px;vertical-align:top;height:500px">
                

        </td>
        <td width="35" style="padding:0px;padding-top:10px;vertical-align:top" ondragstart="return false" onselectstart="return false">
        
        <div id="control_tools" style="display:none;">
 
        </div>
        
        </td>
        <td style="width:10px;background:#ffffff;padding:0px;vertical-align:top" >
        
        <table style="width:100%;height:200px;border-spacing: 0px;padding:0px"><tr height="50%"><td style="border:0px;cursor:se-resize;padding:0px" onclick="fn_right_frame_change(true)"><i class="left"></i></td></tr><tr height="50%"><td style="border:0px;cursor:sw-resize;padding:0px;background:#F5F5F5;" onclick="fn_right_frame_change(false)"><i class="right"></i></td></tr></table>
        
        </td>
        <td id="right_frame_layout" width="300" style="padding:10px;vertical-align:top">        
        
        </td>
        </tr>     
        </table>

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

    var left_frame = 1;    
    var right_frame = 1;
    
    function fn_left_frame_change(step_flag)
    {
        if(step_flag)
        {
            left_frame++;
            
            if(left_frame>3)
            {
                left_frame=0;
            }       
        }
        else
        {
            left_frame--;
            
            if(left_frame<0)
            {
                left_frame=3;
            } 
        }
        
        fn_frame_redraw();
    }
    
    function fn_right_frame_change(step_flag)
    {
        if(step_flag)
        {
            right_frame++;
            
            if(right_frame>3)
            {
                right_frame=0;
            }       
        }
        else
        {
            right_frame--;
            
            if(right_frame<0)
            {
                right_frame=3;
            } 
        }
        
        fn_frame_redraw();
    }
    
    function fn_frame_redraw()
    {
        if(left_frame==0)
        {
            jskfn.getId('left_frame_layout').style.display="none";
            jskfn.getId('left_frame_layout').style.width="0px";
        }
        else if(left_frame==1)
        {
            jskfn.getId('left_frame_layout').style.display="";
            jskfn.getId('left_frame_layout').style.width="270px";
        }
        else if(left_frame==2)
        {
            jskfn.getId('left_frame_layout').style.display="";
            jskfn.getId('left_frame_layout').style.width="400px";
        }
        else if(left_frame==3)
        {
            jskfn.getId('left_frame_layout').style.display="";
            jskfn.getId('left_frame_layout').style.width="550px";
        }
        
        if(right_frame==0)
        {
            jskfn.getId('right_frame_layout').style.display="none";
            jskfn.getId('right_frame_layout').style.width="0px";
        }
        else if(right_frame==1)
        {
            jskfn.getId('right_frame_layout').style.display="";
            jskfn.getId('right_frame_layout').style.width="300px";
        }
        else if(right_frame==2)
        {
            jskfn.getId('right_frame_layout').style.display="";
            jskfn.getId('right_frame_layout').style.width="600px";
        } 
        else if(right_frame==3)
        {
            jskfn.getId('right_frame_layout').style.display="";
            jskfn.getId('right_frame_layout').style.width="900px";
        } 
    }


</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>