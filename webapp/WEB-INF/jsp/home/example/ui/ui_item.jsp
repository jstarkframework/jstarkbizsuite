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
    <div class="jskui_header_title">Item</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">

    <div class="jskui_group">
    
	    <div class="jskui_item_container">
	
	    <div class="jskui_item_group">
	        <div class="jskui_item_title"><span class="required">*</span> Name</div>
	        <div class="jskui_item_body"><input type="text" style="width:100%" /></div>
	    </div>
	    
	    <div class="jskui_item_group">
	        <div class="jskui_item_title"><span class="required">*</span> Birthday</div>
	        <div class="jskui_item_body">    
	            <input type="text" name="bdate" id="bdate" value="<%=DateUtils.getTime("yyyy-MM-dd")%>" class="jskui_calendar_style" onclick="jskfn_calendar_init(this);" readonly="readonly" />
	        </div>
	    </div>
	    
	    <div class="jskui_item_group">
	        <div class="jskui_item_title">Address</div>
	        <div class="jskui_item_body">
	            <div style="float:left;width:100px;padding:1px;"><input type="text" style="width:100%;text-align:center" value="" readonly="readonly" /></div>
	            <div style="float:left;padding:1px;flex:1"><input type="text" style="width:100%" value="" readonly="readonly" /></div>
	            <div style="float:right;padding:1px;flex:2"><input type="text" style="width:100%" value="" readonly="readonly" /></div>
	        </div>
	    </div>
	    
	    <div class="jskui_item_group">
	        <div class="jskui_item_title"><span class="required">*</span> Parent</div>
	        <div class="jskui_item_body">
	            <div style="float:left;width:100px;padding:1px;"><input type="text" style="width:100%;text-align:center" value="" readonly="readonly" /></div>
	            <div style="float:left;padding:1px;flex:1"><input type="text" style="width:100%" value="" readonly="readonly" /></div>
	            <div style="float:right;padding:1px;flex:2"><input type="text" style="width:100%" value="" readonly="readonly" /></div>
	            <div style="float:right;width:32px;padding:1px;"><button class="jskui_search_button" onclick="" ></button></div>
	        </div>
	    </div>
	    
	    <div class="jskui_item_group">
	        <div class="jskui_item_title">Country</div>
	        <div class="jskui_item_body">
	            <div style="float:left;width:100px;padding:1px;"><input type="text" style="width:100%;text-align:center" value="" readonly="readonly" /></div>
	            <div style="float:right;padding:1px;flex:1"><input type="text" style="width:100%" value="" readonly="readonly" /></div>        
	        </div>
	    </div>
	        
	    <div class="jskui_item_group">
	        <div class="jskui_item_title">Age</div>
	        <div class="jskui_item_body">    
	            <div style="float:left;width:100px;padding:1px;"><input type="text" style="width:100%;text-align:center" value="" readonly="readonly" /></div>
	            <div style="float:left;padding:1px;flex:1"><input type="text" style="width:100%" value="" readonly="readonly" /></div>        
	            <div style="float:right;padding:1px;flex:1"><input type="text" style="width:100%" value="" placeholder="Age" /></div>        
	        </div>
	    </div>
	    
	    <div class="jskui_item_group">
	        <div class="jskui_item_title">Weight</div>
	        <div class="jskui_item_body"><input type="text" style="width:100%" value="" readonly="readonly" /></div>
	    </div>
	    
	    <div class="jskui_item_group">
	        <div class="jskui_item_title"></div>
	        <div class="jskui_item_body"></div>
	    </div>
    
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
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>