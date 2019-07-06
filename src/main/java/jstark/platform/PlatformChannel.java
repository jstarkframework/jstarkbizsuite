package jstark.platform;

import java.io.File;

import org.jstark.framework.core.DData;
import org.jstark.framework.core.JConfigEx;
import org.jstark.framework.core.hs.TrackingMap;
import org.jstark.framework.core.hs.Txt;
import org.jstark.framework.core.hs.UserBean;
import org.jstark.framework.web.JStarkAction;
import org.jstark.framework.web.JStarkUser;
import org.jstark.utils.JsonUtils;

/** Action 구현을 위한 Master Class, 공통 로직 구현
 *
 * @author jstark
 *
 */
public class PlatformChannel extends JStarkAction
{
    /** Action이 실행될때 호출되는 Method, false가 리턴되면 Action의 실행이 중단됩니다.
     *
     */
    @Override
    public final Boolean StartAction() throws Exception
    {
    	UserBean user = JStarkUser.getUser();
        if(user!=null)
        {
            TrackingMap.capture("P", "T", user.client, user.u_no, user.id);
        }

        if(isError())
        {
            Txt txt = new Txt();

            txt.an("<script type=\"text/javascript\">");

            txt.an("try");
            txt.an("{");
            txt.an("    var msg = '"+PlatformMessage.getErrorMessage(ro, getError())+"';");
            txt.an("    try");
            txt.an("    {");
            txt.an("        parent.parent.parent.jskfn_alert_red(msg);");
            txt.an("    }");
            txt.an("    catch(e1)");
            txt.an("    {");
            txt.an("        try");
            txt.an("        {");
            txt.an("            parent.parent.jskfn_alert_red(msg);");
            txt.an("        }");
            txt.an("        catch(e2)");
            txt.an("        {");
            txt.an("            try");
            txt.an("            {");
            txt.an("                parent.parent.jskfn_alert_red(msg);");
            txt.an("            }");
            txt.an("            catch(e2)");
            txt.an("            {");
            txt.an("                parent.jskfn_alert_red(msg);");
            txt.an("            }");
            txt.an("        }");
            txt.an("    }");
            txt.an("    try{parent.fn_submit_back();}catch(ee){}");
            txt.an("}");
            txt.an("catch(e)");
            txt.an("{");
            txt.an("    alert('"+PlatformMessage.getErrorMessage(ro, getError())+"');");
            txt.an("    try{parent.fn_submit_back();}catch(ee){}");
            txt.an("}");
            txt.an("</script>");

            toPrint(txt);

            return new Boolean(false);
        }
        else
        {
            boolean authority=ControlUtils.check(ro);

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

    /** 스크린 사이즈 별 다른 view 페이지 호출
     *
     * @param url 리소스 URL
     * @throws Exception
     */
    public void toViewScreen(String url) throws Exception
    {
        toView(this.getScreenResource(url));
    }

    private String getScreenResource(String jsp)
    {
        String value=jsp;

        if(jsp!=null && !"".equals(jsp))
        {
            String u_screen = ro.getSession("jsk_screen");
            String f_screen = ro.getSession("jsk_screen_fix");

            if(f_screen!=null && !"".equals(f_screen))
            {
                if("M".equals(f_screen))
                {
                    String m_file = JConfigEx.getInstance("platform").getString("platform", "mobile_web_file");
                    String m_jsp = jsp.substring(0, jsp.length()-4)+"_"+m_file+".jsp";
                    File file = new File(ro.getRequest().getSession().getServletContext().getRealPath("")+m_jsp);
                    if(file.exists())
                    {
                        value=m_jsp;
                    }
                }
            }
            else
            {
                if("M".equals(u_screen))
                {
                    String m_file = JConfigEx.getInstance("platform").getString("platform", "mobile_web_file");
                    String m_jsp = jsp.substring(0, jsp.length()-4)+"_"+m_file+".jsp";
                    File file = new File(ro.getRequest().getSession().getServletContext().getRealPath("")+m_jsp);
                    if(file.exists())
                    {
                        value=m_jsp;
                    }
                }
            }
        }
        return value;
    }

    /** JSON 형태로 리턴
     *
     * @param code 리턴코드
     * @param msg 리턴텍스트
     * @throws Exception
     */
    public String getJson(String code, String msg) throws Exception
    {
        DData data = new DData();

        try
        {
            if(code!=null && !"".equals(code) && ro!=null)
            {
                ro.set("j_opendata-code", code);
                ro.set("j_opendata-text", msg);

                data = ro.toDData();
            }
        }
        catch(Exception e)
        {}

        return JsonUtils.getJsonDData(data);
    }
}
