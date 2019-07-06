# jstarkbizsuite

http://jstark.org



vm 옵션 JAVA_OPTS에
-Djstark.env=dev
를 추가하면 jstark.application.properties 가 아닌
jstark.application.dev.properties 를 사용한다.

아래와 같이 옵션을 설정하면
-Djstark.mail:smtp_host=2.2.2.2
jstark.mail.properties의 smtp_host 값을 대체한다.
