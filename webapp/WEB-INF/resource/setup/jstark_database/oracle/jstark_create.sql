
@00_catnoqm;

@01_account;


connect jstark/jstark;

create table jstark_apm
(
  apm_key           varchar2(30) not null,
  apm_server        varchar2(30),
  apm_type          varchar2(30),
  apm_time          date,
  apm_url           varchar2(1000),
  apm_program       varchar2(1000),
  apm_domethod      varchar2(300),
  apm_use_ip        varchar2(100),
  apm_elapsed       number,
  apm_query_key     varchar2(500),
  apm_query_name    varchar2(500),
  apm_query_params  varchar2(4000),
  apm_query         varchar2(4000),
  apm_msg           varchar2(4000),
  apm_class         varchar2(2000),
  apm_file          varchar2(2000),
  apm_content       varchar2(4000),
  apm_map           varchar2(4000)
);

create table jstark_apm_data
(
d1 varchar2(40),
d2 number,
d3 varchar2(20),
d4 varchar2(20),
d5 varchar2(20),
d6 varchar2(20),
d7 varchar2(20),
d8 varchar2(20),
d9 varchar2(20),
d10 varchar2(20),
d11 varchar2(20),
d12 varchar2(20),
d13 varchar2(20),
d14 varchar2(20),
d15 varchar2(20),
d16 varchar2(20),
d17 varchar2(20),
d18 varchar2(20),
d19 varchar2(20),
d20 varchar2(20),
d21 varchar2(20),
d22 varchar2(20),
d23 varchar2(20),
d24 varchar2(20),
d25 varchar2(20),
d26 varchar2(20),
d27 varchar2(20),
d28 varchar2(20),
d29 varchar2(20),
d30 varchar2(20),
d31 varchar2(20),
d32 varchar2(20),
d33 varchar2(20),
d34 varchar2(20),
d35 varchar2(20),
d36 varchar2(20),
d37 varchar2(20),
d38 varchar2(20),
d39 varchar2(20),
d40 varchar2(20));


create table jstark_change
(
  client   varchar2(30),
  ch_no    varchar2(30),
  ch_type  varchar2(100),
  ch_key   varchar2(100),
  u_no     varchar2(30),
  ch_date  date
);


create table jstark_change_data
(
  client     varchar2(30),
  ch_no      varchar2(30),
  ch_table   varchar2(500),
  dr_no      varchar2(30),
  ch_column  varchar2(1000),
  ch_value   varchar2(4000)
);


create table jstark_code_group
(
  client    varchar2(30) not null,
  cg_no     varchar2(30) not null,
  cg_name   varchar2(300),
  cg_text   varchar2(500),
  use_flag  varchar2(1),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30)
);


create table jstark_copy
(
  tnum  number not null
);


create table jstark_lang
(
  client      varchar2(30) not null,
  l_no        varchar2(30) not null,
  lang_cd     varchar2(30),
  lang_kind   varchar2(30),
  lang_type   varchar2(30),
  lang_value  varchar2(300),
  a_date      date,
  a_user      varchar2(30),
  c_date      date,
  c_user      varchar2(30)
);


create table jstark_lang_temp
(
  client      varchar2(30) not null,
  l_no        varchar2(30) not null,
  lang_cd     varchar2(30),
  lang_type   varchar2(30),
  lang_value  varchar2(300),
  lang_flag   varchar2(1),
  u_no        varchar2(30)
);

create table jstark_login_log
(
   client               varchar2(30),
   u_no                 varchar2(30),
   u_id                 varchar2(30),
   session_id           varchar2(200),
   l_type               varchar2(3),
   log_path             varchar2(100),
   u_ip                 varchar2(100),
   result               varchar2(1),
   au_no                varchar2(30),
   agent                varchar2(1000),
   a_date               date
);

