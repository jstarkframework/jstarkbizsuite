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
    <div class="jskui_header_title">Add</div>
    <div class="jskui_header_sub"></div>
</div>
<div class="jskui_main">
    <div class="jskui_button_bar">
        <button type="button" onclick="; return false;">Button</button>
    </div>
    <div class="jskui_group">
	    <table class="jskui_table jskui_nostripe_y">
	    <tr>
	    <th width="120" class="jskui_left">Column 1<div class="jskui_required" title="Required field"></div></th>
	    <td class="jskui_left"><input type="text" name="item1" id="item1" value="" style="width:100%" /></td>
	    </tr>
	    <tr>
	    <th class="jskui_left">Column 2<div class="jskui_required" title="Required field"></div></th>
	    <td><input type="text" name="item2" id="item2" value="" style="width:100%" /></td>
	    </tr>
	    <tr>
	    <th class="jskui_left">Column 3<div class="jskui_required" title="Required field"></div></th>
	    <td><input type="text" name="item3" id="item3" value="" style="width:100%" /></td>
	    </tr>
	    <tr>
	    <th class="jskui_left">RADIO</th>
	    <td class="jskui_left">

			<input type="radio" name="rd" id="rd_1" value="A" class="jskui_style_radio" checked="checked" />
			<label for="rd_1" class="jskui_style_radio_label">Select 1</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="rd" id="rd_2" value="B" class="jskui_style_radio" />
			<label for="rd_2" class="jskui_style_radio_label">Select 2</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="rd" id="rd_3" value="C" class="jskui_style_radio" />
			<label for="rd_3" class="jskui_style_radio_label">Select 3</label>

	    </td>
	    </tr>
	    <tr>
	    <th class="jskui_left">CHECKBOX</th>
	    <td class="jskui_left">

			<input type="checkbox" name="ck" id="ck_1" value="A" class="jskui_style_checkbox" checked="checked" />
			<label for="ck_1" class="jskui_style_checkbox_label">Select 1</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="ck" id="ck_2" value="B" class="jskui_style_checkbox" />
			<label for="ck_2" class="jskui_style_checkbox_label">Select 2</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="ck" id="ck_3" value="C" class="jskui_style_checkbox" />
			<label for="ck_3" class="jskui_style_checkbox_label">Select 3</label>

	    </td>
	    </tr>
	    <tr>
	    <th class="jskui_left">ReadOnly</th>
	    <td class="jskui_left"><input type="text" name="ronly" id="ronly" value="readonly" style="width:100%" maxlength="50" readonly="readonly" /></td>
	    </tr>
	    <tr>
        <th class="jskui_left">Disable</th>
        <td class="jskui_left"><input type="text" name="dable" id="dable" value="Disable" style="width:100%" maxlength="50" disabled="disabled" /></td>
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
    };

</script>
<jsp:include page="/WEB-INF/jsp/jstark/platform/include/footer.jsp" flush="false" />
</body>
</html>