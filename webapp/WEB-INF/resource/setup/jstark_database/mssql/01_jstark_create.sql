
create table jstark_apm
(
  apm_key           nvarchar(30) not null,
  apm_server        nvarchar(30),
  apm_type          nvarchar(30),
  apm_time          datetime,
  apm_url           nvarchar(1000),
  apm_program       nvarchar(1000),
  apm_domethod      nvarchar(300),
  apm_use_ip        nvarchar(100),
  apm_elapsed       int,
  apm_query_key     nvarchar(500),
  apm_query_name    nvarchar(500),
  apm_query_params  nvarchar(4000),
  apm_query         nvarchar(4000),
  apm_msg           nvarchar(4000),
  apm_class         nvarchar(2000),
  apm_file          nvarchar(2000),
  apm_content       nvarchar(4000),
  apm_map           nvarchar(4000)
);

create table jstark_apm_data
(
d1 nvarchar(40),
d2 bigint,
d3 nvarchar(20),
d4 nvarchar(20),
d5 nvarchar(20),
d6 nvarchar(20),
d7 nvarchar(20),
d8 nvarchar(20),
d9 nvarchar(20),
d10 nvarchar(20),
d11 nvarchar(20),
d12 nvarchar(20),
d13 nvarchar(20),
d14 nvarchar(20),
d15 nvarchar(20),
d16 nvarchar(20),
d17 nvarchar(20),
d18 nvarchar(20),
d19 nvarchar(20),
d20 nvarchar(20),
d21 nvarchar(20),
d22 nvarchar(20),
d23 nvarchar(20),
d24 nvarchar(20),
d25 nvarchar(20),
d26 nvarchar(20),
d27 nvarchar(20),
d28 nvarchar(20),
d29 nvarchar(20),
d30 nvarchar(20),
d31 nvarchar(20),
d32 nvarchar(20),
d33 nvarchar(20),
d34 nvarchar(20),
d35 nvarchar(20),
d36 nvarchar(20),
d37 nvarchar(20),
d38 nvarchar(20),
d39 nvarchar(20),
d40 nvarchar(20));


create table jstark_change
(
  client       nvarchar(30),
  ch_no        nvarchar(30),
  ch_type      nvarchar(100),
  ch_key       nvarchar(100),
  u_no         nvarchar(30),
  ch_date      datetime
);


create table jstark_change_data
(
  client     nvarchar(30),
  ch_no      nvarchar(30),
  ch_table   nvarchar(500),
  dr_no      nvarchar(30),
  ch_column  nvarchar(1000),
  ch_value   nvarchar(4000)
);


create table jstark_code_group
(
  client        nvarchar(30) not null,
  cg_no         nvarchar(30) not null,
  cg_name       nvarchar(300),
  cg_text       nvarchar(500),
  use_flag      nvarchar(1),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30)
);


create table jstark_copy
(
  tnum  int not null
);


create table jstark_lang
(
  client      nvarchar(30) not null,
  l_no        nvarchar(30) not null,
  lang_cd     nvarchar(30),
  lang_kind   nvarchar(30),
  lang_type   nvarchar(30),
  lang_value  nvarchar(300),
  a_date      datetime,
  a_user      nvarchar(30),
  c_date      datetime,
  c_user      nvarchar(30)
);


create table jstark_lang_temp
(
  client      nvarchar(30) not null,
  l_no        nvarchar(30) not null,
  lang_cd     nvarchar(30),
  lang_type   nvarchar(30),
  lang_value  nvarchar(300),
  lang_flag   nvarchar(1),
  u_no        nvarchar(30)
);

create table jstark_login_log
(
   client               nvarchar(30),
   u_no                 nvarchar(30),
   u_id                 nvarchar(30),
   session_id           nvarchar(200),
   l_type               nvarchar(3),
   log_path             nvarchar(100),
   u_ip                 nvarchar(100),
   result               nvarchar(1),
   au_no                nvarchar(30),
   agent                nvarchar(1000),
   a_date               datetime
);

