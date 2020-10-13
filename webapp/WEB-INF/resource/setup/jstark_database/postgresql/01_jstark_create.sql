

create table jstark_apm
(
  apm_key           varchar(30) not null,
  apm_server        varchar(30),
  apm_type          varchar(30),
  apm_time          timestamp,
  apm_url           varchar(1000),
  apm_program       varchar(1000),
  apm_domethod      varchar(300),
  apm_use_ip        varchar(100),
  apm_elapsed       int,
  apm_query_key     varchar(500),
  apm_query_name    varchar(500),
  apm_query_params  varchar(4000),
  apm_query         varchar(4000),
  apm_msg           varchar(4000),
  apm_class         varchar(2000),
  apm_file          varchar(2000),
  apm_content       varchar(4000),
  apm_map           varchar(4000)
);

create table jstark_apm_data
(
d1 varchar(40),
d2 bigint,
d3 varchar(20),
d4 varchar(20),
d5 varchar(20),
d6 varchar(20),
d7 varchar(20),
d8 varchar(20),
d9 varchar(20),
d10 varchar(20),
d11 varchar(20),
d12 varchar(20),
d13 varchar(20),
d14 varchar(20),
d15 varchar(20),
d16 varchar(20),
d17 varchar(20),
d18 varchar(20),
d19 varchar(20),
d20 varchar(20),
d21 varchar(20),
d22 varchar(20),
d23 varchar(20),
d24 varchar(20),
d25 varchar(20),
d26 varchar(20),
d27 varchar(20),
d28 varchar(20),
d29 varchar(20),
d30 varchar(20),
d31 varchar(20),
d32 varchar(20),
d33 varchar(20),
d34 varchar(20),
d35 varchar(20),
d36 varchar(20),
d37 varchar(20),
d38 varchar(20),
d39 varchar(20),
d40 varchar(20));


create table jstark_change
(
  client   varchar(30),
  ch_no    varchar(30),
  ch_type  varchar(100),
  ch_key   varchar(100),
  u_no     varchar(30),
  ch_date  timestamp
);


create table jstark_change_data
(
  client     varchar(30),
  ch_no      varchar(30),
  ch_table   varchar(500),
  dr_no      varchar(30),
  ch_column  varchar(1000),
  ch_value   varchar(4000)
);


create table jstark_code_group
(
  client    varchar(30) not null,
  cg_no     varchar(30) not null,
  cg_name   varchar(300),
  cg_text   varchar(500),
  use_flag  varchar(1),
  a_date    timestamp,
  a_user    varchar(30),
  c_date    timestamp,
  c_user    varchar(30)
);


create table jstark_copy
(
  tnum  int not null
);


create table jstark_lang
(
  client      varchar(30) not null,
  l_no        varchar(30) not null,
  lang_cd     varchar(30),
  lang_kind   varchar(30),
  lang_type   varchar(30),
  lang_value  varchar(300),
  a_date      timestamp,
  a_user      varchar(30),
  c_date      timestamp,
  c_user      varchar(30)
);


create table jstark_lang_temp
(
  client      varchar(30) not null,
  l_no        varchar(30) not null,
  lang_cd     varchar(30),
  lang_type   varchar(30),
  lang_value  varchar(300),
  lang_flag   varchar(1),
  u_no        varchar(30)
);

create table jstark_login_log
(
   client               varchar(30),
   u_no                 varchar(30),
   u_id                 varchar(30),
   session_id           varchar(200),
   l_type               varchar(3),
   log_path             varchar(100),
   u_ip                 varchar(100),
   result               varchar(1),
   au_no                varchar(30),
   agent                varchar(1000),
   a_date               timestamp
);

create table jstark_menu_group
(
  client        varchar(30) not null,
  g_no          varchar(30) not null,
  t_no          varchar(30),
  g_name        varchar(300),
  g_text        varchar(500),
  g_home_url    varchar(500),
  visible_flag  varchar(1),
  g_sort        int,
  a_date        timestamp,
  a_user        varchar(30),
  c_date        timestamp,
  c_user        varchar(30),
  multi_flag    varchar(1),
  time_out      int
);


create table jstark_menu_hidden
(
  client  varchar(30) not null,
  u_no    varchar(30) not null,
  m_no    varchar(30) not null,
  a_date  timestamp,
  a_user  varchar(30),
  c_date  timestamp,
  c_user  varchar(30)
);


create table jstark_menu_log
(
  client      varchar(30),
  m_no        varchar(30),
  u_no        varchar(30),
  session_id  varchar(200),
  a_date      timestamp
);


create table jstark_control
(
  c_no              varchar(30) not null,
  c_action          varchar(1000),
  c_domethod        varchar(1000),
  c_url             varchar(1000),
  ck_log            varchar(1),
  a_date            timestamp,
  a_user            varchar(30),
  c_date            timestamp,
  c_user            varchar(30),
  dn_change         varchar(1),
  copy_flag         varchar(1),
  c_comment         varchar(500),
  dn_control        varchar(1)
);