create table jstark_menu_group
(
  client        varchar2(30) not null,
  g_no          varchar2(30) not null,
  t_no          varchar2(30),
  g_name        varchar2(300),
  g_text        varchar2(500),
  g_home_url    varchar2(500),
  visible_flag  varchar2(1),
  g_sort        number,
  a_date        date,
  a_user        varchar2(30),
  c_date        date,
  c_user        varchar2(30),
  multi_flag    varchar2(1),
  time_out      number
);


create table jstark_menu_hidden
(
  client  varchar2(30) not null,
  u_no    varchar2(30) not null,
  m_no    varchar2(30) not null,
  a_date  date,
  a_user  varchar2(30),
  c_date  date,
  c_user  varchar2(30)
);


create table jstark_menu_log
(
  client      varchar2(30),
  m_no        varchar2(30),
  u_no        varchar2(30),
  session_id  varchar2(200),
  a_date      date
);


create table jstark_control
(
  c_no              varchar2(30) not null,
  c_action          varchar2(1000),
  c_domethod        varchar2(1000),
  c_url             varchar2(1000),
  ck_log            varchar2(1),
  a_date            date,
  a_user            varchar2(30),
  c_date            date,
  c_user            varchar2(30),
  dn_change         varchar2(1),
  copy_flag         varchar2(1),
  c_comment         varchar2(500),
  dn_control        varchar2(1)
);


create table jstark_control_auth
(
  client    varchar2(30),
  c_no      varchar2(30),
  g_no      varchar2(30),
  u_no      varchar2(30),
  c_ip      varchar2(100),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30),
  use_flag  varchar2(1)
);


create table jstark_control_log
(
  client           varchar2(30),
  u_no             varchar2(30),
  c_no             varchar2(30),
  c_flag           varchar2(1),
  result_login     varchar2(1),
  result_method      varchar2(1),
  result_inside    varchar2(1),
  result_unique    varchar2(1),
  result_auth      varchar2(1),
  a_date           date
);


create table jstark_security
(
  client      varchar2(30) not null,
  s_no        varchar2(30) not null,
  s_name      varchar2(300),
  pw_min      number,
  pw_special  number,
  pw_number   number,
  pw_upper    number,
  pw_lower    number,
  pw_seq_num  number,
  pw_seq_str  number,
  pw_id       number,
  pw_space    number,
  pw_dup      number,
  pw_change   number,
  pw_alogin   number,
  ppw_block   number,
  a_date      date,
  a_user      varchar2(30),
  c_date      date,
  c_user      varchar2(30)
);


create table jstark_security_log
(
  client          varchar2(30),
  sl_no           varchar2(30),
  u_no            varchar2(30),
  tablename       varchar2(500),
  tablecolumn     varchar2(500),
  tablevalue      varchar2(1000),
  submitmethod    varchar2(4),
  outsiderequest  varchar2(1),
  session_id      varchar2(200),
  ip              varchar2(100),
  agent           varchar2(1000),
  logout          varchar2(1),
  a_date          date
);


create table jstark_session_log
(
  client      varchar2(30),
  u_no        varchar2(30),
  session_id  varchar2(200),
  a_date      date
);


create table jstark_sso
(
  client        varchar2(30) not null,
  ss_no         varchar2(30) not null,
  ss_name       varchar2(200),
  ss_req_url    varchar2(1000),
  ss_ack_url    varchar2(1000),
  ss_red_url    varchar2(1000),
  ss_note       varchar2(2000),
  ss_time       number,
  ss_key1       varchar2(32),
  ss_key2       varchar2(32),
  ss_key3       varchar2(32),
  ss_key4       varchar2(32),
  ss_sp         varchar2(10),
  ss_amode      varchar2(1),
  use_flag      varchar2(1),
  a_date        date,
  a_user        varchar2(30),
  c_date        date,
  c_user        varchar2(30)
);


create table jstark_sso_auth
(
  client    varchar2(30) not null,
  ss_no     varchar2(30) not null,
  g_no      varchar2(30),
  u_no      varchar2(30),
  use_flag  varchar2(1),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30)
);


