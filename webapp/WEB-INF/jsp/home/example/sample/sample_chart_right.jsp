<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/header.jsp" flush="false" />
</head>
<body class="jskui_body_white">

<table name="jskid_chart_grid" id="jskid_chart_grid" class="jskui_chart">
<tr><td colspan="2" class="jskui_chart_th_top" id="jskid_chart_title"></td></tr>
<tr><td class="jskui_chart_th" id="jskid_chart_lv5"></td><td class="jskui_chart_td"></td></tr>
<tr><td class="jskui_chart_th" id="jskid_chart_lv4"></td><td class="jskui_chart_td_gray"></td></tr>
<tr><td class="jskui_chart_th" id="jskid_chart_lv3"></td><td class="jskui_chart_td"></td></tr>
<tr><td class="jskui_chart_th" id="jskid_chart_lv2"></td><td class="jskui_chart_td_gray"></td></tr>
<tr><td class="jskui_chart_th" id="jskid_chart_lv1"></td><td class="jskui_chart_td"></td></tr>
<tr><td class="jskui_chart_th_bottom">0</td><td></td></tr>
</table>
<script type="text/javascript">

    window.onload = function()
    {
        fn_make_chart();
    };

    function fn_make_chart()
    {
        jskfn_chart("Count",jskfn_chart_ceil(11230),10,30,260,50,1,"");

        jskfn_chart_init("S");
        jskfn_chart_draw(5000,jskfn_comma("5000"),"Airplane:5,000",jskfn_chart_color(10));
        jskfn_chart_draw(3000,"3,000","Bike:3,000","");
        jskfn_chart_draw(2000,"2,000","Motorcycle:2,000","");
        jskfn_chart_label("JUL");

        jskfn_chart_init("S");
        jskfn_chart_draw(1500,"1,500","Car:1,500","");
        jskfn_chart_draw(6000,"6,000","Bike:6,000","");
        jskfn_chart_draw(4000,"4,000","Motorcycle:4,000","");
        jskfn_chart_label("AUG");

        jskfn_chart_init("S");
        jskfn_chart_draw(11230,"11,230","Car:11,230","");
        jskfn_chart_draw(5500,"5,500","Bike:5,500","");
        jskfn_chart_draw(100,"1,000","Motorcycle:1,000","");
        jskfn_chart_label("SEP");

        jskfn_chart_grid();
    };

</script>
</body>
</html>