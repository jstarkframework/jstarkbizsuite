<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<%

    ro = HttpRequest.getObject(request, response);

    //ro.setSession("jsk_client", "100");
    //ro.setSession("jsk_client", "200");
    
%><script type="text/javascript">
    top.location="<%=ro.getDomain()%><%=CoreUtils.getContext()%>/platform/index.do";
</script>