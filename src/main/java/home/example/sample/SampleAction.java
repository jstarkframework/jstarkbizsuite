package home.example.sample;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.DData;
import org.jstark.framework.core.DList;
import org.jstark.framework.core.HttpRequest;
import org.jstark.framework.core.JCache;
import org.jstark.framework.core.JConfigEx;
import org.jstark.framework.core.JLog;
import org.jstark.framework.core.SimpleDataBase;
import org.jstark.framework.core.ValidCheck;
import org.jstark.framework.core.hs.DBMS;
import org.jstark.framework.core.hs.Txt;
import org.jstark.framework.core.hs.UserBean;
import org.jstark.framework.web.JStarkUser;
import org.jstark.framework.web.annotation.ActionName;
import org.jstark.framework.web.annotation.ActionParam;
import org.jstark.framework.web.annotation.ActionParams;
import org.jstark.framework.web.annotation.Control;
import org.jstark.framework.web.annotation.Link;
import org.jstark.framework.web.annotation.Upload;
import org.jstark.platform.core.DataCheck;
import org.jstark.platform.core.LangUtils;
import org.jstark.utils.ExcelUtils;
import org.jstark.utils.JsonUtils;
import org.jstark.utils.LdapUtils;
import org.jstark.utils.PdfUtils;

import jstark.platform.ActionType;
import jstark.platform.PlatformChannel;

@Control({Control.LOGIN})
public class SampleAction extends PlatformChannel
{
    @Override
    public Boolean StartMethod() throws Exception
    {
    	UserBean user = JStarkUser.getUser();

    	//JSTARK 이외의 계쩡에서 TEST할 경우 true 가 리턴하도록 아래 변경

    	if("JSTARK".equals(user.id))
    	{
            return new Boolean(true);
    	}
    	else
    	{
    		return new Boolean(false);
    	}
    }

    @Override
    public void FinishMethod() throws Exception
    {
    }

    SampleService service = SampleService.getInstance();

    @Link("/example/index.do")
    public String doIndex() throws Exception
    {
        setParamSet("SampleAction.doIndex");
        setParam(new String[]{"j_sample_tab"});

        ro.setDefault("j_sample_tab", "A");

        return "view:/WEB-INF/jsp/home/example/index.jsp";
    }

