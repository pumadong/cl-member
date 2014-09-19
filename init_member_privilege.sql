delete from `p_module` where name='会员中心';
INSERT INTO `p_module`(id,name,flag,url,sort_no,create_person,create_date,update_person,update_date) 
VALUES
(6,'会员中心','m','http://127.0.0.1:10011/member-server',60,'system',NOW(),'system',NOW())
;


delete from `p_resource` where module_flag='m';
INSERT INTO `p_resource`(id,name,url,remark,parent_id,structure,sort_no,module_flag,create_person,create_date,update_person,update_date) 
VALUES
(300,'会员管理','','',0,'s-1',1,'m','system',NOW(),'system',NOW()),


(311,'数据字典','/controller/dictionary/list.do','',300,'s-1-1',1,'m','system',NOW(),'system',NOW()),
(312,'会员管理','/controller/member/list.do','',300,'s-1-2',2,'m','system',NOW(),'system',NOW()),
(313,'会员监控','/controller/member/monitor.do','',300,'s-1-2',3,'m','system',NOW(),'system',NOW())

;