create table jstark_menu_group
(
  client        nvarchar(30) not null,
  g_no          nvarchar(30) not null,
  t_no          nvarchar(30),
  g_name        nvarchar(300),
  g_text        nvarchar(500),
  g_home_url    nvarchar(500),
  visible_flag  nvarchar(1),
  g_sort        int,
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30),
  multi_flag    nvarchar(1),
  time_out      int
);


create table jstark_menu_hidden
(
  client      nvarchar(30) not null,
  u_no        nvarchar(30) not null,
  m_no        nvarchar(30) not null,
  a_date      datetime,
  a_user      nvarchar(30),
  c_date      datetime,
  c_user      nvarchar(30)
);


create table jstark_menu_log
(
  client          nvarchar(30),
  m_no            nvarchar(30),
  u_no            nvarchar(30),
  session_id      nvarchar(200),
  a_date          datetime
);


create table jstark_control
(
  c_no              nvarchar(30) not null,
  c_action          nvarchar(1000),
  c_domethod        nvarchar(1000),
  c_url             nvarchar(1000),
  ck_log            nvarchar(1),
  a_date            datetime,
  a_user            nvarchar(30),
  c_date            datetime,
  c_user            nvarchar(30),
  dn_change         nvarchar(1),
  copy_flag         nvarchar(1),
  c_comment         nvarchar(500),
  dn_control        nvarchar(1)
);


create table jstark_control_auth
(
  client        nvarchar(30),
  c_no          nvarchar(30),
  g_no          nvarchar(30),
  u_no          nvarchar(30),
  c_ip          nvarchar(100),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30),
  use_flag      nvarchar(1)
);


create table jstark_control_log
(
  client           nvarchar(30),
  u_no             nvarchar(30),
  c_no             nvarchar(30),
  c_flag           nvarchar(1),
  result_login     nvarchar(1),
  result_method      nvarchar(1),
  result_inside    nvarchar(1),
  result_unique    nvarchar(1),
  result_auth      nvarchar(1),
  a_date           datetime
);


create table jstark_security
(
  client      nvarchar(30) not null,
  s_no        nvarchar(30) not null,
  s_name      nvarchar(300),
  pw_min      int,
  pw_special  int,
  pw_number   int,
  pw_upper    int,
  pw_lower    int,
  pw_seq_num  int,
  pw_seq_str  int,
  pw_id       int,
  pw_space    int,
  pw_dup      int,
  pw_change   int,
  pw_alogin   int,
  ppw_block   int,
  a_date      datetime,
  a_user      nvarchar(30),
  c_date      datetime,
  c_user      nvarchar(30)
);


create table jstark_security_log
(
  client          nvarchar(30),
  sl_no           nvarchar(30),
  u_no            nvarchar(30),
  tablename       nvarchar(500),
  tablecolumn     nvarchar(500),
  tablevalue      nvarchar(1000),
  submitmethod    nvarchar(4),
  outsiderequest  nvarchar(1),
  session_id      nvarchar(200),
  ip              nvarchar(100),
  agent           nvarchar(1000),
  logout          nvarchar(1),
  a_date          datetime
);

create table jstark_session_log
(
  client      nvarchar(30),
  u_no        nvarchar(30),
  session_id  nvarchar(200),
  a_date      datetime
);


create table jstark_sso
(
  client            nvarchar(30) not null,
  ss_no             nvarchar(30) not null,
  ss_name           nvarchar(200),
  ss_req_url        nvarchar(1000),
  ss_ack_url        nvarchar(1000),
  ss_red_url        nvarchar(1000),
  ss_note           nvarchar(2000),
  ss_time           int,
  ss_key1           nvarchar(32),
  ss_key2           nvarchar(32),
  ss_key3           nvarchar(32),
  ss_key4           nvarchar(32),
  ss_sp             nvarchar(10),
  ss_amode          nvarchar(1),
  use_flag          nvarchar(1),
  a_date            datetime,
  a_user            nvarchar(30),
  c_date            datetime,
  c_user            nvarchar(30)
);


