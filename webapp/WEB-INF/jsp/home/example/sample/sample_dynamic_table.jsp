<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%

DList list = new DList();

DData data1 = new DData();
data1.set("tablekey","K1");
data1.set("col1","A");
data1.set("col2","AA");
list.add(data1);

DData data2 = new DData();
data2.set("tablekey","K2");
data2.set("col1","B");
data2.set("col2","BB");
list.add(data2);

%><!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body>

<form name="jskform" method="post" action="">
<input name="jskid_submitblock" id="jskid_submitblock" style="display:none;" />

<div class="jskui_header">
    <div class="jskui_header_title">DYNAMIC TABLE</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">

	    <button type="button" onclick="fn_add(); return false;">Add</button>
	    <button type="button" onclick="fn_check_delete(); return false;">Delete</button>
	    <button type="button" onclick="fn_table_move('up'); return false;">Up</button>
	    <button type="button" onclick="fn_table_move('down'); return false;">Down</button>
	    <button type="button" onclick="fn_save(); return false;">Save</button>

    </div>

    <div class="jskui_alert_info" id="div_table_row_info">
       0
    </div>

    <div class="jskui_group">
    <div class="jskui_resizable_table">
    <table class="jskui_table jskui_nostripe_x" id="list_table" name="list_table">
    <tr>
    <th width="50">Status</th>
    <th width="50">Check<input type="checkbox" name="allcheck" id="allcheck" onclick="jskfn_checkbox_all(this,'tablecheck')" /></th>
    <th>Column 1</th>
    <th width="200">Column 2</th>
    <th width="50">Delete</th>
    </tr>
    <%
    while(list.next())
    {
    %>
    <tr onmouseover="jskfn.getId('list_table').clickedRowIndex = this.rowIndex">
        <td><input type="hidden" name="tablekey" id="tablekey" value="<%=list.getString("tablekey")%>" /><input type="text" name="tablestatus" id="tablestatus" value="" readonly="readonly" style="text-align:center;width:100%" /></td>
        <td><input type="checkbox" name="tablecheck" id="tablecheck" /></td>
        <td><input type="text" name="col1" id="col1" value="<%=list.getString("col1")%>" style="width:100%" onchange="fn_column_modify(this);" /></td>
        <td><input type="text" name="col2" id="col2" value="<%=list.getString("col2")%>" style="width:100%" onchange="fn_column_modify(this);" /></td>
        <td><button type="button" onclick="fn_delete(); return false;" class="jskui_button_small">Delete</button></td>
    </tr>
    <%
    }
    %>
    </table>
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
        jskfn_resizable_table("list_table");
        fn_get_table_row_num();
    };

    function fn_add()
    {
        var i_table = jskfn.getId("list_table").children[0];

        var i_row = document.createElement("tr");

        var i_col_0 = document.createElement("td");
        var i_col_1 = document.createElement("td");
        var i_col_2 = document.createElement("td");
        var i_col_3 = document.createElement("td");
        var i_col_4 = document.createElement("td");

        i_col_0.innerHTML="<input type=\"hidden\" name=\"tablekey\" id=\"tablekey\" value=\"\" /><input type=\"text\" name=\"tablestatus\" id=\"tablestatus\" value=\"N\" readonly=\"readonly\" style=\"text-align:center;width:100%\" />";
        i_col_1.innerHTML="<input type=\"checkbox\" name=\"tablecheck\" id=\"tablecheck\" />";
        i_col_2.innerHTML="<input type=\"text\" name=\"col1\" id=\"col1\" style=\"width:100%\" onchange=\"fn_column_modify(this)\" />";
        i_col_3.innerHTML="<input type=\"text\" name=\"col2\" id=\"col2\" style=\"width:100%\" onchange=\"fn_column_modify(this)\" />";
        i_col_4.innerHTML="<button type=\"button\" onclick=\"fn_delete(); return false;\" class=\"jskui_button_small\">삭제</button>";

        i_row.onmouseover=function()
        {
            jskfn.getId("list_table").clickedRowIndex = this.rowIndex
        };

        i_row.appendChild(i_col_0);
        i_row.appendChild(i_col_1);
        i_row.appendChild(i_col_2);
        i_row.appendChild(i_col_3);
        i_row.appendChild(i_col_4);

        try
        {
            //아래 추가
            i_table.appendChild(i_row);
        }
        catch(e)
        {
            //위에 추가
            i_table.insertBefore(i_row,i_table.rows[1]);
        }

        fn_get_table_row_num();
    };

    var TableRowIndex=1;
    function fn_check_delete()
    {
        var i_Table = jskfn.getId("list_table").children[0];
        var row_num = i_Table.rows.length-1;

        var i_check = jskfn.getName("tablecheck");

        for(var i=row_num-1;i>=0;i--)
        {
            if(i_check[i].checked==true)
            {
                fn_del(i+1);

                try
                {
                    i_check[i].checked=false;
                }
                catch(e){}
            }
        }
        jskfn.getId("allcheck").checked=false;
        fn_get_table_row_num();
    };

    function fn_delete()
    {
        fn_del(jskfn.getId("list_table").clickedRowIndex);

        fn_get_table_row_num();
    };

    function fn_del(rownum)
    {
        var i_table = jskfn.getId("list_table").children[0];

        if(jskfn.getName("tablestatus")[rownum-1].value=="N")
        {
            //진짜 삭제
            jskfn.getId("list_table").deleteRow(rownum);
        }
        else
        {
            jskfn.getName("tablestatus")[rownum-1].value="D";

            i_table.rows[rownum].style.backgroundColor="#999999";

            jskfn.getName("col1")[rownum-1].disabled=true;
            jskfn.getName("col2")[rownum-1].disabled=true;
        }
    };

    function fn_save()
    {

    };

    function fn_get_table_row_num()
    {
        var i_Table = jskfn.getId("list_table").children[0];
        var row_num = i_Table.rows.length-1;
        var row_num2 = 0;
        var i_status = jskfn.getName("tablestatus");
        for(var i=0;i<row_num;i++)
        {
            if(i_status[i].value!="D")
            {
                row_num2++;
            }
        }

        jskfn.getId("div_table_row_info").innerText="전체:"+row_num+" 미삭제:"+row_num2;
    };

    function fn_column_modify(obj)
    {
        var i_status = jskfn.getName("tablestatus");
        var objs = jskfn.getName(obj.name);
        for(var i=0;i<objs.length;i++)
        {
            if(objs[i]==obj && i_status[i].value!="N")
            {
                i_status[i].value="M";
                obj.style.background='#E3F9E3';
            }
        }
    };

    function fn_table_move(flag)
    {
        if(flag=="up")
        {
            var i_Table = jskfn.getId("list_table").children[0];
            var row_num = i_Table.rows.length-1;

            var i_check = jskfn.getName("tablecheck");

            for(var i=0;i<row_num;i++)
            {
                if(i_check[i].checked==true && i==0)
                {
                    return;
                }
                else if(i_check[i].checked==true && i>0)
                {
                    fn_table_swap(i+1, i);
                }
            }
        }
        else if(flag=="down")
        {
            var i_Table = jskfn.getId("list_table").children[0];
            var row_num = i_Table.rows.length-1;

            var i_check = jskfn.getName("tablecheck");

            for(var i=row_num-1;i>=0;i--)
            {
                if(i_check[i].checked==true && i==row_num-1)
                {
                    return;
                }
                else if(i_check[i].checked==true && i<row_num-1)
                {
                    fn_table_swap(i+2, i+1);
                }
            }
        }
    }

    function fn_table_swap(row1, row2)
    {
        var i_table = jskfn.getId("list_table").children[0];
        var i_row1 = i_table.rows[row1];
        var i_row2 = i_table.rows[row2];

        i_table.insertBefore(i_row1,i_row2);
    };


</script>
</body>
</html>