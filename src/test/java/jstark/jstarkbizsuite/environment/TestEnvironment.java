package jstark.jstarkbizsuite.environment;


import org.jstark.framework.core.RequestObject;
import org.jstark.framework.core.hs.RequestTestObject;
import org.jstark.framework.core.hs.UserBean;

public class TestEnvironment
{
    public static RequestObject getTestEnvironmentCase1()
    {
        RequestTestObject rto = new RequestTestObject("");
        rto.setIp("111.111.111.111");
        rto.setContentLength(-1);
        rto.setMethod("POST");
        rto.setActionClassName("SampleAction");
        rto.setDoMethodName("doSampleList");
        rto.setSessionRequestUri("/example/sample/sample_list.do?param=1");
        rto.setIsMultiPart(false);
        rto.setIsInsiderRequest(true);
        rto.setIsSSL(false);
        rto.setIsOpendata(false);
        rto.setRequestURI("/example/sample/sample_list.do?param=1");
        rto.setSessionID("7CC4552B79DD42516517D72E487B2710");
        rto.setSessionTime(0);
        rto.setSession("jsk_client", "100");
        rto.setSession("jstark_client", "100");
        rto.setSession("jstark_lang", "100");
        rto.setCookie("JSESSIONID", "7CC4552B79DD42516517D72E487B2710");
        rto.setCookie("jsk_client", "100");
        rto.setUser(getUserInformationCase1());

        return rto.ro;
    }

    private static UserBean getUserInformationCase1()
    {
        UserBean user = new UserBean();
        user.session_decode=true;
        user.isLogin=true;
        user.client="100";
        user.ip="127.0.0.1";
        user.u_no="U20070220AAAAAAAAAAAA6A";
        user.id="JSTARK";
        user.name="관리자";
        user.lang="KO";
        user.timezone="+09:00";
        user.last="2016-03-04 20:55:22";
        user.login="2016-03-06 13:04:10";
        user.info0="JSTARK_JCO";
        user.info1="";
        user.info2="";
        user.info3="";
        user.info4="";
        user.info5="";
        user.info6="";
        user.info7="";
        user.info8="";
        user.info9="";

        return user;
    }
}
