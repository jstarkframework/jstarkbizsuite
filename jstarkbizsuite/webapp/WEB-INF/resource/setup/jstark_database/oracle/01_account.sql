create tablespace jstark datafile 'C:\DEV\oraclexe\app\oracle\oradata\jstark.dbf' size 500M;

create temporary tablespace jstark_temp tempfile 'C:\DEV\oraclexe\app\oracle\oradata\jstark_temp.dbf' size 100M;

create user jstark identified by jstark default tablespace jstark temporary tablespace jstark_temp;

grant connect, resource to jstark;

grant create session to jstark;

grant create any table to jstark;

grant create any sequence to jstark;

grant dba to jstark;

revoke unlimited tablespace from jstark;

alter user jstark quota unlimited on jstark;

alter profile default limit password_life_time unlimited;