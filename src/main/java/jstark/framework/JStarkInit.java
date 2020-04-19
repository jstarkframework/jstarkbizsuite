package jstark.framework;

import org.jstark.platform.core.LangUtils;

import jstark.init.InitialDataService;

/** JSTARK FRAMEWORK 초기 기동
 *
 * @author jstark
 *
 */
public class JStarkInit
{
    /** FRAMEWORK 초기 기동시 호출되는 Method.
     * do not touch
     */
    public static void init()
    {
        LangUtils.init();
        
        try
        {
            InitialDataService.getInstance().setInitialData(null);
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
