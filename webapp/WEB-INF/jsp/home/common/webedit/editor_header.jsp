<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ include file = "/WEB-INF/jsp/jstark/platform/include/page.jsp" %>
<input name="jskid_webedit_forecolor" id="jskid_webedit_forecolor" type="hidden" value="" />
<input name="jskid_webedit_backcolor" id="jskid_webedit_backcolor" type="hidden" value="" />
<img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_1.gif" style="cursor:pointer;" name="bt1" id="bt1" width="20" height="23" onclick="jskfn_webedit_new();" alt="새글" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_5.gif" style="cursor:pointer;" name="bt5" id="bt5" width="20" height="23" onclick="jskfn_webedit_undo();" alt="실행취소" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_6.gif" style="cursor:pointer;" name="bt6" id="bt6" width="20" height="23" onclick="jskfn_webedit_redo();" alt="다시실행" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><select name="FontName" id="FontName" style="height:26px;font-size:12px;padding:0px" onchange="jskfn_webedit_fontname()">
 <option value="" selected></option>
 <option value="굴림">굴림</option>
 <option value="굴림체">굴림체</option>
 <option value="돋움">돋움</option>
 <option value="돋움체">돋움체</option>
 <option value="바탕">바탕</option>
 <option value="바탕체">바탕체</option>
 <option value="궁서">궁서</option>
 <option value="궁서체">궁서체</option>
 <option value="Nanum Gothic">Nanum Gothic</option>
 <option value="Verdana">Verdana</option>
 <option value="Arial">Arial</option>
 <option value="Tahoma">Tahoma</option>
 <option value="Courier New">Courier New</option>
 <option value="Times New Roman">Times New Roman</option>
 <option value="Wingdings">Wingdings</option>
</select><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><select name="FontSize" id="FontSize" style="width:50px;height:26px;font-size:12px;padding:0px;" onchange="jskfn_webedit_fontsize()">
 <option value="1">1</option>
 <option value="2" selected>2</option>
 <option value="3">3</option>
 <option value="4">4</option>
 <option value="5">5</option>
 <option value="6">6</option>
 <option value="7">7</option>
</select><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_8.gif" style="cursor:pointer;" name="id_bold" id="id_bold" onclick="jskfn_webedit_bold();" alt="굵게" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_9.gif" style="cursor:pointer;" name="id_italic" id="id_italic" onclick="jskfn_webedit_italic();" alt="이탤릭" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_10.gif" style="cursor:pointer;" name="id_underline" id="id_underline" onclick="jskfn_webedit_underline();" alt="밑줄" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_100.gif" style="cursor:pointer;" name="id_strikethrough" id="id_strikethrough" onclick="jskfn_webedit_strikethrough();" alt="가운데줄" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_11.gif" style="cursor:pointer;" name="id_forecolor" id="id_forecolor" onclick="jskfn_webedit_forecolor(this);" alt="글자색" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_12.gif" style="cursor:pointer;" name="id_backcolor" id="id_backcolor" onclick="jskfn_webedit_backcolor(this);" alt="배경색" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_28.gif" style="cursor:pointer;" name="id_left" id="id_left" onclick="jskfn_webedit_left();" alt="왼쪽정렬" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_29.gif" style="cursor:pointer;" name="id_center" id="id_center" onclick="jskfn_webedit_center();" alt="중앙정렬" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_30.gif" style="cursor:pointer;" name="id_right" id="id_right" onclick="jskfn_webedit_right();" alt="오른쪽정렬" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_22.gif" style="cursor:pointer;" name="id_orderedlist" id="id_orderedlist" onclick="jskfn_webedit_orderedlist();" alt="문단번호" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_23.gif" style="cursor:pointer;" name="id_unorderedlist" id="id_unorderedlist" onclick="jskfn_webedit_unorderedlist();" alt="글머리표" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_24.gif" style="cursor:pointer;" name="id_outdent" id="id_outdent" onclick="jskfn_webedit_outdent();" alt="왼쪽여백줄이기" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_25.gif" style="cursor:pointer;" name="id_indent" id="id_indent" onclick="jskfn_webedit_indent();" alt="오른쪽여백줄이기" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_3.gif" width="7" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_31.gif" style="cursor:pointer;" name="id_size1" id="id_size1" onclick="jskfn_webedit_size_change(1);" alt="편집창 크게" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_32.gif" style="cursor:pointer;" name="id_size2" id="id_size2" onclick="jskfn_webedit_size_change(2);" alt="편집창 작게" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_33.gif" style="cursor:pointer;" name="id_size_on" id="id_size_on" onclick="jskfn_webedit_auto_size_on();" alt="편집창을 내용에 맞게" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_bar_1.gif" width="2" height="23" /><%
%><img src="<%=jcontext%>/web/jstark/platform/img/editor/jskimg_webedit_btn_34.gif" style="cursor:pointer;" name="id_size_off" id="id_size_off" onclick="jskfn_webedit_auto_size_off();" alt="편집창 크기 최소" /><%
%><textarea name="jskvar_webedit_content" style="display:none;width:100%;height:295px;border:0px" id="jskvar_webedit_content"></textarea>