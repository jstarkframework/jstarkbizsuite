package home.example.sample;

import java.util.HashMap;
import java.util.List;

import org.apache.http.Header;
import org.apache.http.cookie.Cookie;
import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.JConfig;
import org.jstark.framework.core.JLog;
import org.jstark.framework.core.hs.HttpBean;
import org.jstark.framework.web.annotation.ActionName;
import org.jstark.framework.web.annotation.ActionParam;
import org.jstark.framework.web.annotation.ActionParams;
import org.jstark.framework.web.annotation.Control;
import org.jstark.framework.web.annotation.Link;
import org.jstark.utils.JsonUtils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jstark.platform.PlatformChannel;

@Control({Control.LOGIN})
public class SampleApiAction extends PlatformChannel
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

    SampleService service = SampleService.getInstance();

    int timeout = JConfig.getInstance().getInt("HTTPCOMPONENTS.timeout");

    @Link("/example/sample/sample_api.do")
    public String doSampleApi() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_api.jsp";
    }

    @ActionName(name = "Restful Sample", text = "http://localhost/api/v1/item/111111 와 같은 형태로 호출")
    @ActionParams({
            @ActionParam(name = "Authorization", text = "인증토큰", required = true, type = "string", in = "header"),
            @ActionParam(name = "mid", text = "mid", required = false, type = "string", in = "path"),
            @ActionParam(name = "title", text = "제목", required = true, type = "string", in = "query"),
            @ActionParam(name = "money", text = "수입", required = true, type = "string", in = "query"),
            @ActionParam(name = "open_year", text = "개봉일", required = true, type = "string", in = "query")
    })
    @Link("/api/v1/item*")
    @Control(Control.ANONYMOUS)
    public String doSampleRestful() throws Exception
    {
        int entity = 2;
        String mid = getLink(entity+1);

        String json="";

        //JLog.test("entity:"+getLink(entity));
        //JLog.test("key:"+key);

        if(isRestfulList(entity))
        {
            ro.set("type", "LIST");

            ro.set("list", service.getList(ro));

            json = getJson("S", "success");
        }
        else if(isRestfulInsert(entity))
        {
            ro.set("type", "INSERT");
            //ro.set("item", getLink(2));

            String jsonbody = ro.getRequestBody();

            JsonObject jobj = new Gson().fromJson(jsonbody, JsonObject.class);

            String money = JsonUtils.getJsonString(jobj, "money");
            String title = JsonUtils.getJsonString(jobj, "title");
            String open_year = JsonUtils.getJsonString(jobj, "open_year");

            ro.set("money", money);
            ro.set("title", title);
            ro.set("open_year", open_year);

            service.setInsert(ro);

            json = getJson("S", "success");
        }
        else if(isRestfulView(entity))
        {
            ro.set("type", "VIEW");
            ro.set("mid", mid);

            ro.set("info", service.getInfo(ro));

            json = getJson("S", "success");
        }
        else if(isRestfulUpdate(entity))
        {
            ro.set("type", "UPDATE");
            ro.set("mid", mid);

            String jsonbody = ro.getRequestBody();

            JsonObject jobj = new Gson().fromJson(jsonbody, JsonObject.class);

            String money = JsonUtils.getJsonString(jobj, "money");
            String title = JsonUtils.getJsonString(jobj, "title");
            String open_year = JsonUtils.getJsonString(jobj, "open_year");

            ro.set("money", money);
            ro.set("title", title);
            ro.set("open_year", open_year);

            service.setUpdate(ro);

            ro.set("info", service.getInfo(ro));

            json = getJson("S", "success");
        }
        else if(isRestfulDelete(entity))
        {
            ro.set("type", "DELETE");
            ro.set("mid", mid);

            service.setDelete(ro);

            json = getJson("S", "success");
        }

        setDocumentJSON();

        setHttpStatus(200);

        return json;
    }

    @Link("/example/sample/sample_api_list.do")
    public String doSampleApiList() throws Exception
    {
        //input header
        HashMap header = new HashMap();

        header.put("Cookie", ro.getCookieString());
        //header.put("Cookie", "JSESSIONID=D839DC4DA1B11A29F743F2773265440E");

        header.put("User-Agent", "Mozila/5.0");

        String token = "";
        if(token!=null && !"".equals(token))
        {
            header.put("Authorization", "Bearer "+token);
        }

        HttpBean http = CoreUtils.toApiGet(ro.getDomain()+"/api/v1/item", header, timeout, true);

        JLog.test(http.body);
        JLog.test(http.status);
        JLog.test(http.headers);
        JLog.test(http.cookies);

        //output header
        Header[] oheaders = http.headers;
        for(Header oheader : oheaders)
        {
            JLog.test(oheader);
        }

        //output cookie
        List<Cookie> ocookies = http.cookies;
        if(ocookies.isEmpty())
        {
            JLog.test("Empty");
        }
        else
        {
            for (Cookie ocookie : ocookies)
            {
                JLog.test("Cookie Name\t : "+ocookie.getName());
                JLog.test("Cookie Value\t : "+ocookie.getValue());
                JLog.test("Cookie Domain\t : "+ocookie.getDomain());
            }
        }

        //output body to json
        //JsonObject jobj = new Gson().fromJson(http.body, JsonObject.class);

        return http.body;
    }

    @Link("/example/sample/sample_api_insert.do")
    public String doSampleApiInsert() throws Exception
    {
        //input header
        HashMap header = new HashMap();

        header.put("Cookie", ro.getCookieString());
        //header.put("Cookie", "JSESSIONID=D839DC4DA1B11A29F743F2773265440E");

        header.put("User-Agent", "Mozila/5.0");

        boolean isJson = true;
        String jsonbody = "";
        if(isJson)
        {
            header.put("Content-type", "application/json");
            header.put("Accept", "application/json");

            jsonbody = "{\r\n" +
                    "  \"money\": \"12345\",\r\n" +
                    "  \"title\": \"SuperMan\",\r\n" +
                    "  \"open_year\": \"2007\"\r\n" +
                    "}";
        }

        String token = "";
        if(token!=null && !"".equals(token))
        {
            header.put("Authorization", "Bearer "+token);
        }

        //input param
        //HashMap param = new HashMap();
        //param.put("A", "1");

        //HttpBean http = CoreUtils.toApiGet("http://localhost", header);
        //HttpBean http = CoreUtils.toApiPost("http://localhost", header, param);
        HttpBean http = CoreUtils.toApiPost(ro.getDomain()+"/api/v1/item", header, null, jsonbody, timeout, true);

        JLog.test(http.body);
        JLog.test(http.status);
        JLog.test(http.headers);
        JLog.test(http.cookies);

        //output header
        Header[] oheaders = http.headers;
        for(Header oheader : oheaders)
        {
            JLog.test(oheader);
        }

        //output cookie
        List<Cookie> ocookies = http.cookies;
        if(ocookies.isEmpty())
        {
            JLog.test("Empty");
        }
        else
        {
            for (Cookie ocookie : ocookies)
            {
                JLog.test("Cookie Name\t : "+ocookie.getName());
                JLog.test("Cookie Value\t : "+ocookie.getValue());
                JLog.test("Cookie Domain\t : "+ocookie.getDomain());
            }
        }

        //output body to json
        //JsonObject jobj = new Gson().fromJson(http.body, JsonObject.class);

        return http.body;
    }

    @Link("/example/sample/sample_api_view.do")
    public String doSampleApiView() throws Exception
    {
        //input header
        HashMap header = new HashMap();

        header.put("Cookie", ro.getCookieString());
        //header.put("Cookie", "JSESSIONID=D839DC4DA1B11A29F743F2773265440E");

        header.put("User-Agent", "Mozila/5.0");

        String token = "";
        if(token!=null && !"".equals(token))
        {
            header.put("Authorization", "Bearer "+token);
        }

        HttpBean http = CoreUtils.toApiGet(ro.getDomain()+"/api/v1/item/M20140310AAAAAAAACM2SYW", header, timeout, true);

        JLog.test(http.body);
        JLog.test(http.status);
        JLog.test(http.headers);
        JLog.test(http.cookies);

        //output header
        Header[] oheaders = http.headers;
        for(Header oheader : oheaders)
        {
            JLog.test(oheader);
        }

        //output cookie
        List<Cookie> ocookies = http.cookies;
        if(ocookies.isEmpty())
        {
            JLog.test("Empty");
        }
        else
        {
            for (Cookie ocookie : ocookies)
            {
                JLog.test("Cookie Name\t : "+ocookie.getName());
                JLog.test("Cookie Value\t : "+ocookie.getValue());
                JLog.test("Cookie Domain\t : "+ocookie.getDomain());
            }
        }

        //output body to json
        //JsonObject jobj = new Gson().fromJson(http.body, JsonObject.class);

        return http.body;
    }

    @Link("/example/sample/sample_api_update.do")
    public String doSampleApiUpdate() throws Exception
    {
        //input header
        HashMap header = new HashMap();

        header.put("Cookie", ro.getCookieString());
        //header.put("Cookie", "JSESSIONID=D839DC4DA1B11A29F743F2773265440E");

        header.put("User-Agent", "Mozila/5.0");

        boolean isJson = true;
        String jsonbody = "";
        if(isJson)
        {
            header.put("Content-type", "application/json");
            header.put("Accept", "application/json");

            jsonbody = "{\r\n" +
                    "  \"money\": \"12345\",\r\n" +
                    "  \"title\": \"SuperMan\",\r\n" +
                    "  \"open_year\": \"2007\"\r\n" +
                    "}";
        }

        String token = "";
        if(token!=null && !"".equals(token))
        {
            header.put("Authorization", "Bearer "+token);
        }

        HttpBean http = CoreUtils.toApiPut(ro.getDomain()+"/api/v1/item/M20140310AAAAAAAACM2SYW", header, null, jsonbody, timeout, true);

        JLog.test(http.body);
        JLog.test(http.status);
        JLog.test(http.headers);
        JLog.test(http.cookies);

        //output header
        Header[] oheaders = http.headers;
        for(Header oheader : oheaders)
        {
            JLog.test(oheader);
        }

        //output cookie
        List<Cookie> ocookies = http.cookies;
        if(ocookies.isEmpty())
        {
            JLog.test("Empty");
        }
        else
        {
            for (Cookie ocookie : ocookies)
            {
                JLog.test("Cookie Name\t : "+ocookie.getName());
                JLog.test("Cookie Value\t : "+ocookie.getValue());
                JLog.test("Cookie Domain\t : "+ocookie.getDomain());
            }
        }

        //output body to json
        //JsonObject jobj = new Gson().fromJson(http.body, JsonObject.class);

        return http.body;
    }

    @Link("/example/sample/sample_api_delete.do")
    public String doSampleApiDelete() throws Exception
    {
        //input header
        HashMap header = new HashMap();

        header.put("Cookie", ro.getCookieString());
        //header.put("Cookie", "JSESSIONID=D839DC4DA1B11A29F743F2773265440E");

        header.put("User-Agent", "Mozila/5.0");

        String token = "";
        if(token!=null && !"".equals(token))
        {
            header.put("Authorization", "Bearer "+token);
        }

        HttpBean http = CoreUtils.toApiDelete(ro.getDomain()+"/api/v1/item/M20140310AAAAAAAACM2SYW", header, timeout, true);

        JLog.test(http.body);
        JLog.test(http.status);
        JLog.test(http.headers);
        JLog.test(http.cookies);

        //output header
        Header[] oheaders = http.headers;
        for(Header oheader : oheaders)
        {
            JLog.test(oheader);
        }

        //output cookie
        List<Cookie> ocookies = http.cookies;
        if(ocookies.isEmpty())
        {
            JLog.test("Empty");
        }
        else
        {
            for (Cookie ocookie : ocookies)
            {
                JLog.test("Cookie Name\t : "+ocookie.getName());
                JLog.test("Cookie Value\t : "+ocookie.getValue());
                JLog.test("Cookie Domain\t : "+ocookie.getDomain());
            }
        }

        //output body to json
        //JsonObject jobj = new Gson().fromJson(http.body, JsonObject.class);

        return http.body;
    }

}