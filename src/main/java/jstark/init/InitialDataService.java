package jstark.init;

import java.io.File;
import java.util.ArrayList;

import org.jstark.framework.core.CoreUtils;
import org.jstark.framework.core.DData;
import org.jstark.framework.core.JLog;
import org.jstark.framework.core.JStarkService;
import org.jstark.framework.core.RequestObject;
import org.jstark.framework.core.ServiceFactory;
import org.jstark.framework.core.SimpleDataBase;
import org.jstark.framework.core.hs.ApplicationMaster;
import org.jstark.framework.core.hs.DBMS;
import org.jstark.platform.core.LangUtils;
import org.jstark.utils.ExcelUtils;

public class InitialDataService extends JStarkService
{
    public static InitialDataService getInstance()
    {
        return (InitialDataService) ServiceFactory.getInstance(InitialDataService.class);
    }

    public void setInitialData(RequestObject ro) throws Exception
    {


        SimpleDataBase db = new SimpleDataBase();
        db.query("select count(*) cnt from jstark_user");
        DData data = db.executeDData();

        if(data.getInt("cnt")==0)
        {
            String filepath = ApplicationMaster.getJStarkHome()+File.separator+ApplicationMaster.getJStarkName()+File.separator+"WEB-INF"+File.separator+"resource"+File.separator+"setup"+File.separator+"jstark_database"+File.separator+"jstark_data.xlsx";

            JLog.info("\n  JSTARK INITIAL DATA CHECKING...");

            JLog.info("   "+filepath+"\n");

            String dbms = CoreUtils.getDBMS();

            ExcelUtils excel=ExcelUtils.getInstance();
            String[][][] sheet_list=excel.getExcel(filepath);

            String tablename="";
            ArrayList column = new ArrayList();
            ArrayList value = new ArrayList();

            for(int i=0;i<sheet_list.length;i++)
            {
                tablename=sheet_list[i][0][0];

                JLog.info("    Importing Table >> "+tablename);

                String col="";
                String col_bind="";
                String query="";

                column = new ArrayList();

                for(int j=1;j<2;j++)
                {
                    for(int k=0;k<sheet_list[i][j].length;k++)
                    {
                        column.add(sheet_list[i][j][k]);
                        if(k==0)
                        {
                            col+=""+sheet_list[i][j][k];
                            col_bind+=":"+sheet_list[i][j][k];
                        }
                        else
                        {
                            col+=","+sheet_list[i][j][k];
                            col_bind+=", :"+sheet_list[i][j][k];
                        }
                    }
                }

                for(int j=2;j<sheet_list[i].length;j++)
                {
                    value = new ArrayList();

                    for(int k=0;k<sheet_list[i][j].length;k++)
                    {
                        String str = sheet_list[i][j][k];

                        value.add(str);
                    }

                    query=" insert into "+(tablename.toLowerCase())+"("+col+") values("+col_bind+") ";

                    db.query(query);
                    for(int k=0;k<column.size();k++)
                    {
                        if(DBMS.POSTGRESQL.equals(dbms) &&
                          ("C_SORT".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_MIN".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_SPECIAL".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_NUMBER".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_UPPER".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_LOWER".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_SEQ_NUM".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_SEQ_STR".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_ID".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_SPACE".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_DUP".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_CHANGE".equals(column.get(k).toString().toUpperCase()) ||
                           "PW_ALOGIN".equals(column.get(k).toString().toUpperCase()) ||
                           "FAIL_CNT".equals(column.get(k).toString().toUpperCase()) ||
                           "G_SORT".equals(column.get(k).toString().toUpperCase()) ||
                           "TIME_OUT".equals(column.get(k).toString().toUpperCase()) ||
                           "DEPTH1".equals(column.get(k).toString().toUpperCase()) ||
                           "DEPTH2".equals(column.get(k).toString().toUpperCase()) ||
                           "DEPTH3".equals(column.get(k).toString().toUpperCase()) ||
                           "DEPTH4".equals(column.get(k).toString().toUpperCase()) ||
                           "DEPTH5".equals(column.get(k).toString().toUpperCase()) ||
                           "POPUP_WIDTH".equals(column.get(k).toString().toUpperCase()) ||
                           "POPUP_HEIGHT".equals(column.get(k).toString().toUpperCase()) ||
                           "TR_SORT".equals(column.get(k).toString().toUpperCase()) ||
                           "MONEY".equals(column.get(k).toString().toUpperCase())
                            ))
                        {
                            db.set(column.get(k).toString(),CoreUtils.toInt(value.get(k)));
                        }
                        else
                        {
                            db.set(column.get(k).toString(),value.get(k).toString());
                        }
                    }

                    //try
                    //{
                    db.execute();
                    //}
                    //catch(Exception ee)
                    //{
                    //}
                }
            }

            if(DBMS.ORACLE.equals(dbms))
            {
                db.query("update jstark_code set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_code_group set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_lang set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu_auth set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu_group set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_control set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_control_auth set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_security set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_theme set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_tree set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_user set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS'), LAST_PW_CHANGE=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
            }
            else if(DBMS.MSSQL.equals(dbms))
            {
                db.query("update jstark_code set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_code_group set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_lang set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_menu set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_menu_auth set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_menu_group set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_control set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_control_auth set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_security set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_theme set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_tree set a_date=convert(datetime,'20070220 13:58:33')");db.execute();
                db.query("update jstark_user set a_date=convert(datetime,'20070220 13:58:33'), LAST_PW_CHANGE=convert(datetime,'20070220 13:58:33')");db.execute();
            }
            else if(DBMS.MARIADB.equals(dbms))
            {
                db.query("update jstark_code set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_code_group set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_lang set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_menu set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_menu_auth set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_menu_group set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_control set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_control_auth set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_security set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_theme set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_tree set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
                db.query("update jstark_user set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T'), LAST_PW_CHANGE=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T')");db.execute();
            }
            else if(DBMS.CUBRID.equals(dbms))
            {
                db.query("update jstark_code set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_code_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_lang set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_control set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_control_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_security set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_theme set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_tree set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_user set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS'), LAST_PW_CHANGE=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
            }
            else if(DBMS.POSTGRESQL.equals(dbms))
            {
                db.query("update jstark_code set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_code_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_lang set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_menu_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_control set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_control_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_security set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_theme set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_tree set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
                db.query("update jstark_user set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS'), LAST_PW_CHANGE=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS')");db.execute();
            }

            JLog.info("\n  JSTARK DATA INSERT DONE\n");


            LangUtils.init();

        }
    }
}