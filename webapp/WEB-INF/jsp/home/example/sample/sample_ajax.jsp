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
    <div class="jskui_header_title">Ajax</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

    <button type="button" onclick="fn_excel_down(); return false;">Excel</button>
    <button type="button" onclick="fn_get_ajax_xml(); return false;">Load Data(XML)</button>
    <button type="button" onclick="fn_get_ajax_json('','list'); return false;">Load Data(JSON)</button>

    </div>
    <div class="jskui_group" id="jskid_excel_div">

    <table id="list_table" class="jskui_table jskui_nostripe_x">
    <tr>
    <th width="50">No</th>
    <th>Title</th>
    <th width="100">Moeny</th>
    <th width="100">Open Year</th>
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
<script type="text/javascript" src="<%=jcontext%>/web/home/common/json/json2.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript">

    window.onload = function()
    {
        try{parent.jskfn_offloading();}catch(e){}
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    function fn_get_ajax_xml()
    {
        var type = "XML";
        var method = "POST";
        var url = jskfn_open_url("/example/sample/sample_ajax_data_xml.do");
        var paramset = "";
        fn_list_delete();
        jskfn_ajax(type, method, url, paramset, fn_callback_ajax_xml);
    };

    function fn_callback_ajax_xml(rxml)
    {
        var xml_mes = rxml.getElementsByTagName("message");

        for(var i=0;i<xml_mes.length;i++)
        {
            var data1 = jskfn_ajax_xml_get(xml_mes[i],"num");
            var data2 = jskfn_ajax_xml_get(xml_mes[i],"title");
            var data3 = jskfn_ajax_xml_get(xml_mes[i],"money");
            var data4 = jskfn_ajax_xml_get(xml_mes[i],"open_year");
            var data5 = jskfn_ajax_xml_get(xml_mes[i],"mid");
            fn_list_add(data1,data2,data3,data4,data5);
        }
    };

    function fn_list_delete()
    {
        var i_Table = jskfn.getId("list_table").children[0];
        var row_num= i_Table.rows.length;
        for(i=1;i<row_num;i++)
        {
            i_Table.deleteRow(1);
        }
    };

    function fn_list_add(data1,data2,data3,data4,data5)
    {
        var i_Table = jskfn.getId("list_table").children[0];
        var row_num= i_Table.rows.length;

        var i_Row1 = document.createElement("tr");
        var i_Col11 = document.createElement("td");
        var i_Col12 = document.createElement("td");
        var i_Col13 = document.createElement("td");
        var i_Col14 = document.createElement("td");

        i_Col11.style.textAlign='center';
        i_Col11.style.height="25px";
        i_Col12.style.textAlign='center';
        i_Col13.style.textAlign='right';
        i_Col13.style.padding='3px';
        i_Col14.style.textAlign='center';

        i_Row1.appendChild(i_Col11);
        i_Row1.appendChild(i_Col12);
        i_Row1.appendChild(i_Col13);
        i_Row1.appendChild(i_Col14);

        i_Col11.innerHTML = data1;
        i_Col12.innerHTML = "<a onclick=\"fn_get_ajax_text('"+data5+"'); return false;\">"+data2+"</a>";
        i_Col13.innerHTML = "<a onclick=\"fn_get_ajax_json('"+data5+"',''); return false;\">"+data3+"</a>";
        i_Col14.innerHTML = data4;

        i_Table.appendChild(i_Row1);
    };

    function fn_get_ajax_text(mid)
    {
        var type = "TEXT";
        var method = "POST";
        var url = jskfn_open_url("/example/sample/sample_ajax_data_text.do");
        var paramset = "mid="+mid;
        jskfn_ajax(type, method, url, paramset, fn_callback_ajax_text);
    };

    function fn_callback_ajax_text(rtext)
    {
        alert(rtext);
    };

    function fn_get_ajax_json(mid,jtype)
    {
        var type = "TEXT";
        var method = "POST";
        var url = jskfn_open_url("/example/sample/sample_ajax_data_json.do");
        var paramset = "mid="+mid+"&jtype="+jtype;
        if(jtype=="list")
        {
            fn_list_delete();
            jskfn_ajax(type, method, url, paramset, fn_callback_ajax_json_list);
        }
        else
        {
            jskfn_ajax(type, method, url, paramset, fn_callback_ajax_json);
        }
    };

    function fn_callback_ajax_json_list(rtext)
    {
        var evalData = JSON.parse(rtext);
        for(var i=0; i<evalData.message.length;i++)
        {
            var data1 = i+1;
            var data2 = evalData.message[i].title;
            var data3 = evalData.message[i].money;
            var data4 = evalData.message[i].open_year;
            var data5 = evalData.message[i].mid;
            fn_list_add(data1,data2,data3,data4,data5);
        }
    };

    function fn_callback_ajax_json(rtext)
    {
        var evalData = JSON.parse(rtext);
        alert(evalData.message.money);
    };

    function fn_excel_down()
    {
        jskfn.getId("jskvar_excel_html").value=jskfn.getId("jskid_excel_div").innerHTML;
        jskfn.getId("jskvar_excel_title").value="List";
        jskfn.getId("jskvar_excel_file").value="excel";
        document.jskform.action = jskfn_open_url("/common/common_excel_down.do");
        jskfn_submit(document.jskform);
    };

</script>
</body>
</html>