    private boolean vvSampleCheck(int action_type) throws Exception
    {
        boolean validation=false;

        if(ro.nullSpace("title"))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('데이터를 입력하세요. [영화제목]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else if(!ValidCheck.isStringSize(ro.getString("title"), 0, 100))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('데이터의 크기를 확인하세요. [영화제목]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else if(ro.nullSpace("money"))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('데이터를 입력하세요. [수입]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else if(!ValidCheck.isNumber(ro.getString("money")))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('숫자 형식으로 입력하세요. [수입]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else if(!ValidCheck.isNumberSize(ro.getString("money"), 0, 1000000000000L))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('데이터의 크기를 확인하세요. [수입]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else if(ro.nullSpace("open_year"))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('데이터를 입력하세요. [개봉일]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else if(!ValidCheck.isNumber(ro.getString("open_year")))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('숫자 형식으로 입력하세요. [개봉일]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else if(!ValidCheck.isNumberSize(ro.getString("open_year"), 0, 9999))
        {
            Txt txt= new Txt();
            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert_red('데이터의 크기를 확인하세요. [개봉일]');");
            txt.an("</script>");
            toPrint(txt);
        }
        else
        {
            validation=true;
        }

        if(!validation)
        {
            setFailure();
        }

        return validation;
    }

    @ActionName(name = "Sample List", text = "샘플 리스트")
    @ActionParams({
            @ActionParam(name = "open_year", text = "개봉일", required = false, type = "string array", in = "query"),
            @ActionParam(name = "search_title", text = "제목", required = false, type = "string", in = "query"),
            @ActionParam(name = "jskvar_sort", text = "정렬", required = false, type = "string", in = "query"),
            @ActionParam(name = "j_page", text = "페이지 번호", required = false, type = "string", in = "query")
    })
    @Link("/example/sample/sample_list.do")
    public String doSampleList() throws Exception
    {
        setParamSet("SampleAction.doSampleList");
        setParam(new String[]{"search_title", "j_page"});

        DList list = service.getList(ro);

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_list.jsp";
    }

    @Link("/example/sample/sample_list_mobile.do")
    public String doSampleListMobile() throws Exception
    {
        setParamSet("SampleAction.doSampleList");
        setParam(new String[]{"search_title", "j_page"});

        DList list = service.getList(ro);

        addModel("list", list);

        if(ro.isOpendata())
        {
            ro.set("list", list);

            //Native Mobile JSON I/F
            return getJson("S", "success");
        }
        return null;
    }

    @Link("/example/sample/sample_list_redis.do")
    public String doSampleListRedis() throws Exception
    {
        setParamSet("SampleAction.doSampleList");
        setParam(new String[]{"search_title", "j_page"});

        DList list = service.getListWithRedis(ro);

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_list.jsp";
    }

    @Link("/example/sample/sample_list_jsp.do")
    public String doSampleListJsp() throws Exception
    {
        setParamSet("SampleAction.doSampleList");
        setParam(new String[]{"search_title", "j_page"});

        DList list = service.getList(ro);

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_list.jsp";
    }

    @Link("/example/sample/sample_list_bean.do")
    public String doSampleListBean() throws Exception
    {
        ArrayList list = service.getListBean(ro);

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_list_bean.jsp";
    }

    @Link("/example/sample/sample_add.do")
    public String doSampleAdd() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_add.jsp";
    }

    @Link("/example/sample/sample_add_bean.do")
    public String doSampleAddBean() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_add_bean.jsp";
    }

    @Link("/example/sample/sample_add_save.do")
    public String doSampleAddSave() throws Exception
    {
        if(vvSampleCheck(ActionType.ADD))
        {
            service.setInsert(ro);

            Txt txt = new Txt();

            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert('"+LangUtils.lang(ro,"JSTARKPLATFORM00021","저장되었습니다.")+"');");
            txt.an("parent.location='"+jcontext+"/example/sample/sample_list.do?j_param=init';");
            txt.an("</script>");

            return txt.toString();
        }
        return null;
    }

    @Link("/example/sample/sample_add_bean_save.do")
    public String doSampleAddBeanSave() throws Exception
    {
        if(vvSampleCheck(ActionType.ADD))
        {
            SampleBean bean = (SampleBean) toBean(SampleBean.class);

            service.setInsert(bean);

            Txt txt = new Txt();

            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert('"+LangUtils.lang(ro,"JSTARKPLATFORM00021","저장되었습니다.")+"');");
            txt.an("parent.location='"+jcontext+"/example/sample/sample_list_bean.do?j_param=init';");
            txt.an("</script>");

            return txt.toString();
        }
        return null;
    }

    @Link("/example/sample/sample_view.do")
    public String doSampleView() throws Exception
    {
        setDecode("mid");

        if(DataCheck.check(ro, "sample_content", "mid", "mid", true))
        {
            addModel("data", service.getInfo(ro));

            return "view:/WEB-INF/jsp/home/example/sample/sample_view.jsp";
        }

        return null;
    }

    @Link("/example/sample/sample_view_bean.do")
    public String doSampleViewBean() throws Exception
    {
        setDecode("mid");

        SampleBean bean = (SampleBean) toBean(SampleBean.class);

        if(DataCheck.check(ro, "sample_content", "mid", "mid"))
        {
            addModel("data", service.getInfoBean(bean));

            return "view:/WEB-INF/jsp/home/example/sample/sample_view_bean.jsp";
        }

        return null;
    }

    @Link("/example/sample/sample_modify.do")
    public String doSampleModify() throws Exception
    {
        setDecode("mid");

        if(DataCheck.check(ro, "sample_content", "mid", "mid"))
        {
            addModel("data", service.getInfo(ro));

            return "view:/WEB-INF/jsp/home/example/sample/sample_modify.jsp";
        }
        return null;
    }

    @Link("/example/sample/sample_modify_save.do")
    public String doSampleModifySave() throws Exception
    {
        setDecode("mid");

        if(DataCheck.check(ro, "sample_content", "mid", "mid") && vvSampleCheck(ActionType.MODIFY))
        {
            service.setUpdate(ro);

            Txt txt = new Txt();

            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert('"+LangUtils.lang(ro,"JSTARKPLATFORM00021","저장되었습니다.")+"');");
            txt.an("parent.location='"+jcontext+"/example/sample/sample_view.do?mid="+ro.getString("mid")+"';");
            txt.an("</script>");

            return txt.toString();
        }
        return null;
    }

    @Link("/example/sample/sample_delete_save.do")
    public String doSampleDeleteSave() throws Exception
    {
        setDecode("mid");

        if(DataCheck.check(ro, "sample_content", "mid", "mid"))
        {
            service.setDelete(ro);

            //Request 값을 그대로 전달할 경우 toMove 사용. 그렇지 않을 경우 toPrint 사용.
            //toMove(jcontext+"/example/sample/sample_list.do");

            //단순 이동의 경우 toRedirect 사용.

            Txt txt = new Txt();

            txt.an("<script type=\"text/javascript\">");
            txt.an("parent.parent.jskfn_alert('"+LangUtils.lang(ro,"JSTARKPLATFORM00085","삭제되었습니다.")+"');");
            txt.an("parent.location='"+jcontext+"/example/sample/sample_list.do?j_page=1';");
            txt.an("</script>");

            return txt.toString();
        }
        return null;
    }

    @Link("/example/sample/sample_http.do")
    public String doSampleHttp() throws Exception
    {
        Txt txt = new Txt();

        txt.an("<script type=\"text/javascript\">");
        txt.an(" alert(\"처리되었습니다.\"); ");
        txt.an(" document.location='"+jcontext+"/example/sample/sample_list.do'; ");
        txt.an("</script>");

        return txt.toString();
    }

    @Link("/example/sample/sample_excel_down.do")
    public String doSampleExcelDown() throws Exception
    {
        DList list = null;
        if(JCache.isDList("SampleService.getListCache"))
        {
            list = JCache.getDList("SampleService.getListCache");
        }
        else
        {
            list = service.getListCache();
        }

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_excel_down.jsp";
    }

    @Link("/example/sample/sample_excel_file_upload.do")
    public String doSampleExcelFileUpload() throws Exception
    {
        ro.set("excel_flag", "true");
        DList list = service.getListXQuery(ro);

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_excel_list.jsp";
    }

    @Link("/example/sample/sample_excel_file_upload_save.do")
    @Upload("example_sample_file")
    public String doSampleExcelFileUploadSave() throws Exception
    {
        Txt txt = new Txt();

        service.setExcelInsert(ro);

        txt.an("<script type=\"text/javascript\">");
        txt.an(" alert('등록이 완료되었습니다.'); ");
        txt.an(" parent.location='"+jcontext+"/example/sample/sample_excel_file_upload.do'; ");
        txt.an("</script>");

        return txt.toString();
    }

    @Link("/example/sample/sample_excel_file_delete_save.do")
    public String doSampleExcelFileDeleteSave() throws Exception
    {
        setDecode("fid");

        if(DataCheck.check(ro, "sample_file", "fid", "fid"))
        {
            service.setExcelDelete(ro);

            Txt txt = new Txt();

            txt.an("<script type=\"text/javascript\">");
            txt.an(" parent.parent.jskfn_alert('삭제가 완료되었습니다.'); ");
            txt.an(" parent.location='"+jcontext+"/example/sample/sample_excel_file_upload.do?j_page=1'; ");
            txt.an("</script>");

            return txt.toString();
        }
        return null;
    }

    @Link("/example/sample/sample_excel_file_read.do")
    public String doSampleExcelFileRead() throws Exception
    {
        setDecode("fid");

        if(DataCheck.check(ro, "sample_file", "fid", "fid"))
        {
            DData data = service.getDataXQuery(ro);

            String file_url = data.getString("file_path")+data.getString("file_save");

            try
            {
                ExcelUtils excel = ExcelUtils.getInstance();
                String[][][] sheet_list = excel.getExcel(file_url);

                ro.set("list", sheet_list);

                return "view:/WEB-INF/jsp/home/example/sample/sample_excel_view.jsp";
            }
            catch(Exception e)
            {
                Txt txt = new Txt();

                txt.an("<script type=\"text/javascript\">");
                txt.an(" alert('엑셀 파일에서 오류가 발생하였습니다.\\n엑셀에서 [Excel 97 - 2003 통합 문서 (xls)]로 저장하고 다시 처리하시기 바랍니다.'); ");
                txt.an(" document.location='"+jcontext+"/example/sample/excel_file_upload.do'; ");
                txt.an("</script>");

                return txt.toString();
            }
        }
        return null;
    }

    @Link("/example/sample/sample_include.do")
    public void doSampleInclude() throws Exception
    {
        ro.set("msg", "JSTARK FRAMEWORK SAMPLE");

        toInclude("/WEB-INF/jsp/home/example/sample/sample_include1.jsp");

        ro.set("msg", "HELLO WORLD!");

        toInclude("/WEB-INF/jsp/home/example/sample/sample_include2.jsp");
    }

    @Link("/example/sample/sample_mobile.do")
    public void doSampleMobile() throws Exception
    {
        //device에 따라 화면이 다르게 분리. 일반 sample_device.jsp, 모바일 sample_device_mobile.jsp
        toViewScreen("/WEB-INF/jsp/home/example/sample/sample_device.jsp");
    }

    @Link("/example/sample/sample_excel_file_create_xls.do")
    public void doSampleExcelFileCreateXls() throws Exception
    {
        FileOutputStream fos = null;
        try
        {
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet sheet = workbook.createSheet("new sheet 1");
            HSSFRow row = sheet.createRow(0);
            HSSFCell cell1 = row.createCell(0);
            cell1.setCellValue("cell 1");
            HSSFCell cell2 = row.createCell(1);
            cell2.setCellValue("cell 2");
            HSSFCell cell3 = row.createCell(2);
            cell3.setCellValue("cell 3");

            fos = new FileOutputStream("d:\\test.xls");
            workbook.write(fos);
        }
        finally
        {
            if(fos!=null)
            {
                fos.close();
            }
        }
    }

    @Link("/example/sample/sample_excel_file_create_xlsx.do")
    public void doSampleExcelFileCreateXlsx() throws Exception
    {
        FileOutputStream fos = null;
        try
        {
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("new sheet 1");
            Row row;
            Cell cell;
            for(int k=0;k<30;k++)
            {
                row = sheet.createRow(k);
                for (int i=0;i<30;i++)
                {
                    cell = row.createCell(i);
                    cell.setCellValue("hi world");
                }
            }

            fos = new FileOutputStream("d:\\test2.xlsx");
            workbook.write(fos);
        }
        finally
        {
            if(fos!=null)
            {
                fos.close();
            }
        }
    }

    @Link("/example/sample/sample_el_jstl.do")
    public String doSampleElJstl() throws Exception
    {
        DList list = service.getList(ro);

        addModel("list", list);

        ro.set("title", "EL & JSTL");

        return "view:/WEB-INF/jsp/home/example/sample/sample_el_jstl.jsp";
    }

    @Link("/example/sample/sample_file_upload.do")
    public String doSampleFileUpload() throws Exception
    {
        ro.set("image_flag", "true");

        DList list = service.getListXQuery(ro);

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_file_upload.jsp";
    }

    @Link("/example/sample/sample_file_upload_save.do")
    @Upload("example_sample_file")
    public String doSampleFileUploadSave() throws Exception
    {
    	service.setExcelInsert(ro);

        Txt txt = new Txt();

        txt.an("<script type=\"text/javascript\">");
        txt.an("parent.parent.jskfn_alert('처리가 완료되었습니다.');");
        txt.an("parent.location='"+jcontext+"/example/sample/sample_file_upload.do';");
        txt.an("</script>");

        return txt.toString();
    }

    @Link("/example/sample/sample_file_delete_save.do")
    public String doSampleFileDeleteSave() throws Exception
    {
        service.setExcelDelete(ro);

        Txt txt = new Txt();

        txt.an("<script type=\"text/javascript\">");
        txt.an("parent.parent.jskfn_alert('삭제가 완료되었습니다.');");
        txt.an("parent.location='"+jcontext+"/example/sample/sample_file_upload.do?j_page=1';");
        txt.an("</script>");

        return txt.toString();
    }

    @Link("/example/sample/sample_file_download_save.do")
    public void doSampleFileDownloadSave() throws Exception
    {
        //파일 다운로드의 경우 키값을 통해 DB에서 경로와 파일명을 읽어 오도록 하는 것이 보안에 안전함.
        //파일 경로와 파일명을 파라메타로 넘겨 받아 다운로드 하는 방식은 파라메타의 조작으로 권한이 부여되지 않은 파일의 다운로드가 가능한 취약점이 있음.
        try
        {
            if(ro.isInsideRequest())
            {
                boolean check_flag=true;

                //tag, file, name
                //Properties Tag name
                String tag = ro.getString("attach_tag");
                //저장 파일명
                String file = ro.getString("attach_file");
                //다운로드 파일명
                String name = ro.getString("attach_name");

                if(tag.equalsIgnoreCase("..") || tag.equalsIgnoreCase("/")){check_flag=false;}
                if(file.equalsIgnoreCase("..") || file.equalsIgnoreCase("/")){check_flag=false;}
                if(name.equalsIgnoreCase("..") || name.equalsIgnoreCase("/")){check_flag=false;}

                String path = HttpRequest.getFileUploadDir(tag);

                if(check_flag)
                {
                    HttpRequest.toFileDownload(ro, path+file, name);
                }

            }
        }
        catch(Exception e)
        {
        }
    }

    @Link("/example/sample/sample_parameter_cache.do")
    public String doSampleParameterCache() throws Exception
    {
        //j_param 설정 : 필요한 경우에 만 사용
        setParamSet("cache.cache");
        setParam(new String[]{"search_title", "j_page", "open_year"});

        DList list = service.getList(ro);

        addModel("list", list);

        addModel("open_year_list", service.getOpenYear(ro));

        return "view:/WEB-INF/jsp/home/example/sample/sample_parameter_cache.jsp";
    }

    @Link("/example/sample/sample_multi_col.do")
    public String doSampleMultiCol() throws Exception
    {
        DList list = service.getListCache();

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_multi_col.jsp";
    }

    @Link("/example/sample/sample_multi_row.do")
    public String doSampleMultiRow() throws Exception
    {
        DList list = service.getListCache();

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_multi_row.jsp";
    }

    @Link("/example/sample/sample_ajax.do")
    public String doSampleAjax() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_ajax.jsp";
    }

    @Link("/example/sample/sample_ajax_data_json.do")
    public String doSampleAjaxDataJson() throws Exception
    {
        if(ro.equals("jtype", "list"))
        {
            DList list = service.getListCache();

            return JsonUtils.getJsonString("message", list);
        }
        else
        {
            DData data = service.getInfo(ro);

            return JsonUtils.getJsonString("message", data);
        }
    }

    @Link("/example/sample/sample_ajax_data_text.do")
    public String doSampleAjaxDataText() throws Exception
    {
        DData data = service.getInfo(ro);

        if(!data.equals("title", "타이타닉"))
        {
            return data.getString("title");
        }
        else
        {
            Txt txt = new Txt();

            //AJAX 예외 처리
            txt.an("//JSTARK_AJAX_MSG");
            txt.an("alert(\"타이타닉을 선택할 수 없습니다.\");");

            return txt.toString();
        }
    }

    @Link("/example/sample/sample_ajax_data_xml.do")
    public String doSampleAjaxDataXml() throws Exception
    {
        //xml로 표시
        setDocumentXML();

        boolean success = true;

        DList list = service.getListCache();

        Txt txt = new Txt();

        //공백이 오면 안됨. <?xml 이 맨처음 시작되어야 함.
        //아닐경우 리턴되는 값이 없음.

        if(success)
        {
            txt.an("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            txt.an("<response>");

            while(list.next())
            {
                txt.an("<message>");
                txt.an("<mid>"+list.getString("mid")+"</mid>");
                txt.an("<num>"+list.getCountDesc()+"</num>");
                txt.an("<title><![CDATA["+list.getString("title")+"]]></title>");
                txt.an("<money>"+CoreUtils.toComma(list.getString("money"))+"</money>");
                txt.an("<open_year>"+list.getInt("open_year")+"</open_year>");
                txt.an("</message>");
            }

            txt.an("</response>");
        }
        else
        {
            txt.an("//JSTARK_AJAX_MSG");
            txt.an("alert(\"처리중 오류가 발생하였습니다.\");");
        }

        return txt.toString();
    }

    @Link("/example/sample/sample_auto_complete.do")
    public String doSampleAutoComplete() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_auto_complete.jsp";
    }

    @Link("/example/sample/sample_auto_complete_data.do")
    public String doSampleAutoCompleteData() throws Exception
    {
        setDocumentXML();

        Txt txt = new Txt();

        DList list = service.getAutoComplete(ro);

        txt.an("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        txt.an("<response>");

        while(list.next())
        {
            txt.an("<message>");
            txt.an("<obj_nm><![CDATA["+ro.getString("obj_nm")+"]]></obj_nm>");
            txt.an("<jskvar_ac_text><![CDATA["+list.getString("jskvar_ac_text")+"]]></jskvar_ac_text>");
            txt.an("<jskvar_ac_value><![CDATA["+list.getString("jskvar_ac_value")+"]]></jskvar_ac_value>");
            txt.an("</message>");
        }
        if(list.isNull())
        {
            txt.an("<message>");
            txt.an("<obj_nm><![CDATA["+ro.getString("obj_nm")+"]]></obj_nm>");
            txt.an("<jskvar_ac_text><![CDATA[]]></jskvar_ac_text>");
            txt.an("<jskvar_ac_value><![CDATA[]]></jskvar_ac_value>");
            txt.an("</message>");
        }

        txt.an("</response>");

        return txt.toString();
    }

    @Link("/example/sample/sample_webeditor.do")
    public String doSampleWebeditor() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_webeditor.jsp";
    }

    @Link("/example/sample/sample_webeditor_modify.do")
    public String doSampleWebeditorModify() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_webeditor_modify.jsp";
    }

