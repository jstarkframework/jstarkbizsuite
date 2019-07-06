package jstark.platform;

import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.DList;
import org.jstark.framework.core.RequestObject;

/** 페이징, 탭, 정렬 등의 UI Util
 *
 * @author jstark
 *
 */
public class HtmlUtils
{
    public static final String ICO_FIRST="/web/jstark/platform/img/jskimg_page_first.gif";
    public static final String ICO_PREV="/web/jstark/platform/img/jskimg_page_prev.gif";
    public static final String ICO_BAR="/web/jstark/platform/img/jskimg_page_line.gif";
    public static final String ICO_NEXT="/web/jstark/platform/img/jskimg_page_next.gif";
    public static final String ICO_END="/web/jstark/platform/img/jskimg_page_end.gif";

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다.
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), 10, true, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (자바스크립트 function 지정)
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @param function_name 자바스크립트 function명
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list, String function_name)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), 10, true, function_name);
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용)
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list, boolean option)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), 10, option, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용) (자바스트립트 function 지정)
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @param function_name 자바스크립트 function명
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list, boolean option, String function_name)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), 10, option, function_name);
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다.
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @param page_list_count 가로 목록수
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list, int page_list_count)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), page_list_count, true, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (자바스크립트 function 지정)
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @param page_list_count 가로 목록수
     * @param function_name 자바스크립트 function명
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list, int page_list_count, String function_name)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), page_list_count, true, function_name);
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용)
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @param page_list_count 가로 목록수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list, int page_list_count, boolean option)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), page_list_count, option, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용) (js-function 지정)
     *
     * @param list DList, list.getTotalCount():전체갯수, list.getPage():페이지번호, list.getPageRow():한페이지당갯수
     * @param page_list_count 가로 목록수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @param function_name js-function명
     * @return String 페이징 HTML
     */
    public static String getPageList(DList list, int page_list_count, boolean option, String function_name)
    {
        return getPageList(list.getTotalCount(), list.getPage(), list.getPageRow(), page_list_count, option, function_name);
    }


    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다.
     *
     * @param ro RequestObject, 전체갯수, 페이지번호, 한페이지당갯수
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), 10, true, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (자바스크립트 function 지정)
     *
     * @param ro RequestObject
     * @param function_name 자바스크립트 function명
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro, String function_name)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), 10, true, function_name);
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용)
     *
     * @param ro RequestObject, 전체갯수, 페이지번호, 한페이지당갯수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro, boolean option)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), 10, option, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용) (자바스트립트 function 지정)
     *
     * @param ro RequestObject, 전체갯수, 페이지번호, 한페이지당갯수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @param function_name 자바스크립트 function명
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro, boolean option, String function_name)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), 10, option, function_name);
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다.
     *
     * @param ro RequestObject, 전체갯수, 페이지번호, 한페이지당갯수
     * @param page_list_count 가로 목록수
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro, int page_list_count)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), page_list_count, true, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (자바스크립트 function 지정)
     *
     * @param ro RequestObject, 전체갯수, 페이지번호, 한페이지당갯수
     * @param page_list_count 가로 목록수
     * @param function_name 자바스크립트 function명
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro, int page_list_count, String function_name)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), page_list_count, true, function_name);
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용)
     *
     * @param ro RequestObject, 전체갯수, 페이지번호, 한페이지당갯수
     * @param page_list_count 가로 목록수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro, int page_list_count, boolean option)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), page_list_count, option, "fn_page");
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다. (옵션적용) (js-function 지정)
     *
     * @param ro RequestObject, 전체갯수, 페이지번호, 한페이지당갯수
     * @param page_list_count 가로 목록수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @param function_name js-function명
     * @return String 페이징 HTML
     */
    public static String getPageList(RequestObject ro, int page_list_count, boolean option, String function_name)
    {
        return getPageList(ro.getInt("jskroot_list_count"), ro.getInt("jskroot_list_page"), ro.getInt("jskroot_list_page_row"), page_list_count, option, function_name);
    }

    /** 페이징처리를 한 뒤 HTML 형태로 리턴합니다.
     *
     * @param total_count 전체갯수
     * @param page 페이지 번호
     * @param page_row 세로 목록수
     * @param page_col 가로 페이지 수
     * @param option 이전, 다음 기본 표시 유무. true:보임, false:안보임
     * @param function_name 자바스크립트 function명
     * @return String 페이징 HTML
     */
    public static String getPageList(int total_count, int page, int page_row, int page_col, boolean option, String function_name)
    {
        StringBuilder return_string=new StringBuilder();

        if(total_count>0 && page_row>0)
        {
            String jcontext = CoreUtils.getContext();

            if(total_count>page_row || option)
            {
                int link_count=0;
                if((total_count+page_row)<(page*page_row))
                {
                    return_string.append("-");
                }
                else
                {
                    int all_page=0;
                    all_page=total_count/page_row;
                    if(total_count%page_row !=0)
                    {
                        all_page++;
                    }

                    if (all_page==0) all_page=1;

                    int start_page_list_count=0;
                    int end_page_list_count=0;
                    if(page>page_col)
                    {
                        start_page_list_count=page/page_col;
                        if(page%page_col==0)
                        {
                            start_page_list_count--;
                        }
                    }
                    else
                    {
                        start_page_list_count=0;
                    }
                    link_count=(start_page_list_count*page_col);

                    return_string.append("<table class=\"jskui_page\">");
                    return_string.append("<tr>");
                    return_string.append("<td class=\"jskui_page_img\" onclick=\""+function_name+"(1); return false;\"><img src=\""+jcontext+ICO_FIRST+"\"/></td>");

                    if(page>page_col)
                    {
                        return_string.append("<td class=\"jskui_page_img\" onclick=\""+function_name+"("+link_count+"); return false;\"><img src=\""+jcontext+ICO_PREV+"\"/></td>");
                    }
                    else
                    {
                        return_string.append("<td class=\"jskui_page_img\" onclick=\""+function_name+"(1); return false;\"><img src=\""+jcontext+ICO_PREV+"\"/></td>");
                    }

                    for(int i=1;i<=page_col;i++)
                    {
                        if((start_page_list_count*page_col)+i<=all_page)
                        {
                            end_page_list_count=(start_page_list_count*page_col)+i;
                            link_count=end_page_list_count;

                            if(i!=1)
                            {
                                return_string.append("<td class=\"jskui_page_bar\"><img src=\""+jcontext+ICO_BAR+"\"/></td>");
                            }
                            if(end_page_list_count==page)
                            {
                                return_string.append("<td class=\"jskui_page_td jskui_page_now\" onclick=\""+function_name+"("+link_count+"); return false;\">"+link_count+"</td>");
                            }
                            else
                            {
                                return_string.append("<td class=\"jskui_page_td\" onclick=\""+function_name+"("+link_count+"); return false;\">"+link_count+"</td>");
                            }
                        }
                        else
                        {
                            break;
                        }
                    }

                    if(all_page>end_page_list_count)
                    {
                        link_count=end_page_list_count+1;
                        return_string.append("<td class=\"jskui_page_img\" onclick=\""+function_name+"("+link_count+"); return false;\"><img src=\""+jcontext+ICO_NEXT+"\"/></td>");
                    }
                    else
                    {
                        return_string.append("<td class=\"jskui_page_img\" onclick=\""+function_name+"("+all_page+"); return false;\"><img src=\""+jcontext+ICO_NEXT+"\"/></td>");
                    }

                    return_string.append("<td class=\"jskui_page_img\" onclick=\""+function_name+"("+all_page+"); return false;\"><img src=\""+jcontext+ICO_END+"\"/></td>");
                    return_string.append("</tr>");
                    return_string.append("</table>");

                }
            }
        }
        else
        {

        }

        return return_string.toString();
    }

    /** 탭 HTML을 리턴합니다.
     *
     * @param ro RequestObject
     * @param list DList
     * @param br_flag BR Tag 유무
     * @return String TAB HTML
     */
    public static String getTabList(RequestObject ro, DList list, boolean br_flag)
    {
        return getTabList(ro, list, "fn_tab", "j_tab", br_flag, 150);
    }

    /** 탭 HTML을 리턴합니다.
     *
     * @param ro RequestObject
     * @param list DList
     * @param jsfunction 자바스크립트명
     * @param tabparam Parameter Name
     * @param br_flag BR Tag 유무
     * @return String TAB HTML
     */
    public static String getTabList(RequestObject ro, DList list, String jsfunction, String tabparam, boolean br_flag)
    {
        return getTabList(ro, list, jsfunction, tabparam, br_flag, 150);
    }

    /** 탭 HTML을 리턴합니다.
     *
     * @param ro RequestObject
     * @param list DList
     * @param br_flag BR Tag 유무
     * @param width 탭 가로 사이즈
     * @return String TAB HTML
     */
    public static String getTabList(RequestObject ro, DList list, boolean br_flag, int width)
    {
        return getTabList(ro, list, "fn_tab", "j_tab", br_flag, width);
    }

    /** 탭 HTML을 리턴합니다.
     *
     * @param ro RequestObject
     * @param list DList
     * @param jsfunction 자바스크립트명
     * @param tabparam Parameter Name
     * @param br_flag BR Tag 유무
     * @param width 탭 가로 사이즈
     * @return String TAB HTML
     */
    public static String getTabList(RequestObject ro, DList list, String jsfunction, String tabparam, boolean br_flag, int width)
    {
        StringBuilder value=new StringBuilder();

        if(list!=null && list.size()>0)
        {
            if(br_flag)
            {
                value.append("<div class=\"jskui_tab_group jskui_tab_group_br\">");
            }
            else
            {
                value.append("<div class=\"jskui_tab_group\">");
            }

            String width_str="";
            String[] avalue;

            for(int i=0,j=list.size();i<j;i++)
            {
                avalue=(String[])list.get(i);

                if(width>0)
                {
                    width_str="style=\"width:"+width+"px\"";
                }

                if(ro.equals(tabparam,avalue[1]))
                {
                    value.append("<div class=\"jskui_tab_item jskui_tab_item_selected\" "+width_str+" onclick=\""+jsfunction+"('"+avalue[1]+"');\">"+avalue[0]+"</div>");
                }
                else
                {
                    value.append("<div class=\"jskui_tab_item\" "+width_str+" onclick=\""+jsfunction+"('"+avalue[1]+"');\">"+avalue[0]+"</div>");
                }
            }

            value.append("</div>");
        }

        return value.toString();
    }

    /** 정렬 HTML을 리턴합니다.
     *
     * @param ro RequestObject
     * @param name 정렬칼럼명
     * @return String SORT HTML
     */
    public static String sort(RequestObject ro, String name)
    {
        String jcontext = CoreUtils.getContext();

        String value="<img src='"+jcontext+"/web/jstark/platform/img/jskimg_sort.gif' width='9' height='12' alt='sort' />";

        if(ro.equals("jskvar_sort",name))
        {
            if(ro.equals("jskvar_sort_type","asc"))
            {
                value="<img src='"+jcontext+"/web/jstark/platform/img/jskimg_sort_asc.gif' width='9' height='12' alt='sort' />";
            }
            else if(ro.equals("jskvar_sort_type","desc"))
            {
                value="<img src='"+jcontext+"/web/jstark/platform/img/jskimg_sort_desc.gif' width='9' height='12' alt='sort' />";
            }
        }

        return value;
    }

    /** 장비 종류를 리턴합니다.
     *
     * @param useragent 브라우저 Agent
     * @return String P:PC, M:Mobile 리턴
     */
    public static String getClientDevice(String useragent)
    {
        String agenttype="P"; //P:PC, M:Mobile

        useragent=useragent.toLowerCase();

        if(useragent!=null && (useragent.indexOf("android")>-1 || useragent.indexOf("iphone")>-1))
        {
            agenttype="M";
        }

        return agenttype;
    }

}