create table jstark_sso_auth
(
  client        nvarchar(30) not null,
  ss_no         nvarchar(30) not null,
  g_no          nvarchar(30),
  u_no          nvarchar(30),
  use_flag      nvarchar(1),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30)
);


create table jstark_sso_log
(
  client      nvarchar(30),
  lg_no       nvarchar(30),
  i_code      nvarchar(30),
  i_key       nvarchar(2000),
  v_ss_no     nvarchar(100),
  v_time      nvarchar(100),
  v_id        nvarchar(100),
  session_id  nvarchar(200),
  login_flag  nvarchar(1),
  note        nvarchar(200),
  l_time      datetime
);


create table jstark_theme
(
  client        nvarchar(30) not null,
  t_no          nvarchar(30) not null,
  t_name        nvarchar(300),
  t_text        nvarchar(500),
  t_action      nvarchar(500),
  t_jsp         nvarchar(500),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30)
);


create table jstark_tree
(
  client        nvarchar(30) not null,
  tr_no         nvarchar(30) not null,
  p_tr_no       nvarchar(30),
  tr_sort       int,
  tr_name       nvarchar(200),
  use_flag      nvarchar(1),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30)
);


create table jstark_tree_data
(
  client        nvarchar(30) not null,
  tr_no         nvarchar(30) not null,
  td_no         nvarchar(30) not null,
  u_no          nvarchar(30),
  c_no          nvarchar(30),
  td_code       nvarchar(300),
  td_text       nvarchar(500),
  td_sort       int,
  use_flag      nvarchar(1),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30)
);


create table jstark_user
(
  client          nvarchar(30) not null,
  u_no            nvarchar(30) not null,
  u_id            nvarchar(30),
  u_pw            nvarchar(1024),
  u_name          nvarchar(300),
  u_text          nvarchar(500),
  block_flag      nvarchar(1),
  u_lang          nvarchar(2),
  u_timezone      nvarchar(6),
  fail_cnt        int,
  fail_time       datetime,
  last_pw_change  datetime,
  pw_init         nvarchar(1),
  use_pw          nvarchar(1),
  s_no            nvarchar(30),
  a_date          datetime,
  a_user          nvarchar(30),
  c_date          datetime,
  c_user          nvarchar(30),
  e_date          nvarchar(8),
  api_user_token  nvarchar(50)
);


create table jstark_user_info
(
  client        nvarchar(30) not null,
  u_no          nvarchar(30) not null,
  country       nvarchar(300),
  company       nvarchar(300),
  department    nvarchar(300),
  u_position      nvarchar(100),
  job_position  nvarchar(100),
  email         nvarchar(300),
  telephone1    nvarchar(100),
  telephone2    nvarchar(100),
  telephone3    nvarchar(100),
  address       nvarchar(500),
  photo         nvarchar(200),
  memo1         nvarchar(200),
  memo2         nvarchar(200),
  memo3         nvarchar(200),
  memo4         nvarchar(200),
  memo5         nvarchar(200),
  memo6         nvarchar(200),
  memo7         nvarchar(200),
  memo8         nvarchar(200),
  memo9         nvarchar(200),
  memo0         nvarchar(200)
);


create table jstark_user_screen
(
  client           nvarchar(30),
  u_no             nvarchar(30),
  u_screen         nvarchar(1),
  u_screen_width   int,
  u_screen_height  int,
  u_date           nvarchar(8),
  session_id       nvarchar(200),
  a_date           datetime
);

create table jstark_user_pwhist
(
  client 	nvarchar(30),
  u_no 		nvarchar(30),
  sno 		int,
  pwhash 	nvarchar(1024),
  a_date 	datetime
);