create table jstark_sso_log
(
  client      varchar2(30),
  lg_no       varchar2(30),
  i_code      varchar2(30),
  i_key       varchar2(2000),
  v_ss_no     varchar2(100),
  v_time      varchar2(100),
  v_id        varchar2(100),
  session_id  varchar2(200),
  login_flag  varchar2(1),
  note        varchar2(200),
  l_time      date
);


create table jstark_theme
(
  client    varchar2(30) not null,
  t_no      varchar2(30) not null,
  t_name    varchar2(300),
  t_text    varchar2(500),
  t_action  varchar2(500),
  t_jsp     varchar2(500),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30)
);


create table jstark_tree
(
  client    varchar2(30) not null,
  tr_no     varchar2(30) not null,
  p_tr_no   varchar2(30),
  tr_sort   number,
  tr_name   varchar2(200),
  use_flag  varchar2(1),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30)
);


create table jstark_tree_data
(
  client    varchar2(30) not null,
  tr_no     varchar2(30) not null,
  td_no     varchar2(30) not null,
  u_no      varchar2(30),
  c_no      varchar2(30),
  td_code   varchar2(300),
  td_text   varchar2(500),
  td_sort   number,
  use_flag  varchar2(1),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30)
);


create table jstark_user
(
  client          varchar2(30) not null,
  u_no            varchar2(30) not null,
  u_id            varchar2(30),
  u_pw            varchar2(1024),
  u_name          varchar2(300),
  u_text          varchar2(500),
  block_flag      varchar2(1),
  u_lang          varchar2(2),
  u_timezone      varchar2(6),
  fail_cnt        number,
  fail_time       date,
  last_pw_change  date,
  pw_init         varchar2(1),
  use_pw          varchar2(1),
  s_no            varchar2(30),
  a_date          date,
  a_user          varchar2(30),
  c_date          date,
  c_user          varchar2(30),
  e_date          varchar2(8),
  api_user_token  varchar2(50)
);


create table jstark_user_info
(
  client        varchar2(30) not null,
  u_no          varchar2(30) not null,
  country       varchar2(300),
  company       varchar2(300),
  department    varchar2(300),
  u_position      varchar2(100),
  job_position  varchar2(100),
  email         varchar2(300),
  telephone1    varchar2(100),
  telephone2    varchar2(100),
  telephone3    varchar2(100),
  address       varchar2(500),
  photo         varchar2(200),  
  memo1         varchar2(200),
  memo2         varchar2(200),
  memo3         varchar2(200),
  memo4         varchar2(200),
  memo5         varchar2(200),
  memo6         varchar2(200),
  memo7         varchar2(200),
  memo8         varchar2(200),
  memo9         varchar2(200),
  memo0         varchar2(200)
);


create table jstark_user_screen
(
  client           varchar2(30),
  u_no             varchar2(30),
  u_screen         varchar2(1),
  u_screen_width   number,
  u_screen_height  number,
  u_date           varchar2(8),
  session_id       varchar2(200),
  a_date           date
);

create table jstark_user_pwhist
(
  client 	varchar2(30),
  u_no 		varchar2(30),
  sno 		number,
  pwhash 	varchar2(1024),
  a_date 	date
);

create table jstark_code
(
  client    varchar2(30) not null,
  c_no      varchar2(30) not null,
  c_sort    number,
  cg_no     varchar2(30),
  c_code    varchar2(300),
  c_text    varchar2(500),
  use_flag  varchar2(1),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30)
);


create table jstark_menu
(
  client        varchar2(30) not null,
  g_no          varchar2(30),
  depth1        number,
  depth2        number,
  depth3        number,
  depth4        number,
  depth5        number,
  m_no          varchar2(30) not null,
  m_name        varchar2(300),
  m_text        varchar2(500),
  m_url         varchar2(500),
  fold_flag     varchar2(1),
  popup_flag    varchar2(1),
  popup_width   number,
  popup_height  number,
  visible_flag  varchar2(1),
  a_date        date,
  a_user        varchar2(30),
  c_date        date,
  c_user        varchar2(30)
);


