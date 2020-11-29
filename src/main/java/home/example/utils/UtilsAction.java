package home.example.utils;

import org.jstark.framework.web.annotation.Link;

import jstark.platform.PlatformChannel;

public class UtilsAction extends PlatformChannel
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

    @Link("/example/utils/win_popup.do")
    public String doWinPoup() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/utils/win_popup.jsp";
    }
}