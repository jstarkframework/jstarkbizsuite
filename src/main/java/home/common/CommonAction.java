package home.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.JConfigEx;
import org.jstark.framework.core.hs.Txt;
import org.jstark.framework.web.annotation.Control;
import org.jstark.framework.web.annotation.Link;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jstark.platform.PlatformChannel;

@Control({Control.LOGIN})
public class CommonAction extends PlatformChannel
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

    /** 엑셀파일을 저장합니다.
     *
     * jskvar_excel_file : 저장 파일명
     * jskvar_excel_html : 엑셀 TEXT DATA
     *
     * @throws Exception
     */

    /*
    jskfn.getId("jskvar_excel_html").value=jskfn.getId("jskid_excel_div").innerHTML;
    jskfn.getId("jskvar_excel_title").value="";
    jskfn.getId("jskvar_excel_file").value="";
    document.jskform.action = jskfn_open_url("/common/common_excel_down.do");
    jskfn_submit(document.jskform);
    */
    @Link("/common/common_excel_down.do")
    public void doCommonExcelDown() throws Exception
    {
        ro.getResponse().setContentType("application/vnd.ms-excel");
        ro.getRequest().setCharacterEncoding("utf-8");

        String realFileName = ro.getString("jskvar_excel_file");
        ro.getResponse().reset();
        ro.getResponse().setHeader("Pragma", "no-cache;");
        ro.getResponse().setHeader("Expires", "-1;");
        ro.getResponse().setHeader("Content-Transfer-Encoding", "binary;");
        ro.getResponse().setContentType("application/vnd.ms-excel;charset=utf-8");
        ro.getResponse().setHeader("Content-Disposition", "attachment;filename="+new String(realFileName.getBytes(),"ISO-8859-1")+".xls");

        Txt txt = new Txt();

        txt.an("<!DOCTYPE html>");
        txt.an("<html lang=\"ko\">");
        txt.an("<head>");
        txt.an("<meta http-equiv=\"Content-Type\" content=\"application/vnd.ms-excel;charset=utf-8\" />");
        txt.an("<style type='text/css'>table{border-collapse:collapse;border-spacing:0;border:.5pt solid windowtext;}td{font-size:9.0pt;mso-number-format:\"\\@\";vertical-align:top;border:.5pt solid windowtext;white-space:normal;}</style>");
        txt.an("</head>");
        txt.an("<body>");
        if(!ro.nullString("jskvar_excel_title"))
        {
        txt.an("<h3>"+ro.getString("jskvar_excel_title")+"</h3>");
        }
        txt.an(CoreUtils.toScript(CoreUtils.reHtml(ro.getString("jskvar_excel_html"))));
        txt.an("</body>");
        txt.an("</html>");

        toPrint(txt);
    }

    @Link("/common/image.do")
    public void doImageDisplay() throws Exception
    {
        String path = ro.getString("path");
        String name = ro.getString("name");
        String type="";

        OutputStream out = null;


        try
        {
            if(!"".equals(path) && !"".equals(name))
            {
                name = name.toLowerCase();

                if(name.endsWith(".jpg"))
                {
                    ro.getResponse().setContentType("image/jpeg");
                    type="jpg";
                }
                else if(name.endsWith(".png"))
                {
                    ro.getResponse().setContentType("image/png");
                    type="png";
                }
                else if(name.endsWith(".gif"))
                {
                    ro.getResponse().setContentType("image/gif");
                    type="png";
                }
                else if(name.endsWith(".bmp"))
                {
                    ro.getResponse().setContentType("image/bmp");
                    type="bmp";
                }

                String img_path = CoreUtils.toConvertPath(JConfigEx.getInstance("fileupload").get("fileupload", "UPLOAD."+path+".upload_dir"));

                if(!"".equals(img_path))
                {
                    String img_path_name = img_path+name;

                    File file = new File(img_path_name);

                    if(file.isFile())
                    {
                        BufferedImage bi = ImageIO.read(file);
                        out = ro.getResponse().getOutputStream();
                        ImageIO.write(bi, type, out);
                    }
                }
            }
        }
        finally
        {
            if(out!=null)
            {
                out.close();
            }
        }
    }

    public JsonObject getHttpClient(String get_url, String token) throws Exception
    {
        CloseableHttpClient httpClient = null;
        String USER_AGENT = "Mozila/5.0";
        JsonObject jobj = new JsonObject();
        try
        {
            httpClient = HttpClients.createDefault();

            HttpGet httpGet = new HttpGet(get_url);

            httpGet.addHeader("User-Agent", USER_AGENT);
            httpGet.addHeader("Content-type", "application/json");
            httpGet.addHeader("Accept", "application/json");
            if(token!=null && !"".equals(token))
            {
                httpGet.addHeader("Authorization", "Bearer "+token);
            }

            CloseableHttpResponse httpResponse = httpClient.execute(httpGet);

            int status_code = httpResponse.getStatusLine().getStatusCode();

            if(200 == status_code)
            {
                String json = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");

                //System.out.println(json);

                jobj = new Gson().fromJson(json, JsonObject.class);
            }

            httpClient.close();
        }
        catch(Exception e)
        {
            throw e;
        }
        finally
        {
            if(httpClient != null)
            {
                httpClient.close();
            }
        }
        return jobj;
    }
}