create table jstark_menu_auth
(
  client       varchar2(30) not null,
  u_no         varchar2(30) not null,
  g_no         varchar2(30) not null,
  g_sort       number,
  block_flag   varchar2(1),
  a_date       date,
  a_user       varchar2(30),
  c_date       date,
  c_user       varchar2(30),
  home_hidden  varchar2(1)
);

create table jstark_schedule
(
   client varchar2(30),
   sch_no varchar2(30),
   use_flag varchar2(1),
   sch_name varchar2(2000),
   sch_domethod varchar2(1000),
   rp_s_date varchar2(10),
   rp_e_date varchar2(10),
   rp_hour varchar2(2),
   rp_min varchar2(2),
   rp_term number,
   sch_key1 varchar2(32),
   sch_key2 varchar2(32),
   a_date date,
   a_user varchar2(30),
   c_date date,
   c_user varchar2(30),
   sch_type varchar2(1)
);

create table jstark_schedule_log
(
   sch_date varchar2(10),
   sch_flag varchar2(1)
);

create table jstark_schedule_today
(
   sch_no varchar2(30),
   r_date varchar2(16)
);

create table jstark_schedule_result
(
   sch_log_no varchar2(30),
   sch_no varchar2(30),
   sch_date varchar2(10),
   s_date varchar2(19),
   e_date varchar2(19),
   sch_time number,
   sch_result varchar2(1),
   sch_msg varchar2(2000)
);


create table jstark_matrix(
    client varchar2(100),
    mat_no varchar2(30),
    mat_code varchar2(100),
    mat_title varchar2(100),
    a_date date,
    a_user varchar2(30),
    c_date date,
    c_user varchar2(30)
);

create table jstark_matrix_data(
    client varchar2(30),
    mat_no varchar2(30),
    dat_no varchar2(30),
    sort_no number,
    c1 varchar2(500),
    c2 varchar2(500),
    c3 varchar2(500),
    c4 varchar2(500),
    c5 varchar2(500),
    c6 varchar2(500),
    c7 varchar2(500),
    c8 varchar2(500),
    c9 varchar2(500),
    c10 varchar2(500),
    c11 varchar2(500),
    c12 varchar2(500),
    c13 varchar2(500),
    c14 varchar2(500),
    c15 varchar2(500)
);


create table jstark_gateway
(
  gw_no       varchar2(30),
  gw_title    varchar2(500),
  gw_backend  varchar2(1000),
  gw_token    varchar2(300),
  a_date      date,
  a_user      varchar2(30),
  c_date      date,
  c_user      varchar2(30)
);

create table jstark_gateway_auth
(
  client    varchar2(30),
  gw_no     varchar2(30),
  g_no      varchar2(30),
  u_no      varchar2(30),
  a_date    date,
  a_user    varchar2(30),
  c_date    date,
  c_user    varchar2(30),
  use_flag  varchar2(1)
);

create table jstark_gateway_log
(
  client        varchar2(30),
  u_no          varchar2(30),
  user_token    varchar2(50),
  gw_no         varchar2(30),
  frontend_url  varchar2(1000),
  call_url      varchar2(1000),
  call_method   varchar2(20),
  result        varchar2(30),
  a_date        date
);

create unique index jstark_schedule_pk on jstark_schedule
(client, sch_no);

create unique index jstark_schedule_log_pk on jstark_schedule_log
(sch_date);

create unique index jstark_schedule_result_pk on jstark_schedule_result
(sch_log_no);

create unique index jstark_apm_pk on jstark_apm
(apm_key);


create unique index jstark_code_group_pk on jstark_code_group
(client, cg_no);


create unique index jstark_copy_pk on jstark_copy
(tnum);


