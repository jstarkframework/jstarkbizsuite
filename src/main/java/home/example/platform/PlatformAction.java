package home.example.platform;

import org.jstark.framework.core.DData;
import org.jstark.framework.core.DList;
import org.jstark.framework.core.hs.UserBean;
import org.jstark.framework.web.JStarkUser;
import org.jstark.framework.web.annotation.Control;
import org.jstark.framework.web.annotation.Link;
import org.jstark.platform.core.CodeUtils;
import org.jstark.platform.core.TreeUtils;
import org.jstark.platform.core.UserUtils;

import jstark.platform.PlatformChannel;

@Control({Control.LOGIN})
public class PlatformAction extends PlatformChannel
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

    @Link("/example/platform/platform_tab_list.do")
    public String doPlatformTabList() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_tab_list.jsp";
    }

    @Link("/example/platform/platform_tab_view.do")
    public String doPlatformTabView() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_tab_view.jsp";
    }

    @Link("/example/platform/platform_alert.do")
    public String doPlatformAlert() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_alert.jsp";
    }

    @Link("/example/platform/platform_lang.do")
    public String doPlatformLang() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_lang.jsp";
    }

    @Link("/example/platform/platform_timezone.do")
    public String doPlatformTimeZone() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_timezone.jsp";
    }

    @Link("/example/platform/platform_code_list.do")
    public String doPlatformCodeList() throws Exception
    {
        DList list = CodeUtils.getCodeListName("LANGUAGE");

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/platform/platform_code_list.jsp";
    }

    @Link("/example/platform/platform_tree_list.do")
    public String doPlatformTreeList() throws Exception
    {
        DList list = TreeUtils.getTreeList("TR20140409AAAAAAAACFLFWY");

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/platform/platform_tree_list.jsp";
    }

    @Link("/example/platform/platform_user_view.do")
    public String doPlatformUserView() throws Exception
    {
        //jstark_user_info 테이블 정보
        DData userdata = UserUtils.getUser();
        //jstark_user 테이블 정보
        DData userinfo = UserUtils.getUserInfo();
        //로그인 세션
        UserBean user = JStarkUser.getUser();

        addModel("userdata", userdata);
        addModel("userinfo", userinfo);
        addModel("user", user);

        return "view:/WEB-INF/jsp/home/example/platform/platform_user_view.jsp";
    }

    @Link("/example/platform/platform_confirm.do")
    public String doPlatformConfirm() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_confirm.jsp";
    }

    @Link("/example/platform/platform_input.do")
    public String doPlatformInput() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_input.jsp";
    }

    @Link("/example/platform/platform_frame.do")
    public String doPlatformFrame() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_frame.jsp";
    }

    @Link("/example/platform/platform_frame_view.do")
    public String doPlatformFrameView() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_frame_view.jsp";
    }

    @Link("/example/platform/platform_direct_url.do")
    public String doPlatformDirectUrl() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/platform/platform_direct_url.jsp";
    }
}
