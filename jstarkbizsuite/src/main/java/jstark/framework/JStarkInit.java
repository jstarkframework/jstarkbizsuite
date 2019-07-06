package jstark.framework;

import org.jstark.platform.core.LangUtils;

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
    }
}
