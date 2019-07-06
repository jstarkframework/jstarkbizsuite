package jstark.framework;

/** JSTARK FRAMEWORK 설정파일 경로 탐색, 수정금지
 *
 * @author jstark
 *
 */
public class JStarkBase
{
    /** 설정파일 탐색. 수정금지
     * do not touch
     * @return String
     */
    public String getBasePath()
    {
        return this.getClass().getResource("JStarkBase.class").getPath();
    }

    /** 설정파일의 변경 탐지 여부. true의 경우 변경 즉시 변경된 내용이 변영되지만, 속도 저하의 원인이 됩니다. 운영상황에서는 false 권고.
     * 운영환경에서 성능을 위해서는 false 로 설정해야 함.
     */
    public static boolean properties_auto_reload = true;

    /** 신규로 생성된 Class파일의 경우 Annotation을 읽을 수 없음,
     * 따라서 annotations_development_mode가 true일 경우 Annotation Link url을 찾지 못할 경우
     * 새로 Annotation Scan을 수행함. 그러나 Scan시 성능 저하가 발생함으로
     * 운영환경에서는 필수로 false 로 설정해야 함.
     */
    public static boolean annotations_development_mode = true;


    /** 심각한 시스템 장애시 모든 페이지를 emergency_path 파일이 보이도록 설정
     * 장애 발생시 emergency_mode = true 로 변경하고 JStarkBase.class를 Deploy
     * 복구가 완료되면 emergency_mode = false 로 변경하고 JStarkBase.class를 Deploy
     * 심각한 장애가 발생하여 복구하였다면, 정상적인 서비스를 위해 서비스 재구동 권장
     */
    public static boolean emergency_mode = false;
    public static String emergency_path = "/WEB-INF/jsp/jstark/error/emergency.jsp";
}
