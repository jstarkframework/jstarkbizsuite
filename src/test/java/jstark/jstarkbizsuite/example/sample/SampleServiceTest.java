package jstark.jstarkbizsuite.example.sample;


import static org.junit.Assert.assertEquals;

import org.jstark.framework.core.DList;
import org.jstark.framework.core.RequestObject;
import org.junit.Test;

import home.example.sample.SampleService;
import jstark.jstarkbizsuite.environment.TestEnvironment;

public class SampleServiceTest
{
    @Test
    public void getList() throws Exception
    {
        RequestObject ro = TestEnvironment.getTestEnvironmentCase1();

        ro.set("search_title","해리포터와 불사조의 기사단");

        SampleService service = SampleService.getInstance();

        DList list = service.getList(ro);

        list.next();

        assertEquals("해리포터와 불사조의 기사단", list.getString("title"));
    }
}
