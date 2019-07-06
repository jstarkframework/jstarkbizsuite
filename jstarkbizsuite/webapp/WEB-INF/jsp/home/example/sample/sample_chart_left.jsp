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
        jskfn_chart_label_add("jskid_chart_label","Car");
        jskfn_chart_label_add("jskid_chart_label","Bike");
        jskfn_chart_label_add("jskid_chart_label","Motorcycle");
        jskfn_chart_label_add("jskid_chart_label","Airplane");

        fn_make_chart();
    };

    window.onerror = function(msg,url,line)
    {
        try{jskfn_error(msg,url,line);}catch(e){}
    };

    window.onresize = function()
    {
        jskfn_chart_grid();
    };

    function fn_make_chart()
    {
        jskfn_chart("Ratio",100,10,40,260,30,0,"%");

        jskfn_chart_init("M");
        jskfn_chart_draw(27,"27%","Motorcycle,27%",jskfn_chart_color(2));
        jskfn_chart_draw(40,"40%","Bike,40%",jskfn_chart_color(1));
        jskfn_chart_draw(33,"33%","Car,33%",jskfn_chart_color(0));
        jskfn_chart_label("JUL");

        jskfn_chart_init("M");
        jskfn_chart_draw(10,"10%","Motorcycle,10%",jskfn_chart_color(2));
        jskfn_chart_draw(80,"80%","Bike,80%",jskfn_chart_color(1));
        jskfn_chart_draw(10,"10%","Car,10%",jskfn_chart_color(0));
        jskfn_chart_label("AUG");

        jskfn_chart_init("M");
        jskfn_chart_draw(63,"63%","Motorcycle,63%",jskfn_chart_color(2));
        jskfn_chart_draw(25,"25%","Bike,25%",jskfn_chart_color(1));
        jskfn_chart_draw(13,"13%","Car,13%",jskfn_chart_color(0));
        jskfn_chart_label("SEP");

        jskfn_chart_init("M");
        jskfn_chart_draw(10,"10%","Airplane,10%",jskfn_chart_color(3));
        jskfn_chart_draw(64,"64%","Motorcycle,64%",jskfn_chart_color(2));
        jskfn_chart_draw(5,"5%","Bike,5%",jskfn_chart_color(1));
        jskfn_chart_draw(21,"21%","Car,21%",jskfn_chart_color(0));
        jskfn_chart_label("OCT");

        jskfn_chart_grid();
    };

</script>
</body>
</html>