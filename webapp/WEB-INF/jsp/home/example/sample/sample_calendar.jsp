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

<div class="jskui_header">
    <div class="jskui_header_title">Calendar</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    <table class="jskui_table jskui_nostripe_y">
    <tr>
    <th width="100">Calendar</th>
    <td class="jskui_left">
       <input type="text" name="sdt" id="sdt" value="<%=DateUtils.getTime("yyyy-MM-dd")%>" class="jskui_calendar_style" onclick="jskfn_calendar_init(this);" readonly="readonly" />
       ~
       <input type="text" name="edt" id="edt" value="<%=DateUtils.getTime("yyyy-MM-dd")%>" class="jskui_calendar_style" onclick="jskfn_calendar_init(this);" readonly="readonly" /></td>
    </tr>
    <tr>
    <th width="100">Calendar clear</th>
    <td class="jskui_left">
       <input type="text" name="sdt" id="sdt" value="<%=DateUtils.getTime("yyyy-MM-dd")%>" class="jskui_calendar_style" onclick="fn_calendar_clear(true);jskfn_calendar_init(this);fn_calendar_clear(false);" readonly="readonly" />
       ~
       <input type="text" name="edt" id="edt" value="<%=DateUtils.getTime("yyyy-MM-dd")%>" class="jskui_calendar_style" onclick="fn_calendar_clear(true);jskfn_calendar_init(this);fn_calendar_clear(false);" readonly="readonly" /></td>
    </tr>
    <tr>
    <th width="100">Time</th>
    <td class="jskui_left">
       <input type="text" name="time" id="time" value="<%=DateUtils.getTime("HH:mm:ss")%>" class="jskui_time_style3" onclick="jskfn_time_init(this);" readonly="readonly" />
    </td>
    </tr>
    <tr>
    <th width="100">Month</th>
    <td class="jskui_left">
       <input type="text" name="smonth" id="smonth" value="<%=DateUtils.getTime("yyyy-MM")%>" class="jskui_month_style" onclick="jskfn_month_init(this);" readonly="readonly" />
       ~
       <input type="text" name="emonth" id="emonth" value="<%=DateUtils.getTime("yyyy-MM")%>" class="jskui_month_style" onclick="jskfn_month_init(this);" readonly="readonly" />
    </td>
    </tr>
    <tr>
    <th width="100">Year</th>
    <td class="jskui_left">
       <input type="text" name="i_year" id="i_year" value="<%=DateUtils.getTime("yyyy")%>" class="jskui_year_style" onclick="jskfn_year_init(this);" readonly="readonly" />
    </td>
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
<script type="text/javascript">

    window.onload = function()
    {
        try{parent.jskfn_offloading();}catch(e){}

        //calendar_fix="-";
        jskvar_time_type=3;
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    function jskfn_calendar()
    {
        jskfn_calendar_link(2,jskvar_calendar_name,"sdt","edt");

        if(jskvar_calendar_name=="sdt")
        {
            parent.jskfn_alert("Select start date");
        }
        else if(jskvar_calendar_name=="edt")
        {
            parent.jskfn_alert("Select end date");
        }
    };

    function jskfn_month()
    {
        jskfn_calendar_link(1,jskvar_month_name,"smonth","emonth");

        if(jskvar_month_name=="smonth")
        {
            parent.jskfn_alert("Select start month");
        }
        else if(jskvar_month_name=="emonth")
        {
            parent.jskfn_alert("Select end month");
        }
    };

    function jskfn_year()
    {
        if(jskvar_year_name=="i_year")
        {
            parent.jskfn_alert("Select year");
        }
    };
    
    function fn_calendar_clear(flag)
    {
        jskvar_calendar_clear=flag;  
    };

</script>
</body>
</html>