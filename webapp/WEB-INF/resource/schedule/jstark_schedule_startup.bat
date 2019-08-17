set path=.;C:/DEV/Java/jdk1.8.0_181/bin

set schedule_driver=oracle.jdbc.OracleDriver
set schedule_url=jdbc:oracle:thin:@localhost:1521:XE
set schedule_id=jstark
set schedule_pw=jstark
set schedule_host=http://localhost:80
set schedule_interval=20000
set schedule_thread=10

java -jar jstarkschedulerunner.jar %schedule_driver% %schedule_url% %schedule_id% %schedule_pw% %schedule_host% %schedule_interval% %schedule_thread%