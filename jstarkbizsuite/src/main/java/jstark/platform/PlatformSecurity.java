package jstark.platform;

import org.jstark.framework.core.JConfigEx;
import org.jstark.framework.core.RequestObject;

/** PLATFORM의 로그인, 사용자인증 등의 추가로직 구현
 *
 * @author jstark
 *
 */
public class PlatformSecurity
{
    /** 로그인 페이지를 지정합니다. Platform 내부에서 호출됨. 클라이언트 별/도메인별 다른 페이지 구성.
     *
     * @param ro RequestObject
     * @param client 클라이언트 번호
     * @return String 로그인 페이지 URL
     * @throws Exception
     */
    public static String getClientLoginView(RequestObject ro,String client) throws Exception
    {
        //client별 로그인 페이지 이동

        if("".equals(client))
        {
            String hostname = ro.getRequest().getServerName(); //참고용으로 만 사용. Redirect 금지(보안)

            String jsk_client = ro.getCookie("jsk_client");

            if(jsk_client!=null && !"".equals(jsk_client))
            {
                client=jsk_client;
            }
            else if("localhost".equals(hostname))
            {
                client="100";
            }
            else if("127.0.0.1".equals(hostname))
            {
                client="200";
            }
            else
            {
                client=JConfigEx.getInstance("platform").getString("platform", "default_client");
            }
        }

        ro.setCookie("jsk_client", client,24*60*60*90);
        ro.setSession("jsk_client", client);

        String agenttype = HtmlUtils.getClientDevice(ro.getRequest().getHeader("user-agent"));
        if("M".equals(agenttype))
        {
            //ro.setSession("jsk_screen","M");
            //ro.setSession("jsk_screen_fix","M");
        }

        String loginpage = "/WEB-INF/jsp/jstark/platform/client/login.jsp";

//        if("200".equals(client))
//        {
//            loginpage = "/WEB-INF/jsp/jstark/platform/client/login.jsp";
//        }

        return loginpage;
    }

    /** 초기 패스워드 변경 페이지를 리턴합니다. Platform 내부에서 호출됨. 클라이언트 별/도메인별 다른 페이지 구성.
     *
     * @param ro RequestObject
     * @param client 클라이언트번호
     * @return String 초기 패스워드 페이지 URL
     * @throws Exception
     */
    public static String getClientPasswordView(RequestObject ro,String client) throws Exception
    {
        //client별 패스워드 변경 페이지 이동

        String passwordpage = "/WEB-INF/jsp/jstark/platform/client/password.jsp";

//        if("200".equals(client))
//        {
//            passwordpage = "/WEB-INF/jsp/jstark/platform/client/password.jsp";
//        }

        return passwordpage;
    }

    /** 초기 로그인시 처리할 프로세스를 추가하고 Platform 내부에서 실행됩니다.
     *
     * @param ro RequestObject
     * @throws Exception
     */
    public static void initLogin(RequestObject ro) throws Exception
    {

    }

    /** 외부 인증 로그인을 처리하는 부분으로 true가 리턴되면 로그인 처리 로직을 수행합니다.
     *
     * @param ro RequestObject
     * @param id 로그인 아이디
     * @param pw 로그인 패스워드
     * @return boolean 리턴되는 값에 의해 로그인 아이디의 계정을 로그인 처리됨
     */
    public static boolean isExternalLogin(RequestObject ro,String id,String pw)
    {
        boolean result=false;

        //추가인증 코드
        //로그인 모듈이 아닌 다른 시스템의 인증처리나 SSO가 되는 경우
        //해당 모듈에서 검증 후 적합한 사용자라면 true 리턴
        //true가 리턴되면 해당 계정으로 자동 로그인됨.

        return result;
    }

    /** 사용자 로그인 이후 호출되며 로그를 남기는 등의 추가 로직 구현이 가능합니다.
     *
     * @param ro RequestObject
     * @param u_id 사용자 아이디
     * @param u_no 사용자 번호
     * @throws Exception
     */
    public static void setLogin(RequestObject ro,String u_id,String u_no) throws Exception
    {
        //사용자 로그인 후 코드
        //로그인 모듈 이외 별도 관리해야할 부분이나 로직 처리
    }

    /** 관리자 로그인 이후 호출되며 로그를 남기는 등의 추가 로직 구현이 가능합니다.
     *
     * @param ro RequestObject
     * @param u_id 사용자 아이디
     * @param u_no 사용자 번호
     * @throws Exception
     */
    public static void setAdminLogin(RequestObject ro,String u_id,String u_no) throws Exception
    {
        //관리자 로그인 후 코드
        //로그인 모듈 이외 별도 관리해야할 부분이나 로직 처리
    }
}