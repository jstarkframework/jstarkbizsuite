# jstarkbizsuite

http://jstark.org

<br />
<br />
vm 옵션 JAVA_OPTS에<br />
-Djstark.env=dev<br />
를 추가하면 jstark.application.properties 가 아닌 jstark.application.dev.properties 를 사용한다.<br />
<br />
아래와 같이 옵션을 설정하면<br />
-Djstark.mail:smtp_host=2.2.2.2<br />
jstark.mail.properties의 smtp_host 값을 대체한다.<br />
<br />
<br />
처음 실행시 아래 경로에 암호화 키가 자동 생성되며 배포시 이 키를 함께 배포해야함.<br />
만약 이 키를 함께 배포하지 않으면 매번 새로운 암호화 키가 생성됨으로 인해 세션 클러스터링이 되지 않음.<br />
jstarkbizsuite\webapp\WEB-INF\config\sun\jstark_key.jsk<br />
<br />
<br />
