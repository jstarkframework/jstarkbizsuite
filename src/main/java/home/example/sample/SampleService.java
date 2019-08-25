package home.example.sample;

import java.util.ArrayList;

import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.DData;
import org.jstark.framework.core.DList;
import org.jstark.framework.core.DataBase;
import org.jstark.framework.core.JCache;
import org.jstark.framework.core.JKey;
import org.jstark.framework.core.JStarkService;
import org.jstark.framework.core.MemDB;
import org.jstark.framework.core.RequestObject;
import org.jstark.framework.core.ServiceFactory;
import org.jstark.framework.core.hs.FileBean;
import org.jstark.framework.core.hs.Xif;
import org.jstark.utils.FileUtils;

public class SampleService extends JStarkService
{
    public static SampleService getInstance()
    {
        return (SampleService) ServiceFactory.getInstance(SampleService.class);
    }

    public DList getList(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        ArrayList open_year = ro.getArrayList("open_year");
        db.defineArray("open_year", open_year.size());

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                    ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a          ");

            db.query(" where 1=1                          ");

            if(!ro.nullString("search_title"))
            {
                db.query(" and title like '%'||:title||'%'     ");

                //어느 위치에서나 값을 Binding 가능
                db.set("title", ro.getString("search_title"));
            }

            if(!ro.nullString("open_year"))
            {
                db.query(" and open_year in (:open_year)");
                db.set("open_year", open_year, false);
            }

            if(ro.equals("jskvar_sort",new String[]{"title", "money", "open_year"}) || ro.equals("jskvar_sort_type", new String[]{"asc", "desc"}))
            {
                db.defineText("jskvar_sort", ro.getString("jskvar_sort"));
                db.defineText("jskvar_sort_type", ro.getString("jskvar_sort_type"));

                db.query(" order by ;jskvar_sort ;jskvar_sort_type");
            }
            else
            {
                db.query(" order by money desc             ");
            }
        }
        else if(db.isMSSQL)
        {
            db.query(" select                    ");

            if(ro.equals("jskvar_sort",new String[]{"title", "money", "open_year"}) && ro.equals("jskvar_sort_type", new String[]{"asc", "desc"}))
            {
                db.defineText("jskvar_sort", ro.getString("jskvar_sort"));
                db.defineText("jskvar_sort_type", ro.getString("jskvar_sort_type"));

                db.query(" row_number() over (order by ;jskvar_sort ;jskvar_sort_type) as jstark_row, ");
            }
            else
            {
                db.query(" row_number() over (order by money desc) as jstark_row, ");
            }

            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a (nolock) ");

            db.query(" where 1=1                        ");

            if(!ro.nullString("search_title"))
            {
                db.query(" and title like '%'+:title+'%'     ");

                //어느 위치에서나 값을 Binding 가능
                db.set("title", ro.getString("search_title"));
            }

            if(!ro.nullString("open_year"))
            {
                db.query(" and open_year in (:open_year)");
                db.set("open_year", open_year, false);
            }
        }
        else if(db.isMARIADB)
        {
            db.query(" select                    ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a          ");

            db.query(" where 1=1                                    ");

            if(!ro.nullString("search_title"))
            {
                db.query(" and title like concat(concat('%',:title),'%') ");

                //어느 위치에서나 값을 Binding 가능
                db.set("title", ro.getString("search_title"));
            }

            if(!ro.nullString("open_year"))
            {
                db.query(" and open_year in (:open_year)");
                db.set("open_year", open_year, false);
            }

            if(ro.equals("jskvar_sort",new String[]{"title", "money", "open_year"}) || ro.equals("jskvar_sort_type", new String[]{"asc", "desc"}))
            {
                db.defineText("jskvar_sort", ro.getString("jskvar_sort"));
                db.defineText("jskvar_sort_type", ro.getString("jskvar_sort_type"));

                db.query(" order by ;jskvar_sort ;jskvar_sort_type");
            }
            else
            {
                db.query(" order by money desc       ");
            }
        }
        else if(db.isPOSTGRESQL)
        {
            db.query(" select                        ");

            if(ro.equals("jskvar_sort",new String[]{"title", "money", "open_year"}) && ro.equals("jskvar_sort_type", new String[]{"asc", "desc"}))
            {
                db.defineText("jskvar_sort", ro.getString("jskvar_sort"));
                db.defineText("jskvar_sort_type", ro.getString("jskvar_sort_type"));

                db.query(" row_number() over (order by ;jskvar_sort ;jskvar_sort_type) as jstark_row, ");
            }
            else
            {
                db.query(" row_number() over (order by money desc) as jstark_row, ");
            }

            db.query(" a.*                                 ");
            db.query(" from                                ");
            db.query(" sample_content a                    ");
            db.query(" where 1=1                          ");
            if(!ro.nullString("search_title"))
            {
                db.query(" and title like '%'||:title||'%'     ");

                //어느 위치에서나 값을 Binding 가능
                db.set("title", ro.getString("search_title"));
            }

            if(!ro.nullString("open_year"))
            {
                db.query(" and open_year in (:open_year)");
                db.set("open_year", open_year, false);
            }
        }

