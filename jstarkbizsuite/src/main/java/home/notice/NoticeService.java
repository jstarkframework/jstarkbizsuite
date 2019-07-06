package home.notice;

import org.jstark.framework.core.JStarkService;
import org.jstark.framework.core.ServiceFactory;

public class NoticeService extends JStarkService
{
    public static NoticeService getInstance()
    {
        return (NoticeService) ServiceFactory.getInstance(NoticeService.class);
    }

}