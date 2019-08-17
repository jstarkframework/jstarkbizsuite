package jstark.jstarkbizsuite.example.platform;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import org.jstark.framework.core.DData;
import org.jstark.framework.core.RequestObject;
import org.junit.Test;

import home.example.platform.PlatformAction;
import jstark.jstarkbizsuite.environment.TestEnvironment;

public class PlatformActionTest
{
    @Test
    public void doPlatformUserView() throws Exception
    {
        RequestObject ro = TestEnvironment.getTestEnvironmentCase1();

        PlatformAction action = new PlatformAction();

        action.setTestMode(ro);

        String result = action.doPlatformUserView();

        DData userdata = (DData) action.getModel("userdata");

        assertEquals("JSTARK", userdata.getString("u_id"));
        assertEquals("view:/WEB-INF/jsp/home/example/platform/platform_user_view.jsp", result);

        assertFalse(action.isFailure());
        assertFalse(action.isError());
    }

}
