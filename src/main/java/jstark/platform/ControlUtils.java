package jstark.platform;

import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.DData;
import org.jstark.framework.core.RequestObject;
import org.jstark.framework.core.hs.ApplicationMaster;
import org.jstark.framework.core.hs.CipherUtils;
import org.jstark.framework.core.hs.Txt;
import org.jstark.framework.core.hs.UserBean;
import org.jstark.framework.web.JStarkSecurity;
import org.jstark.framework.web.JStarkUser;
import org.jstark.platform.control.ControlService;
import org.jstark.platform.control.ControlServiceFactory;
import org.jstark.platform.core.LangUtils;
import org.jstark.platform.user.UserService;
import org.jstark.platform.user.UserServiceFactory;
import org.jstark.utils.DateUtils;

/** PLATFORM 권한 처리
 */
public class ControlUtils
{
    /** CONTROL에 설정된 권한 체크
     *
     * @param ro RequestObject
     * @return boolean 권한 위반의 경우 false 리턴
     * @throws Exception
     */
    public static boolean check(RequestObject ro) throws Exception
    {
        if(!ro.isNull())
        {
            if("NavigatorAction".equals(ro.getActionClassName()) && "doNavigatorSessionKeep".equals(ro.getDoMethodName()))
            {
                return true;
            }
            else
            {
                checklogic(ro);

                boolean checkflag = ro.getBoolean("jskroot_controlcheck_flag");

                if(!checkflag)
                {
                    String checkresult = ro.getString("jskroot_controlcheck_result");

                    if("LOGIN".equals(checkresult))
                    {
                        //로그인이 필요함
                        if(ro.isOpendata())
                        {
                            CoreUtils.toJson(ro, "E","Please Login");
                        }
                        else
                        {
                            Txt txt = new Txt();

                            txt.an("<script type=\"text/javascript\">");
                            //txt.an(" alert(\""+LangUtils.lang(ro,"JSTARKPLATFORM00024","로그인이 필요합니다.")+"\"); ");
                            txt.an(" top.location='"+CoreUtils.getContext()+"/platform/login.do'; ");
                            txt.an("</script>");

                            CoreUtils.toPrint(ro, txt);
                        }
                    }
                    else if("SESSION".equals(checkresult))
                    {
                        //세션 불일치
                        Txt txt = new Txt();

                        txt.an("<script type=\"text/javascript\">");
                        txt.an(" alert(\""+LangUtils.lang(ro,"JSTARKPLATFORM00025","잘못된 접근입니다.")+"\"); ");
                        txt.an(" top.location='/'; ");
                        txt.an("</script>");

                        CoreUtils.toPrint(ro, txt);
                    }
                    else if("METHOD".equals(checkresult))//Method
                    {
                        if(ro.isOpendata())
                        {
                            CoreUtils.toJson(ro, "E",LangUtils.lang(ro,"JSTARKPLATFORM00025","잘못된 접근입니다."));
                        }
                        else
                        {
                            Txt txt = new Txt();

                            txt.an("<script type=\"text/javascript\">");
                            txt.an(" alert(\""+LangUtils.lang(ro,"JSTARKPLATFORM00025","잘못된 접근입니다.")+"\"); ");
                            txt.an("</script>");

                            CoreUtils.toPrint(ro, txt);
                        }
                    }
                    else if("INSIDE".equals(checkresult))//InsideRequest
                    {
                        if(ro.isOpendata())
                        {
                            CoreUtils.toJson(ro, "E",LangUtils.lang(ro,"JSTARKPLATFORM00025","잘못된 접근입니다."));
                        }
                        else
                        {
                            Txt txt = new Txt();

                            txt.an("<script type=\"text/javascript\">");
                            txt.an(" alert(\""+LangUtils.lang(ro,"JSTARKPLATFORM00025","잘못된 접근입니다.")+"\"); ");
                            txt.an("</script>");

                            CoreUtils.toPrint(ro, txt);
                        }
                    }
                    else if("UNIQUE".equals(checkresult))
                    {
                        if(ro.isOpendata())
                        {
                            CoreUtils.toJson(ro, "E",LangUtils.lang(ro,"JSTARKPLATFORM00026","이미 처리가 완료되었습니다."));
                        }
                        else
                        {
                            Txt txt = new Txt();

                            txt.an("<script type=\"text/javascript\">");
                            txt.an(" alert(\""+LangUtils.lang(ro,"JSTARKPLATFORM00026","이미 처리가 완료되었습니다.")+"\"); ");
                            txt.an("</script>");

                            CoreUtils.toPrint(ro, txt);
                        }
                    }
                    else if("AUTH".equals(checkresult))
                    {
                        if(ro.isOpendata())
                        {
                            CoreUtils.toJson(ro, "E",LangUtils.lang(ro,"JSTARKPLATFORM00031","사용 권한이 없습니다."));
                        }
                        else
                        {
                            Txt txt = new Txt();

                            txt.an("<script type=\"text/javascript\">");
                            txt.an(" alert(\""+LangUtils.lang(ro,"JSTARKPLATFORM00031","사용 권한이 없습니다.")+"\"); ");
                            txt.an("</script>");

                            CoreUtils.toPrint(ro, txt);
                        }
                    }
                }

                ro.remove("jskroot_controlcheck_result");
                ro.remove("jskroot_controlcheck_flag");

                return checkflag;
            }
        }
        else
        {
            return false;
        }
    }

