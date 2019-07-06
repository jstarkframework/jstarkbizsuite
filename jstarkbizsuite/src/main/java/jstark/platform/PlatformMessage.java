package jstark.platform;

import org.jstark.framework.core.RequestObject;
import org.jstark.framework.core.hs.UserBean;
import org.jstark.framework.web.JStarkUser;

/** FRAMEWORK 예외처리 메시지
 *
 * @author jstark
 *
 */
public class PlatformMessage
{
    /** 오류 발생시 출력되는 메시지 정의
     *
     * @return String 출력메시지
     */
    public static String getErrorMessage()
    {
        return "Sorry for the inconvenience.\\nPlease try again in a few minutes.\\nIf you see this message repeatedly, contact your administrator.";
    }

    /** 스크립트 오류 발생시 출력되는 메시지 정의
     *
     * @return String 출력메시지
     */
    public static String getJavaScriptErrorMessage()
    {
        return "Sorry for the inconvenience.\\nPlease try again in a few minutes.\\nIf you see this message repeatedly, contact your administrator.\\n[ code : script ]";
    }

    /** doMethod 진입 전 오류 발생시 출력되는 메시지 정의
     *
     * @param ro
     * @param err
     * @return String 출력메시지
     */
    public static String getErrorMessage(RequestObject ro, String err)
    {
        UserBean user = JStarkUser.getUser();

        if("KO".equals(user.lang) && err.equals("FileUpload Not Allowed File Type Error"))
        {
            err = "허용하지 않는 첨부파일의 확장자입니다.";
        }
        else if("KO".equals(user.lang) && err.equals("FileUpload Not Allowed Error"))
        {
            err = "파일첨부의 업로드를 허용하지 않습니다.";
        }
        else if("KO".equals(user.lang) && err.equals("FileUpload Save Path Error"))
        {
            err = "첨부파일의 저장 경로가 올바르지 않습니다.";
        }
        else if("KO".equals(user.lang) && err.equals("FileUpload Max Size Error"))
        {
            err = "첨부파일 용량이 허용하는 크기보다 큽니다.";
        }
        else if("KO".equals(user.lang) && err.equals("FileUpload Full Storage Error"))
        {
            err = "첨부파일의 저장소 크기가 부족합니다.";
        }

        return err;
    }
}
