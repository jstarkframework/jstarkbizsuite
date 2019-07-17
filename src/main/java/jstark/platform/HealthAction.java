package jstark.platform;

import org.jstark.framework.web.annotation.Link;

public class HealthAction extends PlatformChannel
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

    @Link("/health")
    public String doHeahth() throws Exception
    {
        return "OK";
    }
}