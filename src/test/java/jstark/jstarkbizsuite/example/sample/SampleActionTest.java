package jstark.jstarkbizsuite.example.sample;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.jstark.framework.core.DList;
import org.jstark.framework.core.RequestObject;
import org.junit.Test;

import home.example.sample.SampleAction;
import jstark.jstarkbizsuite.environment.TestEnvironment;

public class SampleActionTest
{
    @Test
    public void doSampleList() throws Exception
    {
        RequestObject ro = TestEnvironment.getTestEnvironmentCase1();

        //ro.set("search_title","해");

        SampleAction action = new SampleAction();

        action.setTestMode(ro);

        action.doSampleList();

        DList list = (DList) action.getModel("list");

        assertEquals(10, list.getSize());

        assertFalse(action.isFailure());
        assertFalse(action.isError());
    }

    @Test
    public void doSampleAddSave() throws Exception
    {
        RequestObject ro = TestEnvironment.getTestEnvironmentCase1();

        ro.set("title", "제목");
        ro.set("money", "111");
        ro.set("open_year", "1234");

        SampleAction action = new SampleAction();

        action.setTestMode(ro);

        String result = action.doSampleAddSave();

        //String result = action.getTestResult();

        //JLog.test(result);

        if(result.indexOf("/example/sample/sample_list.do?j_param=")>-1)
        {
            assertTrue(true);
        }
        else
        {
            assertTrue(false);
        }

        assertFalse(action.isFailure());
        assertFalse(action.isError());
    }
}
