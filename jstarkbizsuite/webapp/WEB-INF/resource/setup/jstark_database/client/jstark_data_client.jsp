<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %><%
%><%@ page errorPage = "/WEB-INF/jsp/jstark/error/error.jsp" %><%
%><%@ page import = "org.jstark.framework.core.hs.*,org.jstark.framework.core.*,org.jstark.utils.*,java.util.*,java.io.*,jstark.framework.*,org.jstark.platform.core.*" %><%
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%

RequestObject ro = HttpRequest.getObject(request, response);

SimpleDataBase db = new SimpleDataBase();
db.query("select count(*) cnt from jstark_user where client=:client");
db.set("client", ro.getString("client"));
DData data = db.executeDData();

DData client_data = new DData();

client_data.set("jstark_code","X");
client_data.set("jstark_code_group","X");
client_data.set("jstark_lang","X");
client_data.set("jstark_menu","X");
client_data.set("jstark_menu_auth","X");
client_data.set("jstark_menu_group","X");
client_data.set("jstark_control_auth","X");
client_data.set("jstark_security","X");
client_data.set("jstark_theme","X");
client_data.set("jstark_tree","X");
client_data.set("jstark_user","X");
client_data.set("jstark_user_info","X");

if(ro.getInt("client")>0 && data.getInt("cnt")==0)
{
    String dbms = CoreUtils.getDBMS();

	ExcelUtils excel=ExcelUtils.getInstance();
	String[][][] sheet_list=excel.getExcel(ApplicationMaster.getJStarkHome()+File.separator+ApplicationMaster.getJStarkName()+File.separator+"WEB-INF"+File.separator+"resource"+File.separator+"setup"+File.separator+"jstark_database"+File.separator+"jstark_data.xlsx");

	String tablename="";
	ArrayList column = new ArrayList();
	ArrayList value = new ArrayList();

	JLog.info("\n\n\nJSTARK DATA CLIENT START =>");

	for(int i=0;i<sheet_list.length;i++)
	{
	    tablename=sheet_list[i][0][0];

	    if(client_data.equals(tablename,"X"))
	    {

	        JLog.info(tablename);

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
		            if(column.get(k).toString().toUpperCase().equals("CLIENT"))
		            {
		                db.set(column.get(k).toString(), ro.getString("client"));
		            }
		            else
		            {
		                db.set(column.get(k).toString(), value.get(k).toString());
		            }
		        }
		        
		        db.execute();
		    }
	    }
	}

	if(DBMS.ORACLE.equals(dbms))
    {
        db.query("update jstark_code set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_code_group set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_lang set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_auth set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_group set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_control_auth set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_security set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_theme set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_tree set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_user set a_date=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS'), LAST_PW_CHANGE=TO_DATE('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
    }
    else if(DBMS.MSSQL.equals(dbms))
    {
        db.query("update jstark_code set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_code_group set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_lang set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_auth set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_group set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_control_auth set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_security set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_theme set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_tree set a_date=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_user set a_date=convert(datetime,'20070220 13:58:33'), LAST_PW_CHANGE=convert(datetime,'20070220 13:58:33') where client=:client");db.set("client", ro.getString("client"));db.execute();
    }
    else if(DBMS.MARIADB.equals(dbms))
    {
        db.query("update jstark_code set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_code_group set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_lang set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_auth set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_group set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_control_auth set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_security set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_theme set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_tree set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_user set a_date=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T'), LAST_PW_CHANGE=str_to_date(date_format('20070220135833','%Y-%m-%d %T'),'%Y-%m-%d %T') where client=:client");db.set("client", ro.getString("client"));db.execute();
    }
    else if(DBMS.CUBRID.equals(dbms))
    {
        db.query("update jstark_code set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_code_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_lang set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_control_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_security set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_theme set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_tree set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_user set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS'), LAST_PW_CHANGE=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
    }
    else if(DBMS.POSTGRESQL.equals(dbms))
    {
        db.query("update jstark_code set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_code_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_lang set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_menu_group set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_control_auth set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_security set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_theme set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_tree set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
        db.query("update jstark_user set a_date=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS'), LAST_PW_CHANGE=TO_TIMESTAMP('2007/02/20 13:58:33','YYYY/MM/DD HH24:MI:SS') where client=:client");db.set("client", ro.getString("client"));db.execute();
    }

	LangUtils.init();

	JLog.info("JSTARK DATA CLIENT END.\n\n\n");

	ro.setSession("jsk_client", ro.getString("client"));
	
%>
JSTARK DATA CLIENT END.<br />
<br />
<a href="/">Go to Home</a>
<%
}
%>