create table jstark_control_auth
(
  client    varchar(30),
  c_no      varchar(30),
  g_no      varchar(30),
  u_no      varchar(30),
  c_ip      varchar(100),
  a_date    timestamp,
  a_user    varchar(30),
  c_date    timestamp,
  c_user    varchar(30),
  use_flag  varchar(1)
);


create table jstark_control_log
(
  client           varchar(30),
  u_no             varchar(30),
  c_no             varchar(30),
  c_flag           varchar(1),
  result_login     varchar(1),
  result_method      varchar(1),
  result_inside    varchar(1),
  result_unique    varchar(1),
  result_auth      varchar(1),
  a_date           timestamp
);


create table jstark_security
(
  client      varchar(30) not null,
  s_no        varchar(30) not null,
  s_name      varchar(300),
  pw_min      int,
  pw_special  int,
  pw_number   int,
  pw_upper    int,
  pw_lower    int,
  pw_seq_num  int,
  pw_seq_str  int,
  pw_id   int,
  pw_space    int,
  pw_dup      int,
  pw_change   int,
  pw_alogin   int,
  ppw_block   int,
  a_date      timestamp,
  a_user      varchar(30),
  c_date      timestamp,
  c_user      varchar(30)
);


create table jstark_security_log
(
  client          varchar(30),
  sl_no           varchar(30),
  u_no            varchar(30),
  tablename       varchar(500),
  tablecolumn     varchar(500),
  tablevalue      varchar(1000),
  submitmethod    varchar(4),
  outsiderequest  varchar(1),
  session_id      varchar(200),
  ip              varchar(100),
  agent           varchar(1000),
  logout          varchar(1),
  a_date          timestamp
);


create table jstark_session_log
(
  client      varchar(30),
  u_no        varchar(30),
  session_id  varchar(200),
  a_date      timestamp
);


create table jstark_sso
(
  client        varchar(30) not null,
  ss_no         varchar(30) not null,
  ss_name       varchar(200),
  ss_req_url    varchar(1000),
  ss_ack_url    varchar(1000),
  ss_red_url    varchar(1000),
  ss_note       varchar(2000),
  ss_time       int,
  ss_key1       varchar(32),
  ss_key2       varchar(32),
  ss_key3       varchar(32),
  ss_key4       varchar(32),
  ss_sp         varchar(10),
  ss_amode      varchar(1),
  use_flag      varchar(1),
  a_date        timestamp,
  a_user        varchar(30),
  c_date        timestamp,
  c_user        varchar(30)
);


create table jstark_sso_auth
(
  client    varchar(30) not null,
  ss_no     varchar(30) not null,
  g_no      varchar(30),
  u_no      varchar(30),
  use_flag  varchar(1),
  a_date    timestamp,
  a_user    varchar(30),
  c_date    timestamp,
  c_user    varchar(30)
);


create table jstark_sso_log
(
  client      varchar(30),
  lg_no       varchar(30),
  i_code      varchar(30),
  i_key       varchar(2000),
  v_ss_no     varchar(100),
  v_time      varchar(100),
  v_id        varchar(100),
  session_id  varchar(200),
  login_flag  varchar(1),
  note        varchar(200),
  l_time      timestamp
);


create table jstark_theme
(
  client    varchar(30) not null,
  t_no      varchar(30) not null,
  t_name    varchar(300),
  t_text    varchar(500),
  t_action  varchar(500),
  t_jsp     varchar(500),
  a_date    timestamp,
  a_user    varchar(30),
  c_date    timestamp,
  c_user    varchar(30)
);


create table jstark_tree
(
  client    varchar(30) not null,
  tr_no     varchar(30) not null,
  p_tr_no   varchar(30),
  tr_sort   int,
  tr_name   varchar(200),
  use_flag  varchar(1),
  a_date    timestamp,
  a_user    varchar(30),
  c_date    timestamp,
  c_user    varchar(30)
);


create table jstark_tree_data
(
  client    varchar(30) not null,
  tr_no     varchar(30) not null,
  td_no     varchar(30) not null,
  u_no      varchar(30),
  c_no      varchar(30),
  td_code   varchar(300),
  td_text   varchar(500),
  td_sort   int,
  use_flag  varchar(1),
  a_date    timestamp,
  a_user    varchar(30),
  c_date    timestamp,
  c_user    varchar(30)
);


create table jstark_user
(
  client          varchar(30) not null,
  u_no            varchar(30) not null,
  u_id            varchar(30),
  u_pw            varchar(1024),
  u_name          varchar(300),
  u_text          varchar(500),
  block_flag      varchar(1),
  u_lang          varchar(2),
  u_timezone      varchar(6),
  fail_cnt        int,
  fail_time       timestamp,
  last_pw_change  timestamp,
  pw_init         varchar(1),
  use_pw          varchar(1),
  s_no            varchar(30),
  a_date          timestamp,
  a_user          varchar(30),
  c_date          timestamp,
  c_user          varchar(30),
  e_date          varchar(8),
  api_user_token  varchar(50)
);


