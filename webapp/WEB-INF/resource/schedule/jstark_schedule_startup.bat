set path=.;C:/DEV/java/jdk1.8.0_181/bin
set jstark_home=C:/DEV/jstarkProject
set jstark_name=jstarkbizsuite
set classpath=%jstark_home%/%jstark_name%/WEB-INF/classes
set classpath=%classpath%;%jstark_home%/jstark_external_lib/*
set classpath=%classpath%;%jstark_home%/jstark_external_lib/dbms/*
set classpath=%classpath%;%jstark_home%/jstark_external_lib/servlet/servlet-api.jar
set classpath=%classpath%;%jstark_home%/%jstark_name%/WEB-INF/lib/*
java -cp %classpath%; org.jstark.schedule.JStarkSchedule