    protected static void checklogic(RequestObject ro) throws Exception
    {
        if(!ro.isNull())
        {
            if(ro.getRequest().getAttribute("ControlUtils")!=null && "X".equals(ro.getRequest().getAttribute("ControlUtils").toString()))
            {
                //Action에서 이미 인증 받음. JSP에서는 생략
                ro.set("jskroot_controlcheck_flag", "true");
            }
            else
            {
                String ip = ro.getIp();

                String action = CoreUtils.toNull(ro.getRequest().getAttribute("jskroot_actionclass"));
                String domethod = CoreUtils.toNull(ro.getRequest().getAttribute("jskroot_domethod"));

                if(!"".equals(action))
                {
                    if(!"doNavigatorSessionKeep".equals(domethod))
                    {
                        ro.setSession("jsk_time", CoreUtils.toString(System.currentTimeMillis()));
                    }

                    checklogicdata(ro, action, domethod, "", ip);
                }
                else
                {
                    String request_uri = CoreUtils.getRequestURI(ro.getRequest().getRequestURI());

                    int ic=0;
                    while(request_uri.indexOf("//")>-1 && ic<100)
                    {
                        request_uri=request_uri.replaceAll("//", "/");
                        ic++;
                    }

                    checklogicdata(ro, "", "", request_uri, ip);
                }
            }
        }
        else
        {
            ro.set("jskroot_controlcheck_flag", "false");
        }
    }

