package home.example.ui;

import org.jstark.framework.web.annotation.Control;
import org.jstark.framework.web.annotation.Link;

import jstark.platform.PlatformChannel;

@Control({Control.LOGIN})
public class UIAction  extends PlatformChannel
{
    @Override
    public Boolean StartMethod() throws Exception
    {
        return new Boolean(true);
    }

    @Override
    public void FinishMethod() throws Exception
    {
    }

    @Link("/example/ui/ui_add.do")
    public String doUIAdd() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_add.jsp";
    }

    @Link("/example/ui/ui_list_header_scroll.do")
    public String doUIListHeaderScroll() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_header_scroll.jsp";
    }

    @Link("/example/ui/ui_list_header_scroll_resize.do")
    public String doUIListHeaderScrollResize() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_header_scroll_resize.jsp";
    }

    @Link("/example/ui/ui_list_iframe_scroll.do")
    public String doUIListIframeScroll() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_iframe_scroll.jsp";
    }

    @Link("/example/ui/ui_list_iframe_data.do")
    public String doUIListIframeData() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_iframe_data.jsp";
    }

    @Link("/example/ui/ui_list_iframe_scroll_resize.do")
    public String doUIListIframeScrollResize() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_iframe_scroll_resize.jsp";
    }

    @Link("/example/ui/ui_list_iframe_data_resize.do")
    public String doUIListIframeDataResize() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_iframe_data_resize.jsp";
    }

    @Link("/example/ui/ui_list_more.do")
    public String doUIListMore() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_more.jsp";
    }

    @Link("/example/ui/ui_list_scroll.do")
    public String doUIListScroll() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_scroll.jsp";
    }

    @Link("/example/ui/ui_list_scroll_resize.do")
    public String doUIListScrollResize() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_scroll_resize.jsp";
    }

    @Link("/example/ui/ui_list_search.do")
    public String doUIListSearch() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_search.jsp";
    }

    @Link("/example/ui/ui_list_small.do")
    public String doUIListSmall() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_small.jsp";
    }

    @Link("/example/ui/ui_list.do")
    public String doUIList() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list.jsp";
    }

    @Link("/example/ui/ui_list_resize.do")
    public String doUIListResize() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_resize.jsp";
    }

    @Link("/example/ui/ui_list_color.do")
    public String doUIListColor() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_list_color.jsp";
    }

    @Link("/example/ui/ui_tab.do")
    public String doUITab() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_tab.jsp";
    }

    @Link("/example/ui/ui_view.do")
    public String doUIView() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_view.jsp";
    }

    @Link("/example/ui/ui_button.do")
    public String doUIButton() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_button.jsp";
    }

    @Link("/example/ui/ui_message.do")
    public String doUIMessage() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_message.jsp";
    }

    @Link("/example/ui/ui_message2.do")
    public String doUIMessage2() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_message2.jsp";
    }

    @Link("/example/ui/ui_table_search.do")
    public String doUITableSearch() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_table_search.jsp";
    }

    @Link("/example/ui/ui_table_sort.do")
    public String doUITableSort() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_table_sort.jsp";
    }

    @Link("/example/ui/ui_step.do")
    public String doUITableStep() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_step.jsp";
    }

    @Link("/example/ui/ui_change_layout.do")
    public String doUIChangeLayout() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_change_layout.jsp";
    }

    @Link("/example/ui/ui_item.do")
    public String doUIItem() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/ui/ui_item.jsp";
    }

}
