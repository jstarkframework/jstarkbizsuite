package home.notice;

import org.jstark.framework.core.hs.Txt;
import org.jstark.framework.core.hs.UserBean;
import org.jstark.framework.web.JStarkUser;
import org.jstark.framework.web.annotation.Link;
import org.jstark.framework.web.annotation.Control;
import org.jstark.utils.DateUtils;

import jstark.platform.PlatformChannel;

@Control({Control.LOGIN})
public class NoticeAction extends PlatformChannel
{
    public Boolean StartMethod() throws Exception
    {
        return new Boolean(true);
    }

    public void FinishMethod() throws Exception
    {
    }

    @Link("/notice/notice.do")
    public void doNotice() throws Exception
    {
        Txt txt = new Txt();

        txt.a("<script>");

        UserBean user = JStarkUser.getUser();

//        if(DateUtils.isTerm("200702201358", "201402201358"))
//        if("AAAA".equals(user.id))
//        if("100".equals(user.client))
//        if(MenuUtils.isAuth(ro, MenuUtils.GCODE, false, "G20070220AAAAAAAAAAAARA"))

        if(DateUtils.isTerm("200702201358", "201402201358") && "100".equals(user.client))
        {
            String n_no="20070220";
            String width="500";
            String height="370";
            String top="10";
            String left="10";

            if(!"cls".equals(ro.getCookie("jskn"+n_no)))
            {
                txt.a(" window.open(\"/notice/notice_page1.do?n_no="+n_no+"\", \"jsknp"+n_no+"\", \"width="+width+"px, height="+height+"px, top="+top+", left="+left+", toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=no,resizable=no\");");
            }
        }

        txt.a("</script>");

        toPrint(txt);
    }

    @Link("/notice/notice_close.do")
    public void doClose() throws Exception
    {
        Txt txt = new Txt();

        ro.setCookie("jskn"+ro.getString("n_no"), "cls", 24*24*60);

        txt.a("<script>top.close();</script>");

        toPrint(txt);
    }

    @Link("/notice/notice_page1.do")
    public void doNoticePage1() throws Exception
    {
        toView("/WEB-INF/jsp/home/notice/notice_page1.jsp");
    }
}