#数据初始化-会员字典表
truncate table m_dictionary;

insert into `m_dictionary`(`group`,`code`,`name`,sort_no,create_person,create_date)
values
('source_type',1,'网站注册',1,'system',now()),
('source_type',2,'某某活动',2,'system',now()),

('level_type',1,'普通会员',1,'system',now()),
('level_type',2,'VIP会员',2,'system',now()),
('level_type',3,'SVIP会员',3,'system',now()),

('size_type',1,'合适',1,'system',now()),
('size_type',2,'偏大',2,'system',now()),
('size_type',3,'偏小',3,'system',now()),

('size_type',-1,'已删除',-1,'system',now()),

('member_log_type',1,'注册',1,'system',now()),
('member_log_type',2,'登录',2,'system',now()),
('member_log_type',3,'修改基本信息',3,'system',now()),

('member_precess_log_type',1,'会员升级',1,'system',now()),
('member_precess_log_type',2,'会员降级',2,'system',now()),

('money_type',1,'退换货入库退款',1,'system',now()),
('money_type',2,'支付扣款',2,'system',now()),

('score_type',1,'注册成功送积分',1,'system',now()),
('score_type',2,'验证Email送积分',2,'system',now()),
('score_type',3,'验证手机送积分',3,'system',now()),
('score_type',4,'抽奖消费积分',4,'system',now()),
('score_type',5,'支付成功送积分',5,'system',now())
;
