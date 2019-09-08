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
<input type="hidden" name="jskvar_excel_html" id="jskvar_excel_html" />
<input type="hidden" name="jskvar_excel_title" id="jskvar_excel_title" />
<input type="hidden" name="jskvar_excel_file" id="jskvar_excel_file" />

<div class="jskui_header">
    <div class="jskui_header_title">Api / Restful</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

    <button type="button" onclick="fn_get_token(); return false;">Start</button>
    
    </div>
    <div class="jskui_group">
    Press F12, Debug-Mode    
    </div>    
    
    <div class="jskui_group">
    <table class="jskui_table jskui_nostripe_y">
    <tr>
    <th width="120" class="jskui_left">ID <div class="jskui_required" title="Required field"></div></th>
    <td class="jskui_left"><input type="text" name="u_id" id="u_id" value="" style="width:100%" /></td>
    </tr>
    <tr>
    <th class="jskui_left">PW <div class="jskui_required" title="Required field"></div></th>
    <td class="jskui_left"><input type="text" name="u_pw" id="u_pw" value="" style="width:100%" /></td>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

    window.onload = function()
    {
        try{parent.jskfn_offloading();}catch(e){}
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    var mytoken = "";
    var mid = "";

    function fn_get_token()
    {
        var url = "/odata/token.do";
        
        //접속 계정
        var u_id = jskfn.getId("u_id").value;
        var u_pw = jskfn.getId("u_pw").value;
        
        var params="u_id="+u_id+"&u_pw="+u_pw;

        $.ajax({
            type: 'POST', 
            url: url,
            data: params,
            statusCode:
            {
                401:function() { console.log("401"); }, 
                404:function() { console.log("404"); }, 
                200:function() { console.log("200"); }
            },
            success : function(data)
            {
                console.log(data);
                
                if(data.j_opendata_code == "S")
                {
                    mytoken = data.access_token;
                    
                    console.log(mytoken);
                    
                    fn_data_list();
                }
            }
        });
    }

    function fn_data_list()
    {
        var url = "/api/v1/item";

        var user_token = "Bearer "+mytoken;
        
        $.ajax({
            contentType:"application/json",         
            type: 'GET',
            url: url,
            headers: { "Authorization": user_token },
            statusCode:
            {
                401:function() { console.log("401"); }, 
                404:function() { console.log("404"); }, 
                200:function() { console.log("200"); }
            },
            success : function(data)
            {
                console.log(data);
                
                for(var i=0; i<data.list.length;i++)
                {
                    var data1 = i+1;
                    var data2 = data.list[i].title;
                    var data3 = data.list[i].money;
                    var data4 = data.list[i].open_year;
                    var data5 = data.list[i].mid;
                    
                    console.log(data5);
                    
                    mid = data5;
                }
                
                fn_data_view();
            }
        });
    }

    function fn_data_view()
    {
        var url = "/api/v1/item/"+mid;

        var user_token = "Bearer "+mytoken;
        
        $.ajax({
            contentType:"application/json",
            type: 'GET',
            url: url,
            headers: { "Authorization": user_token },
            statusCode:
            {
                401:function() { console.log("401"); }, 
                404:function() { console.log("404"); }, 
                200:function() { console.log("200"); }
            },
            success : function(data)
            {
                console.log(data);
                
                fn_data_insert();
            }
        });
    }

    function fn_data_insert()
    {
        var url = "/api/v1/item";
        
        var jsonbody = {"money":"12345","title":"SuperMan","open_year":"2007"};
        
        var user_token = "Bearer "+mytoken;
        
        $.ajax({
            contentType:"application/json",         
            type: 'POST',
            url: url,
            headers: { "Authorization": user_token },
            data: JSON.stringify(jsonbody),
            statusCode:
            {
                401:function() { console.log("401"); }, 
                404:function() { console.log("404"); }, 
                200:function() { console.log("200"); }
            },
            success : function(data)
            {
                console.log(data);
                
                mid = data.mid;
                
                fn_data_update();
            }
        });
    }

    function fn_data_update()
    {
        var url = "/api/v1/item/"+mid;
        
        var jsonbody = {"money":"54321","title":"BatMan","open_year":"2017"};
        
        var user_token = "Bearer "+mytoken;
        
        $.ajax({
            contentType:"application/json",         
            type: 'PUT',
            url: url,
            headers: { "Authorization": user_token },
            data: JSON.stringify(jsonbody),
            statusCode:
            {
                401:function() { console.log("401"); }, 
                404:function() { console.log("404"); }, 
                200:function() { console.log("200"); }
            },
            success : function(data)
            {
                console.log(data);    
                
                fn_data_delete();
            }
        });
    }

    function fn_data_delete()
    {
        var url = "/api/v1/item/"+mid;
        
        var user_token = "Bearer "+mytoken;
        
        $.ajax({
            contentType:"application/json",         
            type: 'DELETE',
            url: url,
            headers: { "Authorization": user_token },
            statusCode:
            {
                401:function() { console.log("401"); }, 
                404:function() { console.log("404"); }, 
                200:function() { console.log("200"); }
            },
            success : function(data)
            {
                console.log(data);            
            }
        });
    }

</script>
</body>
</html>