create table jstark_code
(
  client        nvarchar(30) not null,
  c_no          nvarchar(30) not null,
  c_sort        int,
  cg_no         nvarchar(30),
  c_code        nvarchar(300),
  c_text        nvarchar(500),
  use_flag      nvarchar(1),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30)
);


create table jstark_menu
(
  client        nvarchar(30) not null,
  g_no          nvarchar(30),
  depth1        int,
  depth2        int,
  depth3        int,
  depth4        int,
  depth5        int,
  m_no          nvarchar(30) not null,
  m_name        nvarchar(300),
  m_text        nvarchar(500),
  m_url         nvarchar(500),
  fold_flag     nvarchar(1),
  popup_flag    nvarchar(1),
  popup_width   int,
  popup_height  int,
  visible_flag  nvarchar(1),
  a_date        datetime,
  a_user        nvarchar(30),
  c_date        datetime,
  c_user        nvarchar(30)
);


create table jstark_menu_auth
(
  client       nvarchar(30) not null,
  u_no         nvarchar(30) not null,
  g_no         nvarchar(30) not null,
  g_sort       int,
  block_flag   nvarchar(1),
  a_date       datetime,
  a_user       nvarchar(30),
  c_date       datetime,
  c_user       nvarchar(30),
  home_hidden  nvarchar(1)
);

create table jstark_schedule
(
   client nvarchar(30),
   sch_no nvarchar(30),
   use_flag nvarchar(1),
   sch_name nvarchar(2000),
   sch_domethod nvarchar(1000),
   rp_s_date nvarchar(10),
   rp_e_date nvarchar(10),
   rp_hour nvarchar(2),
   rp_min nvarchar(2),
   rp_term int,
   sch_key1 nvarchar(32),
   sch_key2 nvarchar(32),
   a_date datetime,
   a_user nvarchar(30),
   c_date datetime,
   c_user nvarchar(30),
   sch_type nvarchar(1)
);


create table jstark_schedule_log
(
   sch_date nvarchar(10),
   sch_flag nvarchar(1)
);

create table jstark_schedule_today
(
   sch_no nvarchar(30),
   r_date nvarchar(16)
);

create table jstark_schedule_result
(
   sch_log_no nvarchar(30),
   sch_no nvarchar(30),
   sch_date nvarchar(10),
   s_date nvarchar(19),
   e_date nvarchar(19),
   sch_time int,
   sch_result nvarchar(1),
   sch_msg nvarchar(2000)
);


create table jstark_matrix(
    client nvarchar(100),
    mat_no nvarchar(30),
    mat_code nvarchar(100),
    mat_title nvarchar(100),
    a_date datetime,
    a_user nvarchar(30),
    c_date datetime,
    c_user nvarchar(30)
);

create table jstark_matrix_data(
    client nvarchar(30),
    mat_no nvarchar(30),
    dat_no nvarchar(30),
    sort_no int,
    c1 nvarchar(500),
    c2 nvarchar(500),
    c3 nvarchar(500),
    c4 nvarchar(500),
    c5 nvarchar(500),
    c6 nvarchar(500),
    c7 nvarchar(500),
    c8 nvarchar(500),
    c9 nvarchar(500),
    c10 nvarchar(500),
    c11 nvarchar(500),
    c12 nvarchar(500),
    c13 nvarchar(500),
    c14 nvarchar(500),
    c15 nvarchar(500)
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
  fid        nvarchar(30),
  file_name  nvarchar(100),
  file_save  nvarchar(200),
  file_path  nvarchar(1000),
  file_ext   nvarchar(100),
  file_size  int,
  a_date     datetime
);

create table sample_content
(
  mid       nvarchar(30),
  title     nvarchar(100),
  money     int,
  open_year nvarchar(4)
);

create table sample_clob
(
  a nvarchar(30),
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