create table jstark_user_info
(
  client        varchar(30) not null,
  u_no          varchar(30) not null,
  country       varchar(300),
  company       varchar(300),
  department    varchar(300),
  u_position      varchar(100),
  job_position  varchar(100),
  email         varchar(300),
  telephone1    varchar(100),
  telephone2    varchar(100),
  telephone3    varchar(100),
  address       varchar(500), 
  photo         varchar(200), 
  memo1         varchar(200),
  memo2         varchar(200),
  memo3         varchar(200),
  memo4         varchar(200),
  memo5         varchar(200),
  memo6         varchar(200),
  memo7         varchar(200),
  memo8         varchar(200),
  memo9         varchar(200),
  memo0         varchar(200)
);


create table jstark_user_screen
(
  client           varchar(30),
  u_no             varchar(30),
  u_screen         varchar(1),
  u_screen_width   int,
  u_screen_height  int,
  u_date           varchar(8),
  session_id       varchar(200),
  a_date           timestamp
);

create table jstark_user_pwhist
(
  client 	varchar(30),
  u_no 		varchar(30),
  sno 		int,
  pwhash 	varchar(1024),
  a_date 	timestamp
);

create table jstark_code
(
  client    varchar(30) not null,
  c_no      varchar(30) not null,
  c_sort    int,
  cg_no     varchar(30),
  c_code    varchar(300),
  c_text    varchar(500),
  use_flag  varchar(1),
  a_date    timestamp,
  a_user    varchar(30),
  c_date    timestamp,
  c_user    varchar(30)
);


create table jstark_menu
(
  client        varchar(30) not null,
  g_no          varchar(30),
  depth1        int,
  depth2        int,
  depth3        int,
  depth4        int,
  depth5        int,
  m_no          varchar(30) not null,
  m_name        varchar(300),
  m_text        varchar(500),
  m_url         varchar(500),
  fold_flag     varchar(1),
  popup_flag    varchar(1),
  popup_width   int,
  popup_height  int,
  visible_flag  varchar(1),
  a_date        timestamp,
  a_user        varchar(30),
  c_date        timestamp,
  c_user        varchar(30)
);


create table jstark_menu_auth
(
  client       varchar(30) not null,
  u_no         varchar(30) not null,
  g_no         varchar(30) not null,
  g_sort       int,
  block_flag   varchar(1),
  a_date       timestamp,
  a_user       varchar(30),
  c_date       timestamp,
  c_user       varchar(30),
  home_hidden  varchar(1)
);

create table jstark_schedule
(
   client varchar(30),
   sch_no varchar(30),
   use_flag varchar(1),
   sch_name varchar(2000),
   sch_domethod varchar(1000),
   rp_s_date varchar(10),
   rp_e_date varchar(10),
   rp_hour varchar(2),
   rp_min varchar(2),
   rp_term int,
   sch_key1 varchar(32),
   sch_key2 varchar(32),
   a_date timestamp,
   a_user varchar(30),
   c_date timestamp,
   c_user varchar(30),
   sch_type varchar(1),
   rp_weeks varchar(100),
   rp_days varchar(500)
);

create table jstark_schedule_log
(
   sch_date varchar(10),
   sch_flag varchar(1)
);

create table jstark_schedule_today
(
   sch_no varchar(30),
   r_date varchar(16)
);

create table jstark_schedule_result
(
   sch_log_no varchar(30),
   sch_no varchar(30),
   sch_date varchar(10),
   s_date varchar(19),
   e_date varchar(19),
   sch_time int,
   sch_result varchar(1),
   sch_msg varchar(2000),
   r_date varchar(19)
);


create table jstark_matrix(
    client varchar(100),
    mat_no varchar(30),
    mat_code varchar(100),
    mat_title varchar(100),
    a_date timestamp,
    a_user varchar(30),
    c_date timestamp,
    c_user varchar(30)
);

create table jstark_matrix_data(
    client varchar(30),
    mat_no varchar(30),
    dat_no varchar(30),
    sort_no int,
    c1 varchar(500),
    c2 varchar(500),
    c3 varchar(500),
    c4 varchar(500),
    c5 varchar(500),
    c6 varchar(500),
    c7 varchar(500),
    c8 varchar(500),
    c9 varchar(500),
    c10 varchar(500),
    c11 varchar(500),
    c12 varchar(500),
    c13 varchar(500),
    c14 varchar(500),
    c15 varchar(500)
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


create table sample_file
(
  fid varchar(30),
  file_name varchar(100),
  file_save varchar(200),
  file_path varchar(1000),
  file_ext varchar(100),
  file_size int,
  a_date timestamp
);

create table sample_content
(
  mid varchar(30),
  title varchar(100),
  money int,
  open_year varchar(4)
);

create table sample_clob
(
  a varchar(30),
  b text
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