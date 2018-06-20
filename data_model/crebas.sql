/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/6/11 17:03:16                           */
/*==============================================================*/

/*
drop table if exists administrator;

drop table if exists bid;

drop table if exists business;

drop table if exists business_attachment;

drop table if exists complaint_attachment;

drop table if exists favorite_project;

drop table if exists favorite_works;

drop table if exists order_form;

drop table if exists orders_complaint;

drop table if exists private_message;

drop table if exists project;

drop table if exists project_attachment;

drop table if exists project_complaint;

drop table if exists project_skill;

drop table if exists resource;

drop table if exists resource_role;

drop table if exists role;

drop table if exists skill;

drop table if exists student;

drop table if exists student_attachment;

drop table if exists student_skill;

drop table if exists user_relation;

drop table if exists user_role;

drop table if exists works;

drop table if exists works_attachment;

drop table if exists works_comment;

drop table if exists works_complaint;
*/

/*==============================================================*/
/* Table: administrator                                         */
/*==============================================================*/
create table administrator
(
   id                   bigint unsigned not null auto_increment comment '编号',
   login_name           varchar(50) comment '登入名',
   hashed_pwd           varchar(32) comment '密码',
   salt                 varchar(32) comment '盐',
   bank_account         varchar(50) comment '银行卡号',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table administrator comment '管理员信息表';

/*==============================================================*/
/* Table: bid                                                   */
/*==============================================================*/
create table bid
(
   project_id           bigint unsigned not null comment '项目id',
   works_id             bigint unsigned not null comment '作品id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间'
);

alter table bid comment '投标表';

/*==============================================================*/
/* Table: business                                              */
/*==============================================================*/
create table business
(
   id                   bigint unsigned not null auto_increment comment 'id',
   hashed_pwd           varchar(32) comment '密码',
   salt                 varchar(32) comment '盐',
   avatar               varchar(300) comment '头像',
   business_name        varchar(50) comment '企业名称',
   representation_name  varchar(50) comment '合法代表人姓名',
   representation_idcard varchar(50) comment '合法代表人身份证号码',
   email                varchar(50) comment '邮箱',
   tel                  varchar(50) comment '联系方式',
   introduction         varchar(300) null comment '简介',
   login_time           timestamp comment '最近登入时间',
   is_verified          tinyint not null default 0 comment '是否通过审核',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   follower_count       int comment '粉丝人数',
   primary key (id)
);

alter table business comment '企业信息表';

/*==============================================================*/
/* Table: business_attachment                                   */
/*==============================================================*/
create table business_attachment
(
   id                   bigint unsigned not null auto_increment comment 'id',
   attachment_name      varchar(100) comment '附件名称',
   attachment_path      varchar(300) comment '附件路径',
   attachment_size      decimal comment '附件大小',
   business_id          bigint unsigned comment '企业id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table business_attachment comment '企业附件';

/*==============================================================*/
/* Table: complaint_attachment                                  */
/*==============================================================*/
create table complaint_attachment
(
   id                   bigint unsigned not null auto_increment comment 'id',
   attachment_name      varchar(100) comment '附件名称',
   attachment_path      varchar(300) comment '附件路径',
   attachment_size      decimal comment '附件大小',
   complaint_id         bigint unsigned comment '申诉id',
   complaint_type		tinyint unsigned comment '申诉的类型(订单：0 or项目：1 or作品：2)',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table complaint_attachment comment '申诉附件';

/*==============================================================*/
/* Table: favorite_project                                      */
/*==============================================================*/
create table favorite_project
(
   project_id           bigint unsigned not null comment '项目id',
   user_id              bigint unsigned not null comment '用户id',
   is_deleted           tinyint not null default 0 comment '是否喜欢',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   UNIQUE (project_id,user_id)
);

alter table favorite_project comment '收藏项目';

/*==============================================================*/
/* Table: favorite_works                                        */
/*==============================================================*/
create table favorite_works
(
   works_id             bigint unsigned not null comment '作品id',
   user_id              bigint unsigned not null comment '用户id',
   is_deleted           tinyint not null default 0 comment '是否喜欢',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间'
);

alter table favorite_works comment '收藏作品';

/*==============================================================*/
/* Table: order_form                                            */
/*==============================================================*/
create table order_form
(
   id                   bigint unsigned not null auto_increment comment '订单id',
   status               tinyint unsigned not null default 0 comment '状态',
   project_id           bigint unsigned comment '项目id',
   seller_id            bigint unsigned comment '卖家id',
   works_id             bigint unsigned comment '作品id',
   buyer_id             bigint unsigned comment '买家id',
   price                decimal comment '成交价格',
   finish_time          timestamp comment '结束时间',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   comment              varchar(300) comment '买家评论',
   type                 tinyint unsigned not null default 0 comment '订单类型',
   primary key (id)
);

alter table order_form comment '订单表';

/*==============================================================*/
/* Table: orders_complaint                                      */
/*==============================================================*/
create table orders_complaint
(
   id                   bigint unsigned not null auto_increment comment '订单申诉id',
   order_id             bigint comment '订单id',
   complaint_description varchar(300) comment '申诉内容',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table orders_complaint comment '订单申诉';

/*==============================================================*/
/* Table: private_message                                       */
/*==============================================================*/
create table private_message
(
   id                   bigint unsigned not null auto_increment comment 'id',
   sender_id            bigint comment '发送者id',
   receiver_id          bigint comment '接收者id',
   message_type         tinyint unsigned comment '信息类型',
   message_content      varchar(300) comment '信息内容',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   status               tinyint not null default 0 comment '信息状态',
   primary key (id)
);

alter table private_message comment '私信表';

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   id                   bigint unsigned not null auto_increment comment 'id',
   business_id          bigint comment '企业id',
   project_name         varchar(100) comment '项目名称',
   project_description  varchar(300) comment '项目描述',
   project_status       tinyint not null default 0 comment '项目状态',
   budget               decimal comment '预算',
   tender_period        timestamp comment '投标时间',
   expected_time        timestamp comment '预计完成时间',
   finish_time          timestamp comment '实际完成时间',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table project comment '项目表';

/*==============================================================*/
/* Table: project_attachment                                    */
/*==============================================================*/
create table project_attachment
(
   id                   bigint unsigned not null auto_increment comment 'id',
   attachment_name      varchar(100) comment '附件名称',
   attachment_path      varchar(300) comment '附件路径',
   attachment_size      decimal comment '附件大小',
   project_id           bigint unsigned comment '项目id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table project_attachment comment '项目附件';

/*==============================================================*/
/* Table: project_complaint                                     */
/*==============================================================*/
create table project_complaint
(
   id                   bigint unsigned not null auto_increment comment 'id',
   project_id           bigint comment '项目id',
   complaint_description varchar(300) comment '申诉内容',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table project_complaint comment '项目申诉';

/*==============================================================*/
/* Table: project_skill                                         */
/*==============================================================*/
create table project_skill
(
   project_id           bigint comment '项目id',
   skill_id             bigint comment '技能id'
);

alter table project_skill comment '项目所需技能表';

/*==============================================================*/
/* Table: resource                                              */
/*==============================================================*/
create table resource
(
   id                   bigint unsigned not null auto_increment comment 'id',
   resource_name        varchar(50) comment '菜单名称',
   resource_path        varchar(300) comment '菜单路径',
   pid                  varchar(50) comment '菜单父节点id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table resource comment '资源表';

/*==============================================================*/
/* Table: resource_role                                         */
/*==============================================================*/
create table resource_role
(
   resource_id          bigint comment '菜单id',
   role_id              bigint comment '角色id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间'
);

alter table resource_role comment '角色与资源关系表';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   bigint unsigned not null auto_increment comment 'id',
   role_name            varchar(50) comment '角色名称',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table role comment '角色表';

/*==============================================================*/
/* Table: skill                                                 */
/*==============================================================*/
create table skill
(
   id                   bigint unsigned not null auto_increment comment 'id',
   skill_name           varchar(50) comment '技能名称',
   primary key (id)
);

alter table skill comment '技能表';

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   id                   bigint unsigned not null auto_increment comment 'id',
   login_name           varchar(50) comment '登入名称(昵称)',
   hashed_pwd           varchar(32) comment '密码',
   salt                 varchar(32) comment '盐',
   avatar               varchar(300) comment '头像',
   sex                  char(2) comment '性别',
   bank_account         varchar(50) comment '银行卡号',
   tel                  varchar(50) comment '联系方式',
   email                varchar(50) comment '邮箱',
   introduction         varchar(100) comment '简介',
   transaction_time     int unsigned comment '交易总次数',
   break_time           int unsigned comment '毁约次数',
   login_time           timestamp comment '登入时间',
   is_verified          tinyint not null default 0 comment '是否是第一次登入',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   follower_count       int comment '粉丝总数',
   primary key (id)
);

alter table student comment '学生信息表';

/*==============================================================*/
/* Table: student_attachment                                    */
/*==============================================================*/
create table student_attachment
(
   id                   bigint unsigned not null auto_increment comment 'id',
   attachment_name      varchar(100) comment '附件名称',
   attachment_path      varchar(300) comment '附件内容',
   attachment_size      decimal comment '附件大小',
   student_id           bigint unsigned comment '学生id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table student_attachment comment '学生附件表';

/*==============================================================*/
/* Table: student_skill                                         */
/*==============================================================*/
create table student_skill
(
   skill_id             bigint comment '技能id',
   student_id           bigint comment '学生id'
);

alter table student_skill comment '学生技能表';

/*==============================================================*/
/* Table: user_relation                                         */
/*==============================================================*/
create table user_relation
(
   user_id              bigint comment '用户id',
   follow_id            bigint comment '另一个用户id',
   relation             tinyint not null default 0 comment '两个用户关系',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间'
);

alter table user_relation comment '用户关系表';

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   user_id              bigint not null comment '用户id',
   role_id              bigint not null comment '角色id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (user_id)
);

alter table user_role comment '角色与用户关系表';

/*==============================================================*/
/* Table: works                                                 */
/*==============================================================*/
create table works
(
   id                   bigint unsigned not null auto_increment comment 'id',
   student_id           bigint comment '学生id',
   works_name           varchar(100) comment '作品名称',
   works_describe       varchar(300) comment '作品描述',
   works_status         tinyint not null default 0 comment '作品状态',
   price                decimal comment '学生报价',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table works comment '作品表';

/*==============================================================*/
/* Table: works_attachment                                      */
/*==============================================================*/
create table works_attachment
(
   id                   bigint unsigned not null auto_increment comment 'id',
   attachment_name      varchar(100) comment '附件名称',
   attachment_path      varchar(300) comment '附件路径',
   attachment_size      decimal comment '附件大小',
   works_id             bigint comment '作品id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table works_attachment comment '作品附件';

/*==============================================================*/
/* Table: works_comment                                         */
/*==============================================================*/
create table works_comment
(
   id                   bigint unsigned not null auto_increment comment 'id',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   works_id             bigint comment '作品id',
   user_id 				bigint unsigned comment '评论的用户id',
   comment              varchar(300) comment '作品评论',
   primary key (id)
);

alter table works_comment comment '作品评论表';

/*==============================================================*/
/* Table: works_complaint                                       */
/*==============================================================*/
create table works_complaint
(
   id                   bigint unsigned not null auto_increment comment 'id',
   works_id             bigint unsigned comment '作品id',
   complaint_description varchar(300) comment '申诉描述',
   gmt_create           timestamp comment '创建时间',
   gmt_modified         timestamp comment '修改时间',
   primary key (id)
);

alter table works_complaint comment '作品申诉表';
/*
alter table bid add constraint FK_Reference_6 foreign key (project_id)
      references project (id) on delete restrict on update restrict;

alter table bid add constraint FK_Reference_7 foreign key (works_id)
      references works (id) on delete restrict on update restrict;

alter table business_attachment add constraint FK_Reference_23 foreign key (business_id)
      references business (id) on delete restrict on update restrict;

alter table complaint_attachment add constraint FK_Reference_26 foreign key (complaint_id)
      references orders_complaint (id) on delete restrict on update restrict;

alter table complaint_attachment add constraint FK_Reference_41 foreign key (complaint_id)
      references works_complaint (id) on delete restrict on update restrict;

alter table complaint_attachment add constraint FK_Reference_45 foreign key (complaint_id)
      references project_complaint (id) on delete restrict on update restrict;

alter table favorite_project add constraint FK_Reference_28 foreign key (user_id)
      references user_role (user_id) on delete restrict on update restrict;

alter table favorite_project add constraint FK_Reference_28 foreign key (project_id)
      references project (id) on delete restrict on update restrict;

alter table favorite_works add constraint FK_Reference_21 foreign key (user_id)
      references user_role (user_id) on delete restrict on update restrict;

alter table favorite_works add constraint FK_Reference_22 foreign key (works_id)
      references works (id) on delete restrict on update restrict;

alter table order_form add constraint FK_Reference_37 foreign key (works_id)
      references works (id) on delete restrict on update restrict;

alter table order_form add constraint FK_Reference_38 foreign key (buyer_id)
      references business (id) on delete restrict on update restrict;

alter table order_form add constraint FK_Reference_40 foreign key (project_id)
      references project (id) on delete restrict on update restrict;

alter table order_form add constraint FK_Reference_9 foreign key (seller_id)
      references student (id) on delete restrict on update restrict;

alter table orders_complaint add constraint FK_Reference_18 foreign key (order_id)
      references order_form (id) on delete restrict on update restrict;

alter table private_message add constraint FK_Reference_31 foreign key (sender_id,receiver_id )
      references user_role (user_id, user_id) on delete restrict on update restrict;

alter table project add constraint FK_Reference_29 foreign key (business_id)
      references business (id) on delete restrict on update restrict;

alter table project_attachment add constraint FK_Reference_25 foreign key (project_id)
      references project (id) on delete restrict on update restrict;

alter table project_complaint add constraint FK_Reference_44 foreign key (project_id)
      references project (id) on delete restrict on update restrict;

alter table project_skill add constraint FK_Reference_33 foreign key (skill_id)
      references skill (id) on delete restrict on update restrict;

alter table project_skill add constraint FK_Reference_35 foreign key (project_id)
      references project (id) on delete restrict on update restrict;

alter table resource_role add constraint FK_Reference_16 foreign key (role_id)
      references role (id) on delete restrict on update restrict;

alter table resource_role add constraint FK_Reference_17 foreign key (resource_id)
      references resource (id) on delete restrict on update restrict;

alter table student_attachment add constraint FK_Reference_11 foreign key (student_id)
      references student (id) on delete restrict on update restrict;

alter table student_skill add constraint FK_Reference_32 foreign key (skill_id)
      references skill (id) on delete restrict on update restrict;

alter table student_skill add constraint FK_Reference_34 foreign key (student_id)
      references student (id) on delete restrict on update restrict;

alter table student_skill add constraint FK_Reference_43 foreign key (student_id)
      references student (id) on delete restrict on update restrict;

alter table user_relation add constraint FK_Reference_20 foreign key (user_id,follow_id )
      references user_role (user_id, user_id) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_1 foreign key (user_id)
      references student (id) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_2 foreign key (role_id)
      references role (id) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_24 foreign key (user_id)
      references administrator (id) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_3 foreign key (user_id)
      references business (id) on delete restrict on update restrict;

alter table works add constraint FK_Reference_30 foreign key (student_id)
      references student (id) on delete restrict on update restrict;

alter table works_attachment add constraint FK_Reference_27 foreign key (works_id)
      references works (id) on delete restrict on update restrict;

alter table works_comment add constraint FK_Reference_36 foreign key (works_id)
      references works (id) on delete restrict on update restrict;

alter table works_comment add constraint FK_Reference_36 foreign key (user_id)
      references user_role (user_id) on delete restrict on update restrict;
      
alter table works_complaint add constraint FK_Reference_39 foreign key (works_id)
      references works (id) on delete restrict on update restrict;

*/