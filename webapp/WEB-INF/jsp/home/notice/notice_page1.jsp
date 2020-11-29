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
<input type="hidden" name="n_no" id="n_no" value="<%=ro.getString("n_no")%>" />

<div class="jskui_header">
    <div class="jskui_header_title">Notice</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">

    Hello!! This is notice page.

    </div>
    <div class="jskui_group jskui_right">

    <input type="checkbox" name="ck_close" id="ck_close" value="" class="jskui_style_checkbox" onclick="fn_close();" />
    <label for="ck_close" class="jskui_style_checkbox_label">Don't show me only today.</label>

    </div>

</div>
</form>
<script type="text/javascript">

    function fn_close()
    {
        document.jskform.action = jskfn_open_url("/notice/notice_close.do");
        jskfn_document(document.jskform);
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>