    private static void checklogicdata(RequestObject ro, String action, String domethod, String url, String ip) throws Exception
    {
        boolean flag = true;

        UserBean user = JStarkUser.getUser();

        ControlService service = ControlServiceFactory.getInstance();

        DData param = new DData();

        param.set("ck_control_user", user);
        param.set("ck_control_action", action);
        param.set("ck_control_domethod", domethod);
        param.set("ck_control_url", url);
        param.set("ck_control_ip", ip);

        DData controldata = service.getControl(param);

        if(flag && ro.equals("jskroot_control_login","X") && !user.isLogin)
        {
            flag=false;
            controldata.set("result_login","X");

            ro.set("jskroot_controlcheck_result", "LOGIN");
        }
        if(flag && user.isLogin)
        {
            if(!"127.0.0.1".equals(ro.getIp()) && !ro.getIp().equals(ApplicationMaster.getIp()) && !user.ip.equals(ro.getIp())) //세션의 IP와 본인의 IP 비교, 세션 누출 검사, 서버에서 접근일 경우 Skip
            {
                String x_server_header = ro.getRequest().getHeader("X-Server");
                String x_server  = CipherUtils.getAesDecrypt(ApplicationMaster.getFirstKey()+ApplicationMaster.getFirstKey(), x_server_header);

                boolean valid_flag = true;

                if(x_server.startsWith("INTERNAL:"))
                {
                   String[] valid_str = x_server.split(":");

                   long valid_time = CoreUtils.toLong(valid_str[1]);

                   long target_time = CoreUtils.toLong(DateUtils.getTime("yyyyMMddHHmmss"));

                   if(valid_time < target_time)
                   {
                       valid_flag = false;
                   }
                }

                if(!x_server.startsWith("INTERNAL:") || !valid_flag)
                {
                    flag=false;
                    controldata.set("result_login","X");

                    UserService uservice = UserServiceFactory.getInstance();
                    DData param0 = new DData();
                    param0.set("log_path", "SESSION IP INVALID");
                    uservice.setUserLogout(ro, param0);

                    JStarkSecurity.setJstarkSessionDelete(ro);

                    ro.set("jskroot_controlcheck_result", "SESSION");
                }
            }
        }

        if(flag && (ro.equals("jskroot_control_post","X") || ro.equals("jskroot_control_put","X") || ro.equals("jskroot_control_delete","X")) && ro.isGet())
        {
            flag=false;
            controldata.set("result_method","X");

            ro.set("jskroot_controlcheck_result", "METHOD");
        }

        if(flag && (ro.equals("jskroot_control_get","X") || ro.equals("jskroot_control_put","X") || ro.equals("jskroot_control_delete","X")) && ro.isPost())
        {
            flag=false;
            controldata.set("result_method","X");

            ro.set("jskroot_controlcheck_result", "METHOD");
        }

        if(flag && (ro.equals("jskroot_control_get","X") || ro.equals("jskroot_control_post","X") || ro.equals("jskroot_control_delete","X")) && ro.isPut())
        {
            flag=false;
            controldata.set("result_method","X");

            ro.set("jskroot_controlcheck_result", "METHOD");
        }

        if(flag && (ro.equals("jskroot_control_get","X") || ro.equals("jskroot_control_post","X") || ro.equals("jskroot_control_put","X")) && ro.isDelete())
        {
            flag=false;
            controldata.set("result_method","X");

            ro.set("jskroot_controlcheck_result", "METHOD");
        }

        if(flag && ro.equals("jskroot_control_inside","X") && !ro.isInsideRequest())
        {
            flag=false;
            controldata.set("result_inside","X");

            ro.set("jskroot_controlcheck_result", "INSIDE");
        }
        if(flag && ro.equals("jskroot_control_unique","X") && !ro.isUnique() && ro.nullString("jskroot_error"))
        {
            flag=false;
            controldata.set("result_unique","X");

            ro.set("jskroot_controlcheck_result", "UNIQUE");
        }

        int control_auth_num = controldata.getInt("yes_group")+controldata.getInt("no_group")+controldata.getInt("yes_user")+controldata.getInt("no_user")+controldata.getInt("yes_ip")+controldata.getInt("no_ip");

        if(flag && ((control_auth_num<0) || (control_auth_num==0 && controldata.getInt("ck_control_cnt")>0)))
        {
            flag=false;
            controldata.set("result_auth","X");

            ro.set("jskroot_controlcheck_result", "AUTH");
        }

        if(controldata.equals("ck_log","X"))
        {
            DData param0 = new DData();
            param0.set("controldata", controldata);
            param0.set("flag", flag);
            service.setControlLogInsert(ro, param0);
        }

        if(!flag)
        {
            try
            {
                ro.delFile();
            }
            catch(Exception e){}
        }
        else
        {
            ro.getRequest().setAttribute("ControlUtils", "X");
        }

        ro.set("jskroot_controlcheck_flag", CoreUtils.toString(flag));
    }

}