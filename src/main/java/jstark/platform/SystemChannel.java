package jstark.platform;

import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.RequestObject;
import org.jstark.framework.core.hs.Txt;
import org.jstark.framework.core.hs.UserBean;
import org.jstark.framework.web.JStarkAction;
import org.jstark.framework.web.JStarkSecurity;

/** 시스템 관리자 권한체크를 위한 Channel, CONSOLE, SCHEDULE, SDK, EXAMPLE 에서 사용.
 *
 * @author jstark
 *
 */
public class SystemChannel extends JStarkAction
{
    /** Action이 실행될때 호출되는 Method, false가 리턴되면 Action의 실행이 중단됩니다.
     *
     */
    @Override
    public final Boolean StartAction() throws Exception
    {
        if(isError())
        {
            Txt txt = new Txt();

            txt.an("<script type=\"text/javascript\">");
            txt.an("alert('"+PlatformMessage.getErrorMessage(ro, getError())+"');");
            txt.an("</script>");

            toPrint(txt);

            return new Boolean(false);
        }
        else
        {
            boolean authority=admincheck(ro);

            if(!authority)
            {
                Txt txt = new Txt();

                txt.an("<script type=\"text/javascript\">");
                txt.an(" top.location='"+CoreUtils.getContext()+"/platform/login.do'; ");
                txt.an("</script>");

                toPrint(txt);
            }

            return new Boolean(authority);//fixed
        }
    }

    /** doMethod가 실행될때 호출되는 Method, false가 리턴되면 doMethod의 실행이 중단됩니다.
     *
     */
    @Override
    public Boolean StartMethod() throws Exception
    {
        return new Boolean(true);
    }

    /** doMethod가 종료될때 호출되는 Method
     *
     */
    @Override
    public void FinishMethod() throws Exception
    {

    }

    /** Action이 종료될때 호출되는 Method
     *
     */
    @Override
    public final void FinishAction() throws Exception
    {

    }

    private boolean admincheck(RequestObject ro)
    {
        String value="";

        value = ro.getSession("jstark_session");

        try
        {
            UserBean user;
            user = JStarkSecurity.getJstarkSession(value);
            value=user.id;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        if("JSTARK".equals(value))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
