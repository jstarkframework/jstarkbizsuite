package jstark.schedule;

import org.jstark.framework.core.hs.PerformanceAgent;
import org.jstark.framework.web.annotation.Link;
import org.jstark.schedule.JStarkScheduleChannel;

/** JStarkSchedule가 실행될때 호출하는 기본 Action, 배치 등록시 이 Action Class에 구현
 *
 * @author jstark
 *
 */
public class ScheduleGateAction extends JStarkScheduleChannel
{
    @Link("/jstarkschedule/schedule_apm_status.do")
    public void doScheduleApmStatus() throws Exception
    {
        long hr=PerformanceAgent.getHttpRequest();
        long dc=PerformanceAgent.getDbConnection();
        long de=PerformanceAgent.getDbExecute();
        long aw=PerformanceAgent.getActionWarning();
        long dw=PerformanceAgent.getDbWarning();
        long er=PerformanceAgent.getError();

        String message = "결과 : request:"+hr+", db conn:"+dc+", db exec:"+de+", db warn:"+dw+", action warn:"+aw+", error:"+er;

        toPrint(message);
    }
}