        //페이징 처리 Statement
        db.preparePage();
        //Statement 종류
        // 1. prepare()      : 일반적인 Statement
        // 2. prepareCall()  : prepareCall Statement
        // 3. preparePage()  : 페이징처리 Statement, 페이지설정 : setPage(page, pagenum), 한번 쿼리, 페이지처리 기본 Statement
        // 4. prepareNPage() : 페이지처리 Statement, 페이지설정 : setPage(page, pagenum), 두번 쿼리, STOPKEY

        //페이지 번호, 한페이지당 갯수
        db.setPage(ro.getPage("j_page"), 10);
        db.execute();

        //결과를 DList로 가져옴
        return db.getDList();
    }

    public DList getOpenYear(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query("select open_year from sample_content group by open_year");
        db.prepare();
        //db.set("", ro.getString(""));
        db.execute();

        return db.getDList();
    }

    public DList getListWithRedis(RequestObject ro) throws Exception
    {
        String key = "sample."+ro.getString("search_title")+"."+ro.getPage("j_page");

        MemDB memdb = MemDB.getInstance();

        if(memdb.isDList(key))
        {
            return memdb.getDList(key);
        }

        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                    ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a          ");
            if(!ro.nullString("search_title"))
            {
                db.query(" where                           ");
                db.query(" title like '%'||:title||'%'     ");
                db.set("title", ro.getString("search_title"));
            }
            db.query(" order by money desc       ");
        }
        else if(db.isMSSQL)
        {
            db.query(" select                    ");
            db.query(" row_number() over (order by money desc) as jstark_row, ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a (nolock) ");
            if(!ro.nullString("search_title"))
            {
                db.query(" where                         ");
                db.query(" title like '%'+:title+'%'     ");
                db.set("title", ro.getString("search_title"));
            }
        }
        else if(db.isMARIADB)
        {
            db.query(" select                    ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a          ");
            if(!ro.nullString("search_title"))
            {
                db.query(" where                                         ");
                db.query(" title like concat(concat('%',:title),'%')     ");
                db.set("title", ro.getString("search_title"));
            }
            db.query(" order by money desc       ");
        }
        else if(db.isPOSTGRESQL)
        {
            db.query(" select                    ");
            db.query(" row_number() over (order by money desc) as jstark_row, ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a          ");
            if(!ro.nullString("search_title"))
            {
                db.query(" where                           ");
                db.query(" title like '%'||:title||'%'     ");
                db.set("title", ro.getString("search_title"));
            }
        }

        db.preparePage();
        db.setPage(ro.getPage("j_page"), 10);
        db.execute();

        DList list = db.getDList();

        memdb.setDList(key, list, 60);

        return list;
    }

    public DList getListIn(RequestObject ro) throws Exception
    {
        ArrayList mid = ro.getArrayList("mid");

        DataBase db = getDatabase();

        db.defineArray("mid", mid.size());

        db.query(" select * from sample_content where mid in (:mid) ");

        db.prepare();
        db.set("mid", mid, true);
        db.execute();

        DList list = db.getDList();

        return list;
    }

    public DList getListCache() throws Exception
    {
        //캐쉬 검사
        if(JCache.isDList("SampleService.getListCache"))
        {
            return JCache.getDList("SampleService.getListCache");
        }

        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                                              ");
            db.query(" *                                                   ");
            db.query(" from                                                ");
            db.query(" (                                                   ");
            db.query("     select                                          ");
            db.query("     a.*,                                            ");
            db.query("     rank() over(order by money desc) rank           ");
            db.query("     from                                            ");
            db.query("     sample_content a                                ");
            db.query(" ) t                                                 ");
            db.query(" order by open_year desc                             ");
        }
        else if(db.isMSSQL)
        {
            db.query(" select                                              ");
            db.query(" *                                                   ");
            db.query(" from                                                ");
            db.query(" (                                                   ");
            db.query("     select                                          ");
            db.query("     a.*,                                            ");
            db.query("     row_number() over(order by money desc) rank     ");
            db.query("     from                                            ");
            db.query("     sample_content a (nolock)                       ");
            db.query(" ) t                                                 ");
            db.query(" order by open_year desc                             ");
        }
        else if(db.isMARIADB)
        {
            db.query(" select                                              ");
            db.query(" *                                                   ");
            db.query(" from                                                ");
            db.query(" (                                                   ");
            db.query("     select                                          ");
            db.query("     a.*,                                            ");
            db.query("     @curRank := @curRank + 1 AS rank                ");
            db.query("     from                                            ");
            db.query("     sample_content a, (SELECT @curRank := 0) r order by money desc ");
            db.query(" ) t                                                 ");
            db.query(" order by open_year desc                             ");
        }
        else if(db.isPOSTGRESQL)
        {
            db.query(" select                                              ");
            db.query(" *                                                   ");
            db.query(" from                                                ");
            db.query(" (                                                   ");
            db.query("     select                                          ");
            db.query("     a.*,                                            ");
            db.query("     row_number() over(order by money desc) rank     ");
            db.query("     from                                            ");
            db.query("     sample_content a                                ");
            db.query(" ) t                                                 ");
            db.query(" order by open_year desc                             ");
        }

        //기본 Statement
        db.prepare();
        db.execute();

        DList list = db.getDList();

        //캐쉬 등록
        JCache.setDList("SampleService.getListCache", list);

        return list;

    }

    public DList getListTransaction() throws Exception
    {
        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                     ");
            db.query(" title                      ");
            db.query(" from                       ");
            db.query(" sample_content a           ");
            db.query(" where 10=:ten              ");
            db.query(" and 10=:ten                ");
            db.query(" and rownum=1               ");
        }
        else if(db.isMSSQL)
        {
            db.query(" select                     ");
            db.query(" top 1 title                ");
            db.query(" from                       ");
            db.query(" sample_content a (nolock)  ");
            db.query(" where 10=:ten              ");
            db.query(" and 10=:ten                ");
        }
        else if(db.isMARIADB || db.isPOSTGRESQL)
        {
            db.query(" select                     ");
            db.query(" title                      ");
            db.query(" from                       ");
            db.query(" sample_content a           ");
            db.query(" where 10=:ten              ");
            db.query(" and 10=:ten                ");
            db.query(" limit 1                    ");
        }
        db.prepare();
        db.set("ten", 10);
        db.execute();

        //쿼리 실행 결과값이 하나 일 경우 바로 db.get*으로 데이터 가져오기 가능
        String title = db.getString("title");

        db.query(" select             ");
        db.query(" title              ");
        db.query(" from               ");
        db.query(" sample_content a   ");
        db.query(" where title=:a     ");
        db.query(" order by title     ");
        db.prepare();
        db.set("title", title);
        db.execute();

        return db.getDList();
    }

    public DList getListXQuery(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        Xif xif = new Xif();
        if(ro.getBoolean("excel_flag"))
        {
            xif.add("excel");
        }
        else if(ro.getBoolean("image_flag"))
        {
            xif.add("image");
        }

        if(db.isORACLE || db.isCUBRID || db.isPOSTGRESQL)
        {
           //XML에서 쿼리를 가져옴
            db.xquery("home.example.sample.attachment_oracle.attachment_list", xif);
        }
        else if(db.isMSSQL)
        {
            //XML에서 쿼리를 가져옴
            db.xquery("home.example.sample.attachment_mssql.attachment_list", xif);
        }
        else if(db.isMARIADB)
        {
            //XML에서 쿼리를 가져옴
            db.xquery("home.example.sample.attachment_mariadb.attachment_list", xif);
        }

        db.prepare();
        //db.set("","");
        db.execute();

        return db.getDList();
    }

    public ArrayList getListBean(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                    ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a          ");
            db.query(" order by money desc       ");
        }
        else if(db.isMSSQL)
        {
            db.query(" select                    ");
            db.query(" row_number() over (order by money desc) as jstark_row, ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a (nolock) ");
        }
        else if(db.isMARIADB)
        {
            db.query(" select                    ");
            db.query(" a.*                       ");
            db.query(" from                      ");
            db.query(" sample_content a          ");
            db.query(" order by money desc       ");
        }
        else if(db.isPOSTGRESQL)
        {
            db.query(" select                        ");
            db.query(" row_number() over (order by money desc) as jstark_row, ");
            db.query(" a.*                                 ");
            db.query(" from                                ");
            db.query(" sample_content a                    ");
        }

        db.preparePage();
        db.setPage(ro.getPage("j_page"), 10);
        db.execute();

        return db.getDList(SampleBean.class);
    }

    public DData getInfo(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                         ");
            db.query(" mid,title,money,open_year      ");
            db.query(" from                           ");
            db.query(" sample_content                 ");
            db.query(" where                          ");
            db.query(" mid=:mid                       ");
            db.query(" and rownum=1                   ");
        }
        else if(db.isMSSQL)
        {
            db.query(" select                         ");
            db.query(" top 1 mid,title,money,open_year");
            db.query(" from                           ");
            db.query(" sample_content (nolock)        ");
            db.query(" where                          ");
            db.query(" mid=:mid                       ");
        }
        else if(db.isMARIADB || db.isPOSTGRESQL)
        {
            db.query(" select                         ");
            db.query(" mid,title,money,open_year      ");
            db.query(" from                           ");
            db.query(" sample_content                 ");
            db.query(" where                          ");
            db.query(" mid=:mid                       ");
            db.query(" limit 1                        ");
        }

        db.prepare();
        db.set("mid", ro.getString("mid"));
        db.execute();

        //디버그출력
        CoreUtils.debug("디버그 TEST");

        //쿼리 수행 결과를 DData로 가져옴
        return db.getDData();

    }

    public SampleBean getInfoBean(SampleBean bean) throws Exception
    {
        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                         ");
            db.query(" mid,title,money,open_year      ");
            db.query(" from                           ");
            db.query(" sample_content                 ");
            db.query(" where                          ");
            db.query(" mid=:mid                       ");
            db.query(" and rownum=1                   ");
        }
        else if(db.isMSSQL)
        {
            db.query(" select                         ");
            db.query(" top 1 mid,title,money,open_year");
            db.query(" from                           ");
            db.query(" sample_content (nolock)        ");
            db.query(" where                          ");
            db.query(" mid=:mid                       ");
        }
        else if(db.isMARIADB || db.isPOSTGRESQL)
        {
            db.query(" select                         ");
            db.query(" mid,title,money,open_year      ");
            db.query(" from                           ");
            db.query(" sample_content                 ");
            db.query(" where                          ");
            db.query(" mid=:mid                       ");
            db.query(" limit 1                        ");
        }

        db.prepare();
        db.set("mid", bean.getMid());
        db.execute();

        return (SampleBean) db.getDData(SampleBean.class);
    }

    public DData getDataXQuery(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID || db.isPOSTGRESQL)
        {
            //XML에서 쿼리를 가져옴
            db.xquery("home.example.sample.attachment_oracle.attachment_info", null);
        }
        else if(db.isMSSQL)
        {
            //XML에서 쿼리를 가져옴
            db.xquery("home.example.sample.attachment_mssql.attachment_info", null);
        }
        else if(db.isMARIADB)
        {
            //XML에서 쿼리를 가져옴
            db.xquery("home.example.sample.attachment_mariadb.attachment_info", null);
        }

        db.prepare();
        db.set("fid", ro.getString("fid"));
        db.execute();

        return db.getDData();
    }

    public void setInsert(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        String mid = JKey.getSequence("M");

        db.query(" insert into sample_content(mid,title,money,open_year) ");
        db.query(" values(:seq,:title,:money,:open_year)                 ");

        db.prepare();
        db.set("seq", mid);
        db.set("title", CoreUtils.reHtml(ro.getString("title")));
        db.set("money", ro.getLong("money"));
        db.set("open_year", ro.getString("open_year"));
        db.execute();

        ro.set("mid", mid);

        //캐쉬 갱신 및 등록 설정, 캐쉬 미 사용시 필요없음.
        JCache.remove("SampleService.getListCache");
    }

    public void setInsert(SampleBean bean) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" insert into sample_content(mid,title,money,open_year) ");
        db.query(" values(:seq,:title,:money,:open_year)                 ");

        db.prepare();
        db.set("seq", JKey.getSequence("M"));
        db.set("title", bean.getTitle());
        db.set("money", bean.getMoney());
        db.set("open_year", bean.getOpenYear());
        db.execute();

        //캐쉬 갱신 및 등록 설정, 캐쉬 미 사용시 필요없음.
        JCache.remove("SampleService.getListCache");
    }

    public void setUpdate(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" update sample_content set                      ");
        db.query(" title=:title,money=:money,open_year=:open_year ");
        db.query(" where mid=:mid                                 ");
        db.prepare();
        db.set("mid", ro.getString("mid"));
        db.set("title", CoreUtils.reHtml(ro.getString("title")));
        db.set("money", ro.getLong("money"));
        db.set("open_year", ro.getString("open_year"));
        db.execute();

        //캐쉬 갱신 및 등록 설정, 캐쉬 미 사용시 필요없음.
        JCache.remove("SampleService.getListCache");
    }

    public void setDelete(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" delete from sample_content where mid=:mid ");
        db.prepare();
        db.set("mid", ro.getString("mid"));
        db.execute();

        //캐쉬 갱신 및 등록 설정, 캐쉬 미 사용시 필요없음.
        JCache.remove("SampleService.getListCache");
    }

    public void setExcelInsert(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        FileBean[] file = ro.getFiles("attach_file");

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" insert into sample_file(fid,file_name,file_save,file_path,file_ext,file_size,a_date)      ");
            db.query(" values(:fid,:file_name,:file_save,:file_path,:file_ext,:file_size,sysdate)                ");
        }
        else if(db.isMSSQL)
        {
            db.query(" insert into sample_file(fid,file_name,file_save,file_path,file_ext,file_size,a_date)      ");
            db.query(" values(:fid,:file_name,:file_save,:file_path,:file_ext,:file_size,getdate())              ");
        }
        else if(db.isMARIADB || db.isPOSTGRESQL)
        {
            db.query(" insert into sample_file(fid,file_name,file_save,file_path,file_ext,file_size,a_date)      ");
            db.query(" values(:fid,:file_name,:file_save,:file_path,:file_ext,:file_size,now())                  ");
        }

        db.prepare();

        //여러번 BINDING
        for(int i=0,i_size=file.length;i<i_size;i++)
        {
            if(file[i].exists)
            {
                //파일키
                db.set("fid", JKey.getSequence("F"));

                //파일명
                db.set("file_name", file[i].name);
                //저장명
                db.set("file_save", file[i].save);
                //저장위치
                db.set("file_path", file[i].path);
                //확장자
                db.set("file_ext", file[i].ext);
                //파일크기
                db.set("file_size", file[i].size);

                db.execute();
            }
        }

    }

    public void setExcelDelete(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" select                                                      ");
        db.query(" fid,file_name,file_save,file_path,file_ext,file_size,a_date ");
        db.query(" from                                                        ");
        db.query(" sample_file                                                 ");
        db.query(" where                                                       ");
        db.query(" fid=:fid                                                    ");
        db.prepare();
        db.set("fid", ro.getString("fid"));
        db.execute();
        DData data = db.getDData();

        //파일 삭제
        FileUtils.deleteFile(data.getString("file_path")+data.getString("file_save"));

        db.query(" delete from sample_file where fid=:fid ");
        db.prepare();
        db.set("fid", ro.getString("fid"));
        db.execute();
    }

    public void setDataRequestObject(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" insert into sample_content(mid,title,money,open_year) values(:mid, :title, :money, :open_year) ");
        db.prepare();
        db.setCookie(ro);
        db.setSession(ro);
        db.setParameter(ro);
        db.set("mid",JKey.getSequence("M"));
        db.execute();
    }

    //create table sample_clob(a varchar2(30),b clob);
    //create table sample_clob(a varchar2(30),b text);
    public void setClob(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        String seq = JKey.getSequence("C");

        if(db.isORACLE)
        {
            /*
            //new type (Use Oracle 10g driver jdbc api)

            db.query(" insert into sample_clob(a,b) values(:a,:b) ");
            db.prepare();
            db.set("a",seq);
            db.set("b", ro.getString("b"));
            db.execute();
            */

            //old type
            //clob이 들어갈 자리에 empty_clob()으로 채움
            db.query(" insert into sample_clob(a,b) values(:a,empty_clob()) ");
            db.prepare();
            db.set("a", seq);
            db.execute();

            //clob 데이터를 넣을 칼럼을 for update로 읽어옴
            db.query(" select b from sample_clob where a=:a for update ");
            db.prepare();
            db.set("a", seq);
            db.execute();
            //clob 데이터를 넣음.
            db.setClob(ro.getString("b"));
        }
        else if(db.isMSSQL || db.isMARIADB || db.isCUBRID || db.isPOSTGRESQL)
        {
            db.query(" insert into sample_clob(a,b) values(:a,:b) ");
            db.prepare();
            db.set("a", seq);
            db.set("b", ro.getString("b"));
            db.execute();
        }
    }

    public DData getClob(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" select * from sample_clob where a=:a ");
        db.prepare();
        db.set("a", ro.getString("a"));
        db.execute();
        return db.getDData();

    }

    //create table sample_blob(a varchar2(30),b blob,c varchar2(50));
    public void setBlob(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        if(!ro.nullString("file"))
        {
            String seq = JKey.getSequence("B-");

            //blob이 들어갈 자리에 empty_blob()으로 채움
            db.query(" insert into sample_blob(a,b,c) values(:a,empty_blob(),:c) ");
            db.prepare();
            db.set("a", seq);
            db.set("c", ro.getFile("file").name);
            db.execute();

            //blob 데이터를 넣을 칼럼을 for update로 읽어옴
            db.query(" select b from sample_blob where a=:a for update ");
            db.prepare();
            db.set("a", seq);
            db.execute();

            //파일 경로.
            db.setBlob(ro.getFile("file").path+ro.getFile("file").save);
        }
    }

    public DData getBlob(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" select * from sample_blob where a=:a ");
        db.prepare();
        db.set("a", ro.getString("a"));
        db.execute();
        return db.getDData();
    }

    public void setLong(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" insert into sample_long(content,a,b,c) values(:content,:a,:b) ");
        db.prepare();
        db.setCharacterStream(1, ro.getString("content"));
        db.set("a", ro.getString("a"));
        db.set("b", ro.getString("b"));
        db.execute();

    }

    public String getProcedure(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        String sequence = "";

        //앞뒤 공백 제거
        db.query("{call jstark_sp_get_sequence(?, ?, ?)}");
        db.prepareCall();
        db.setString(1, ro.getString("a"));
        db.setString(2, ro.getString("b"));
        //Procedure로 부터 리턴된 값 받음
        db.registerOutParameter(3, java.sql.Types.VARCHAR);
        db.execute();
        //Procedure로 부터 리턴된 값 가져옴
        sequence = db.getString(3);

        return sequence;
    }

    public DList getProcedureCursor() throws Exception
    {
        DataBase db = getDatabase();

        /*
        create or replace package types
        as
           type cursortype is ref cursor;
        end;


        create or replace procedure test_sp(ora_cur out types.cursortype)
        is
          begin
              open ora_cur for
                       select m_name from jstark_menu where rownum<10;
        end;
        */

        //앞뒤 공백 제거
        db.query("{call test_sp(?)}");
        db.prepareCall();
        //Procedure로 부터 리턴된 값 받음
        db.registerOutParameter(1, oracle.jdbc.driver.OracleTypes.CURSOR);
        db.execute();

        //Procedure로 부터 리턴된 Cursor을 DList로 가져옴
        return db.getDList();

    }

    public DList getProcedureExec(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query("exec jstark_sp_get_sequence @param1=:param1, @param2=:param2");
        db.prepare();
        db.set("param1", ro.getString("param1"));
        db.set("param2", ro.getString("param2"));
        db.execute();

        return db.getDList();
    }

    public void setBatch(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        db.query(" insert into sample_batch(a,b,c) values(:a,:b,:c) ");
        db.prepare();

        for(int i=0,array_size=ro.getArrayList("a").size();i<array_size;i++)
        {
            db.set("a", ro.getString("a"));
            db.set("b", ro.getString("b"));
            db.set("c", ro.getArrayList("a").get(i).toString());
            //Batch에 등록
            db.addBatch();
        }
        //Batch 실행함.
        db.executeBatch();
    }

    public void setBatchList(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        DList list = new DList();
        int max_buffer = 1000;
        while(list.next())
        {
            db.query(" insert into sample_batch(a,b,c) values(:a,:b,:c) ");
            db.prepare();

            for(int i=1;i<=max_buffer;i++)
            {
                db.set("a", list.getString("a"));
                db.set("b", list.getString("b"));
                db.set("c", list.getString("c"));

                db.addBatch();

                if(list.isLast())
                {
                    break;
                }
                else if(i!=max_buffer)
                {
                    list.next();
                }
            }

            db.executeBatch();
        }
    }

    public DList getAutoComplete(RequestObject ro) throws Exception
    {
        DataBase db = getDatabase();

        if(db.isORACLE || db.isCUBRID)
        {
            db.query(" select                                    ");
            db.query(" mid jskvar_ac_value, title jskvar_ac_text ");
            db.query(" from                                      ");
            db.query(" sample_content a                          ");
            db.query(" where                                     ");
            db.query(" title like :title                         ");
            db.query(" and rownum<10                             ");
            db.query(" order by title desc                       ");
        }
        else if(db.isMSSQL)
        {
            db.query(" select                                           ");
            db.query(" top 10 mid jskvar_ac_value, title jskvar_ac_text ");
            db.query(" from                                             ");
            db.query(" sample_content a (nolock)                        ");
            db.query(" where                                            ");
            db.query(" title like :title                                ");
            db.query(" order by title desc                              ");
        }
        else if(db.isMARIADB)
        {
            //mariadb의 alias에 문제가 있음. 가끔 오류 발생, 한번 감싸야 함.
            db.query(" select                                         ");
            db.query(" jskvar_ac_value, jskvar_ac_text                ");
            db.query(" from                                           ");
            db.query(" (                                              ");
            db.query("     select                                     ");
            db.query("     mid jskvar_ac_value, title jskvar_ac_text  ");
            db.query("     from                                       ");
            db.query("     sample_content a                           ");
            db.query("     where                                      ");
            db.query("     title like :title                          ");
            db.query(" ) t1                                           ");
            db.query(" order by jskvar_ac_text desc                   ");
            db.query(" limit 10                                       ");
        }
        else if(db.isPOSTGRESQL)
        {
            db.query(" select                                    ");
            db.query(" mid jskvar_ac_value, title jskvar_ac_text ");
            db.query(" from                                      ");
            db.query(" sample_content a                          ");
            db.query(" where                                     ");
            db.query(" title like :title                         ");
            db.query(" order by title desc                       ");
            db.query(" limit 10                                  ");
        }
        db.prepare();
        db.set("title", "%"+ro.getString("jskvar_ac_word")+"%");
        db.execute();

        return db.getDList();

    }

    public void setRedis() throws Exception
    {
        MemDB memdb = MemDB.getInstance();

        memdb.set("testkey", "Redis TEST");
    }

    public String getRedis() throws Exception
    {
        MemDB memdb = MemDB.getInstance();

        return memdb.get("testkey");
    }
}