create unique index jstark_menu_group_pk on jstark_menu_group
(client, g_no);


create unique index jstark_lang_pk on jstark_lang
(client, l_no);


create unique index jstark_lang_idx1 on jstark_lang
(client, lang_cd, lang_type, lang_value);


create unique index jstark_lang_temp_pk on jstark_lang_temp
(client, l_no);


create unique index jstark_menu_hidden_pk on jstark_menu_hidden
(client, u_no, m_no);


create index jstark_control_auth_idx1 on jstark_control_auth
(client, c_no, g_no, use_flag);


create index jstark_control_auth_idx2 on jstark_control_auth
(client, c_no, u_no, use_flag);


create index jstark_control_auth_idx3 on jstark_control_auth
(client, c_no, c_ip, use_flag);


create unique index jstark_control_idx1 on jstark_control
(c_action, c_domethod, c_no);


create unique index jstark_control_idx2 on jstark_control
(c_url, c_no);


create unique index jstark_control_pk on jstark_control
(c_no);


create unique index jstark_security_pk on jstark_security
(client, s_no);


create unique index jstark_sso_auth_pk on jstark_sso_auth
(client, ss_no);


create unique index jstark_sso_pk on jstark_sso
(client, ss_no);


create unique index jstark_theme_pk on jstark_theme
(client, t_no);


create unique index jstark_tree_data_pk on jstark_tree_data
(client, tr_no, td_no);


create unique index jstark_tree_pk on jstark_tree
(client, tr_no);


create unique index jstark_user_info_pk on jstark_user_info
(client, u_no);


create unique index jstark_user_pk on jstark_user
(client, u_no);


create unique index jstark_menu_auth_idx1 on jstark_menu_auth
(client, u_no, g_no, g_sort, block_flag,
home_hidden);


create unique index jstark_menu_auth_pk on jstark_menu_auth
(client, u_no, g_no);


create unique index jstark_code_pk on jstark_code
(client, c_no);


create unique index jstark_menu_idx1 on jstark_menu
(client, visible_flag, g_no, depth3, depth4,
depth5, depth1, depth2, m_no);


create unique index jstark_menu_pk on jstark_menu
(client, m_no);

create index jstark_apm_data_idx1 on jstark_apm_data
(d1, d8, d2);


alter table jstark_apm add (
  constraint jstark_apm_pk
  primary key
  (apm_key)
  using index jstark_apm_pk);

alter table jstark_code_group add (
  constraint jstark_code_group_pk
  primary key
  (client, cg_no)
  using index jstark_code_group_pk);

alter table jstark_copy add (
  constraint jstark_copy_pk
  primary key
  (tnum)
  using index jstark_copy_pk);

alter table jstark_lang add (
  constraint jstark_lang_pk
  primary key
  (client, l_no)
  using index jstark_lang_pk);

alter table jstark_lang_temp add (
  constraint jstark_lang_temp_pk
  primary key
  (client, l_no)
  using index jstark_lang_temp_pk);

alter table jstark_menu_group add (
  constraint jstark_menu_group_pk
  primary key
  (client, g_no)
  using index jstark_menu_group_pk);

alter table jstark_menu_hidden add (
  constraint jstark_menu_hidden_pk
  primary key
  (client, u_no, m_no)
  using index jstark_menu_hidden_pk);

alter table jstark_control add (
  constraint jstark_control_pk
  primary key
  (r_no)
  using index jstark_control_pk);

alter table jstark_security add (
  constraint jstark_security_pk
  primary key
  (client, s_no)
  using index jstark_security_pk);

alter table jstark_sso add (
  constraint jstark_sso_pk
  primary key
  (client, ss_no)
  using index jstark_sso_pk);

alter table jstark_sso_auth add (
  constraint jstark_sso_auth_pk
  primary key
  (client, ss_no)
  using index jstark_sso_auth_pk);

