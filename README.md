cl-member
==================

会员管理系统


一、前置项目依赖

https://github.com/pumadong/cl-privilege

二、项目说明

会员中心，这个系统，包含网站中的会员中心，后台的会员管理功能，提供给其他系统的会员API，以及会员相关的自动化任务。

计划实现的会员中心功能单元如下：

member-api-server：会员接口，对接其他系统

member-schedule：会员自动化处理任务，比如：转有效、转无效等

member-server：会员管理界面

member-site：网站会员中心

三、mybatis-generator

ORM框架采用MyBatis，为了提高开发效率，先根据数据库表单结构自动生成Model和MyBatis相关类，生成命令如下：

java -jar mybatis-generator-core-1.3.1.jar -configfile config_member.xml -overwrite

生成时需要把mybatis-generator-core-1.3.1.jar、mysql-connector-java-5.1.24-bin.jar、config_member.xml放到一个目录下，生成的相关类和XML会放置到CreateResult文件夹下面。

jar下载地址：http://pan.baidu.com/s/1qW98L0C