    @Link("/example/sample/sample_webeditor_body.do")
    public String doSampleWebeditorBody() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_webeditor_body.jsp";
    }

    @Link("/example/sample/sample_webeditor_modify_save.do")
    public String doSampleWebeditorModifySave() throws Exception
    {
        ro.setRenameKey("jskvar_webedit_content","content");

        return doSampleWebeditor();
    }

    @Link("/example/sample/sample_clob.do")
    public String doSampleClob() throws Exception
    {
        SimpleDataBase db = new SimpleDataBase();

        db.query(" select a,b from sample_clob order by a desc ");
        DList list = db.executeDList();

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_clob.jsp";
    }

    @Link("/example/sample/sample_clob_insert_save.do")
    public String doSampleClobInsertSave() throws Exception
    {
        service.setClob(ro);

        return doSampleClob();
    }

    @Link("/example/sample/sample_clob_delete_save.do")
    public String doSampleClobDeleteSave() throws Exception
    {
        SimpleDataBase db = new SimpleDataBase();

        db.query(" delete from sample_clob where a=:a ");
        db.set("a", ro.getString("a"));
        db.execute();

        return doSampleClob();
    }

    @Link("/example/sample/sample_blob.do")
    public String doSampleBlob() throws Exception
    {
        String dbms = CoreUtils.getDBMS();

        if(DBMS.ORACLE.equals(dbms))
        {
            SimpleDataBase db = new SimpleDataBase();
            db.query(" select a,c from sample_blob order by a desc ");
            DList list = db.executeDList();

            addModel("list", list);

            return "view:/WEB-INF/jsp/home/example/sample/sample_blob.jsp";
        }
        else
        {
            return "sorry, this database is not support.";
        }
    }

    @Link("/example/sample/sample_blob_upload_save.do")
    @Upload("example_sample_file")
    public String doSampleBlobUploadSave() throws Exception
    {
    	service.setBlob(ro);

        Txt txt = new Txt();

        txt.an("<script type=\"text/javascript\">");
        txt.an("parent.parent.jskfn_alert('처리가 완료되었습니다.');");
        txt.an("parent.location='"+jcontext+"/example/sample/sample_blob.do';");
        txt.an("</script>");

        return txt.toString();
    }

    @Link("/example/sample/sample_blob_download_save.do")
    public void doSampleBlobDownloadSave() throws Exception
    {
        try
        {
            DData data = service.getBlob(ro);

            byte[] blob_byte = data.getBlob("b");

            String name = data.getString("c");

            if(!data.nullString("c"))
            {
                HttpRequest.toFileDownload(ro, blob_byte, name);
            }
        }
        catch(Exception e)
        {
        }
    }

    @Link("/example/sample/sample_blob_delete_save.do")
    public String doSampleBlobDeleteSave() throws Exception
    {
        SimpleDataBase db = new SimpleDataBase();

        db.query(" delete from sample_blob where a=:a ");
        db.set("a", ro.getString("a"));
        db.execute();

        return doSampleBlob();
    }

    @Link("/example/sample/sample_calendar.do")
    public String doSampleCalendar() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_calendar.jsp";
    }

    @Link("/example/sample/sample_select.do")
    public String doSampleSelect() throws Exception
    {
        DList list = service.getList(ro);

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_select.jsp";
    }

    @Link("/example/sample/sample_chart.do")
    public String doSampleChart() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_chart.jsp";
    }

    @Link("/example/sample/sample_chart_left.do")
    public String doSampleChartLeft() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_chart_left.jsp";
    }

    @Link("/example/sample/sample_chart_right.do")
    public String doSampleChartRight() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_chart_right.jsp";
    }

    @Link("/example/sample/sample_tooltip.do")
    public String doSampleTooltip() throws Exception
    {
        ro.setDefault("j_tab", "A");
        return "view:/WEB-INF/jsp/home/example/sample/sample_tooltip.jsp";
    }

    @Link("/example/sample/sample_dynamic_table.do")
    public String doSampleDynamicTable() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_dynamic_table.jsp";
    }

    @Link("/example/sample/sample_touch.do")
    public String doSampleTouch() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_touch.jsp";
    }

    @Link("/example/sample/sample_grid.do")
    public String doSampleGrid() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_grid.jsp";
    }

    @Link("/example/sample/sample_list_group.do")
    public String doSampleGroup() throws Exception
    {
        DList list = null;
        if(JCache.isDList("SampleService.getListCache"))
        {
            list = JCache.getDList("SampleService.getListCache");
        }
        else
        {
            list = service.getListCache();
        }

        addModel("list", list);

        return "view:/WEB-INF/jsp/home/example/sample/sample_list_group.jsp";
    }

    @Link("/example/sample/sample_scroll_paging.do")
    public String doSampleScrollPaging() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_scroll_paging.jsp";
    }

    @Link("/example/sample/sample_pdf_page.do")
    public String doSamplePdfPage() throws Exception
    {
        return "view:/WEB-INF/jsp/home/example/sample/sample_pdf_page.jsp";
    }

    @Link("/example/sample/sample_pdf.do")
    public void doSamplePdf() throws Exception
    {
        PdfUtils.makeHTMLtoPDF(ro, "http://localhost/example/sample/sample_pdf_page.do", "sample.pdf");
    }


    @Link("/example/sample/sample_ldap.do")
    public String doSampleLDAP() throws Exception
    {
        boolean flag = false;

        JConfigEx cx = JConfigEx.getInstance("platform");
        LdapUtils ldap = new LdapUtils(cx.getString("platform", "ldap.providerURL"), cx.getString("platform", "ldap.searchBASE"), cx.getString("platform", "ldap.searchGROUP"), cx.getString("platform", "ldap.searchID"), cx.getString("platform", "ldap.searchPW"));

        if(ldap.isUser(ro.getString("u_id"), ro.getString("u_pw")))
        {
            flag = true;

            HashMap map = ldap.getUserInfo(ro.getString("u_id"), new String[]{"displayName", "Company", "department", "mail", "mobile", "title", "lastLogonTimestamp", "pwdLastSet"});

            if(map != null)
            {
                String displayName = (String) map.get("displayName");
                String company = (String) map.get("Company");
                String department = (String) map.get("department");
                String mail = (String) map.get("mail");
                String mobile = (String) map.get("mobile");
                String title = (String) map.get("title");
                String lastLogonTimestamp = (String) map.get("lastLogonTimestamp");
                String pwdLastSet = (String) map.get("pwdLastSet");

                JLog.test("displayName:"+displayName);
                JLog.test("company:"+company);
                JLog.test("department:"+department);
                JLog.test("mail:"+mail);
                JLog.test("mobile:"+mobile);
                JLog.test("title:"+title);
                JLog.test("lastLogonTimestamp:"+lastLogonTimestamp);
                JLog.test("pwdLastSet:"+pwdLastSet);
            }
        }

        return flag+"";
    }

}


