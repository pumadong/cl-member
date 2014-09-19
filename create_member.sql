#主键原则：
#UUID全局唯一，缺点是占用空间，去掉中划线后，剩余32个字节；大表1000万数据，按照一行多出100Byte计算，则多出1G数据；
#若是InnoDB引擎，因为其是索引组织表，创建的每个非簇索引，都会带上主键，这样占用存储空间更大，需要消耗更多内存和IO；
#自增，是可以手工指定值的，而且对于任何修改自增列的情况会导致自增列的计数器增长，可能会因为这些问题在主备、主从机制产生破坏性影响，优点是：空间和性能略高；
#自定义主键，比如订单号，商品编号，用程序保证唯一性，比如每次增加一个随机数；
#故我们的规则是：常被使用的基础数据表，比如品牌、分类等，就用自增ID，对于业务表，比如商品、订单，就用升序生成的编号、单据号
#参考：
#http://www.cnblogs.com/chutianyao/archive/2012/11/04/2753995.html
#http://blog.chinaunix.net/uid-20639775-id-3154234.html

#BEGIN*************************表单列表***************************BEGIN
#. m_member ：会员表
#. m_member_consignee ：会员收货地址表
#. m_commodity_comment ：商品评论表
#. m_member_log ：会员日志表
#. m_member_process_log ：自动任务处理会员积分、等级日志表，基于效率性能考虑，会员积分、等级都是一天算一次
#. m_member_money_io ：会员虚拟账户IO表
#. m_member_score_io ：会员积分IO表
#. m_dictionary ： 字典表，状态类型等字典数据都要存储于此，方便使用
#END***************************表单列表***************************END

#会员表
DROP TABLE IF EXISTS `m_member`;
CREATE TABLE `m_member` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`username`  varchar(30) NOT NULL DEFAULT '' COMMENT '会员名' ,
`password`  varchar(50) NOT NULL DEFAULT '' COMMENT '密码' ,
`realname`  varchar(30) NOT NULL DEFAULT '' COMMENT '真实姓名' ,
`province`  varchar(20) NOT NULL DEFAULT '' COMMENT '省份' ,
`city`  varchar(20) NOT NULL DEFAULT '' COMMENT '城市' ,
`area`  varchar(20) NOT NULL DEFAULT '' COMMENT '地区' ,
`address`  varchar(200) NOT NULL DEFAULT '' COMMENT '地址' ,
`postcode`  varchar(6) NOT NULL DEFAULT '' COMMENT '邮编' ,
`telephone`  varchar(30) NOT NULL DEFAULT '' COMMENT '电话' ,
`mobile`  varchar(11) NOT NULL DEFAULT '' COMMENT '手机' ,
`email`  varchar(50) NOT NULL DEFAULT '' COMMENT 'Email' ,
`gender`  varchar(2) NOT NULL DEFAULT '' COMMENT '性别' ,
`question`  varchar(50) NOT NULL DEFAULT '' COMMENT '密码提示问题' ,
`answer`  varchar(50) NOT NULL DEFAULT '' COMMENT '提示问题答案' ,
`source_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '来源' ,
`level_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级' ,
`account_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '会员虚拟账户金额' ,
`account_score`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '会员购买积分' ,
`is_lock`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否锁定：1是0否' ,
`is_black`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否黑名单：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
COMMENT='会员表'
;

#收货地址
DROP TABLE IF EXISTS `m_member_consignee`;
CREATE TABLE `m_member_consignee` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`province`  varchar(20) NOT NULL DEFAULT '' COMMENT '省份' ,
`city`  varchar(20) NOT NULL DEFAULT '' COMMENT '城市' ,
`area`  varchar(20) NOT NULL DEFAULT '' COMMENT '地区' ,
`address`  varchar(200) NOT NULL DEFAULT '' COMMENT '地址' ,
`postcode`  varchar(6) NOT NULL DEFAULT '' COMMENT '邮编' ,
`consignee`  varchar(50) NOT NULL DEFAULT '' COMMENT '收货人' ,
`telephone`  varchar(30) NOT NULL DEFAULT '' COMMENT '电话' ,
`mobile`  varchar(11) NOT NULL DEFAULT '' COMMENT '手机' ,
`email`  varchar(50) NOT NULL DEFAULT '' COMMENT 'Email' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
COMMENT='收货地址'
;

#商品评论表
DROP TABLE IF EXISTS `m_commodity_comment`;
CREATE TABLE `m_commodity_comment` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`no`  varchar(15) NOT NULL DEFAULT '' COMMENT '商品编号' ,
`member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`score`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '评分' ,
`size_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '尺码大小' ,
`remark`  varchar(500) NOT NULL DEFAULT '' COMMENT '评价内容' ,
`reply`  varchar(500) NOT NULL DEFAULT '' COMMENT '客服回复' ,
`status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '0新评论1已回复-1已删除' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
COMMENT='商品评论表'
;

#会员日志表
DROP TABLE IF EXISTS `m_member_log`;
CREATE TABLE `m_member_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`log_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '日志类型ID' ,
`log_content`  varchar(200) NOT NULL DEFAULT '' COMMENT '日志内容' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_member_log_member_id` (`member_id`) USING BTREE 
)
COMMENT='会员日志表'
;

#自动任务处理会员积分、等级日志表
DROP TABLE IF EXISTS `m_member_process_log`;
CREATE TABLE `m_member_process_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`log_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '日志类型ID' ,
`log_content`  varchar(200) NOT NULL DEFAULT '' COMMENT '日志内容' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_member_process_log_member_id` (`member_id`) USING BTREE 
)
COMMENT='自动任务处理会员积分、等级日志表'
;

#会员虚拟账户IO表
DROP TABLE IF EXISTS `m_member_money_io`;
CREATE TABLE `m_member_money_io` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`form_code`  varchar(15) NOT NULL DEFAULT '' COMMENT '涉及订单号' ,
`refund_code`  varchar(15) NOT NULL DEFAULT '' COMMENT '涉及退款单号' ,
`money_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '款项流转类型ID' ,
`operate_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '本次操作金额，+入-出' ,
`before_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '之前虚拟账户金额' ,
`after_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '之后虚拟账户金额' ,
`remark`  varchar(50) NOT NULL DEFAULT '' COMMENT '备注' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_member_money_io_member_id` (`member_id`) USING BTREE ,
INDEX `idx_member_money_io_form_code` (`form_code`) USING BTREE 
)
COMMENT='会员虚拟账户IO表'
;

#会员积分IO表
DROP TABLE IF EXISTS `m_member_score_io`;
CREATE TABLE `m_member_score_io` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`form_code`  varchar(15) NOT NULL DEFAULT '' COMMENT '涉及订单号' ,
`score_type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '积分流转类型ID' ,
`operate_score`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '本次操作积分，+入-出' ,
`before_score`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '之前积分' ,
`after_score`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '之后积分' ,
`remark`  varchar(50) NOT NULL DEFAULT '' COMMENT '备注' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_member_score_io_member_id` (`member_id`) USING BTREE ,
INDEX `idx_member_score_io_form_code` (`form_code`) USING BTREE 
)
COMMENT='会员积分IO表'
;

#类型状态字典表
DROP TABLE IF EXISTS `m_dictionary`;
CREATE TABLE `m_dictionary` (
`id`  smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`group`  varchar(50) NOT NULL COMMENT '状态分组' ,
`code`  tinyint(4) NOT NULL COMMENT '状态代码' ,
`name`  varchar(100) NOT NULL COMMENT '状态名称' ,
`sort_no`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_dictionary_group` (`group`) USING BTREE 
)
COMMENT='类型状态字典表'
;