alter table jstark_theme add (
  constraint jstark_theme_pk
  primary key
  (client, t_no)
  using index jstark_theme_pk);

alter table jstark_tree add (
  constraint jstark_tree_pk
  primary key
  (client, tr_no)
  using index jstark_tree_pk);

alter table jstark_tree_data add (
  constraint jstark_tree_data_pk
  primary key
  (client, tr_no, td_no)
  using index jstark_tree_data_pk);

alter table jstark_user add (
  constraint jstark_user_pk
  primary key
  (client, u_no)
  using index jstark_user_pk);

alter table jstark_user_info add (
  constraint jstark_user_info_pk
  primary key
  (client, u_no)
  using index jstark_user_info_pk);

alter table jstark_code add (
  constraint jstark_code_pk
  primary key
  (client, c_no)
  using index jstark_code_pk);

alter table jstark_menu add (
  constraint jstark_menu_pk
  primary key
  (client, m_no)
  using index jstark_menu_pk);

alter table jstark_menu_auth add (
  constraint jstark_menu_auth_pk
  primary key
  (client, u_no, g_no)
  using index jstark_menu_auth_pk);

alter table jstark_sso_auth add (
  constraint jstark_sso_auth_fk1
  foreign key (client, ss_no)
  references jstark_sso (client,ss_no));

alter table jstark_tree_data add (
  constraint jstark_tree_data_fk1
  foreign key (client, tr_no)
  references jstark_tree (client,tr_no));

alter table jstark_user add (
  constraint jstark_user_fk1
  foreign key (client, s_no)
  references jstark_security (client,s_no));

alter table jstark_user_info add (
  constraint jstark_user_info_fk1
  foreign key (client, u_no)
  references jstark_user (client,u_no));

alter table jstark_code add (
  constraint jstark_code_fk1
  foreign key (client, cg_no)
  references jstark_code_group (client,cg_no));

alter table jstark_menu add (
  constraint jstark_menu_fk1
  foreign key (client, g_no)
  references jstark_menu_group (client,g_no));

alter table jstark_menu_auth add (
  constraint jstark_menu_auth_fk1
  foreign key (client, u_no)
  references jstark_user (client,u_no),
  constraint jstark_menu_auth_fk2
  foreign key (client, g_no)
  references jstark_menu_group (client,g_no));

create table sample_file
(
  fid varchar2(30),
  file_name varchar2(100),
  file_save varchar2(200),
  file_path varchar2(100),
  file_ext varchar2(100),
  file_size number,
  a_date date
);

create table sample_content
(
  mid varchar2(30),
  title varchar2(100),
  money number,
  open_year varchar2(4)
);

create table sample_clob
(
  a varchar2(30),
  b clob
);

create table sample_blob
(
  a varchar2(30),
  b blob,
  c varchar2(50)
);



insert into jstark_copy(tnum) values(1);
insert into jstark_copy(tnum) select tnum+1 from jstark_copy;
insert into jstark_copy(tnum) select tnum+2 from jstark_copy;
insert into jstark_copy(tnum) select tnum+4 from jstark_copy;
insert into jstark_copy(tnum) select tnum+8 from jstark_copy;
insert into jstark_copy(tnum) select tnum+16 from jstark_copy;
insert into jstark_copy(tnum) select tnum+32 from jstark_copy;
insert into jstark_copy(tnum) select tnum+64 from jstark_copy;
insert into jstark_copy(tnum) select tnum+128 from jstark_copy;
insert into jstark_copy(tnum) select tnum+256 from jstark_copy;
insert into jstark_copy(tnum) select tnum+512 from jstark_copy;
insert into jstark_copy(tnum) select tnum+1024 from jstark_copy;
insert into jstark_copy(tnum) select tnum+2048 from jstark_copy;
insert into jstark_copy(tnum) select tnum+4096 from jstark_copy;
insert into jstark_copy(tnum) select tnum+8192 from jstark_copy;

commit;