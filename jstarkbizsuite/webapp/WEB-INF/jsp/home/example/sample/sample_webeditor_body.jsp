<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%
    String param=ro.getString("param");

    //Load Data METHOD
    String content="Web Editor Example";

%><!DOCTYPE html>
<html lang="ko">
<head>
<title>JSTARK WEB EDITOR</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta name="autocomplete" content="off" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" type="text/css" href="<%=jcontext%>/web/jstark/platform/css/jstark.min.css?<%=CoreUtils.getRevision()%>" />
<script type="text/javascript">

eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('1 4,2;1 g=3(){5(6.7){2=6.7();4=2.h(0)}8 4};1 j=3(a){2.k();2.l(a)};m.n=3(b){1 c=(b.9||b.o.9).p;1 d=f;q(1 i=0;i<c.r;i++){5(c[i].s.t("u")==0){d=c[i].v()}}5(d!==f){1 e=w x();e.y=3(a){z.A(a.B.C)};e.D(d)}8};',40,40,'|var|selection|function|range|if|window|getSelection|return|clipboardData||||||null|getRange|getRangeAt||setRange|removeAllRanges|addRange|document|onpaste|originalEvent|items|for|length|type|indexOf|image|getAsFile|new|FileReader|onload|parent|jskfn_webedit_insertimage|target|result|readAsDataURL'.split('|'),0,{}))

</script>
<style type="text/css">p{margin:0px auto;}body{padding:5px;}img{max-width:100%}</style>
</head>
<body onload="parent.jskfn_webedit_init();" class="jskui_body_white" style="height:100%"><%=content%></body>
</html>