/*
Navicat MySQL Data Transfer

Source Server         : 118.25.212.23
Source Server Version : 50723
Source Host           : 118.25.212.23:3306
Source Database       : dblog

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-01-02 11:23:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for biz_article
-- ----------------------------
DROP TABLE IF EXISTS `biz_article`;
CREATE TABLE `biz_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `cover_image` varchar(255) DEFAULT NULL COMMENT '文章封面图片',
  `qrcode_path` varchar(255) DEFAULT NULL COMMENT '文章专属二维码地址',
  `is_markdown` tinyint(1) unsigned DEFAULT '1',
  `content` longtext COMMENT '文章内容',
  `content_md` longtext COMMENT 'markdown版的文章内容',
  `top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `type_id` bigint(20) unsigned NOT NULL COMMENT '类型',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `recommended` tinyint(1) unsigned DEFAULT '0' COMMENT '是否推荐',
  `original` tinyint(1) unsigned DEFAULT '1' COMMENT '是否原创',
  `description` varchar(300) DEFAULT NULL COMMENT '文章简介，最多200字',
  `keywords` varchar(200) DEFAULT NULL COMMENT '文章关键字，优化搜索',
  `comment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否开启评论',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article
-- ----------------------------
INSERT INTO `biz_article` VALUES ('1', 'ES安装', '1', 'upload/c9124ec9-e56d-4dda-aa67-b11f57ae29e3.jpg', 'http://dreamatach.com/', '0', '<p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>ES下载地址:</strong><span style=\"text-decoration-line: underline;\">&nbsp;<a title=\"es下载链接\" href=\"https://www.elastic.co/downloads/elasticsearch\" target=\"_blank\" rel=\"noopener\">https://www.elastic.co/downloads/elasticsearch</a>&nbsp;</span></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">进入config目录下修改 elasticsearch.yml 和jvm.options</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">elasticsearch.yml主要修改以下几个参数</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">network.host: 192.168.79.128&nbsp; &nbsp;#修改为机器IP或者0.0.0.0不然只能本机访问默认值为localhost只能本机访问</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">jvm.options主要修改以下几个参数</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">-Xms128M&nbsp; #根据自己实际情况修改大小&nbsp; &nbsp;最小堆内存<br>-Xmx128M&nbsp; #据自己实际情况修改大小&nbsp; &nbsp; &nbsp; &nbsp; 最大堆内存</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><br></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><br></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>Kibana下载地址:&nbsp;<span style=\"text-decoration-line: underline;\">&nbsp;</span></strong><span style=\"text-decoration-line: underline;\"><a title=\"kibana下载链接\" href=\"https://www.elastic.co/downloads/kibana\" target=\"_blank\" rel=\"noopener\">https://www.elastic.co/downloads/kibana</a></span></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">在config/kibana.yml中配置 elasticsearch.url的值为 ES的访问地址</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">server.host:192.168.2.16 #修改为机器IP或者0.0.0.0不然只能本机访问默认值为localhost只能本机访问</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><br></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><br></p><h1 style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">ES安装问题</h1><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">问题一：max file descriptors [4096] for elasticsearch process likely too low, increase to at least [65536]<br>解决：修改切换到root用户修改配置limits.conf 添加下面两行<br>命令:vi /etc/security/limits.conf</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">* soft nofile 65536</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">* hard nofile 65536</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">* soft nproc 2048</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">* hard nproc 4096</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">问题二：max virtual memory areas vm.max_map_count [65530] likely too low, increase to at least [262144]<br>解决：切换到root用户修改配置sysctl.conf<br>vi /etc/sysctl.conf&nbsp;<br>添加下面配置：<br>vm.max_map_count=655360</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">并执行命令：<br>sysctl -p</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">切换到es的用户。<br>然后，重新启动elasticsearch，即可启动成功。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><br></p><h1 style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">集成IK中文分词器</h1><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">IK中文分词器下载地址:<a title=\"elasticsearch中文分词器\" href=\"https://github.com/medcl/elasticsearch-analysis-ik/releases\" target=\"_blank\" rel=\"noopener\">https://github.com/medcl/elasticsearch-analysis-ik/releases</a></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">将 ik 的压缩包解压到 ES安装目录的plugins/目录下（最好把解出的目录名改一下，防止安装别的插件时同名冲突），然后重启ES。</p>', null, '0', '10', '1', '0', '1', 'elasticsearch ', 'elasticsearch ', '1', '2018-09-16 12:37:26', '2018-09-19 22:26:46');
INSERT INTO `biz_article` VALUES ('3', 'mysql5.7 sql_model的坑', '1', 'upload/54bf8a43-4c68-4c08-b7e7-dd0bf2f73fc2.jpg', null, '0', '<div yne-bulb-block=\"paragraph\" style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"font-size: 16px; color: rgb(79, 79, 79);\">在linux文件中</span></div><div yne-bulb-block=\"paragraph\" style=\"white-space: pre-wrap; text-align: justify; line-height: 1.625; font-size: 14px;\"><span style=\"font-size: 16px; color: rgb(79, 79, 79);\">/etc/mysql/mysql.conf.d/mysqld.cnf</span></div><div yne-bulb-block=\"paragraph\" style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51);\">添加如下语句：</span></div><div yne-bulb-block=\"paragraph\" style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51);\">[mysqld]</span></div><div yne-bulb-block=\"paragraph\" style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"color: rgb(51, 51, 51);\">sql_mode =\'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION\'&nbsp;</span></div>', null, '0', '10', '1', '0', '1', 'mysql5.7 sql_model的坑', 'mysql', '1', '2018-09-16 21:05:48', '2018-09-19 22:26:29');
INSERT INTO `biz_article` VALUES ('4', 'springcloud bus 消息中线', '1', 'upload/4a199606-d845-4204-8fb5-dbf125333367.jpg', null, '0', '<p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>配置文件加载顺序</strong></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">首先加载bootstrap.properties</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">然后加载application.properties</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>项目集成springcloud-config</strong></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>bootstrap.properties文件中配置configServer地址</strong></p><pre style=\"color: rgb(0, 0, 0);\"><code># 环境化变量(dev,test,prod)\nspring.profiles.active=dev\n# 服务名\nspring.application.name=sms-sys\n# 配置中心的地址\nspring.cloud.config.uri=http://localhost:9999</code></pre><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>配置中心内的文件命名规则</strong></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">所有系统公共配置的命名:application.properties</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">各个环境公用的配置命名:服务名.properties</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">特殊环境的配置文件命名:服务名=环境.properties</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">开发环境 dev</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">测试环境 test</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">线上环境 prod</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>springcloud实现单点动态刷新</strong></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">通过@RefreshScope注解实现配置文件动态刷新</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">发送post请求&nbsp; 微服务地址/refresh 刷新配置文件</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>加密存储</strong></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>在bootstrap.properties中开启加密,并且配置秘钥</strong></p><pre style=\"color: rgb(0, 0, 0);\"><code># 支持加密存储\nspring.cloud.config.server.encrypt.enabled=true\n# 加解密用的秘钥\nencrypt.key=xstRzoYnsre1us<span style=\"font-family: &quot;Microsoft YaHei&quot;; font-size: medium; background-color: white;\">加密&nbsp;POST请求: 加密地址:configServer地址/encrypt&nbsp; &nbsp; 加密内容</span></code></pre><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><span style=\"white-space: pre-wrap;\">密文存储&nbsp; &nbsp;如 redis.password={cipher}密文</span>&nbsp;&nbsp;<span style=\"white-space: pre-wrap;\"><br></span></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><span style=\"white-space: pre-wrap;\">解密 POST请求: 解密地址:configServer地址/decrypt&nbsp; &nbsp;解密内容</span>&nbsp;&nbsp;<strong><br></strong></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><strong>springcloud bus 基于rabbitmq实现动态批量刷新</strong></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">1.新增springcloud bus apmq依赖&nbsp;<span style=\"background-color: rgb(245, 245, 245); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px;\">&nbsp;</span></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><span style=\"font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; background-color: rgb(245, 245, 245);\">spring-cloud-starter-bus-amqp</span>&nbsp;&nbsp;<span style=\"background-color: rgb(245, 245, 245); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px;\"><br></span></p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">2.bootstrap.yml新增rabbitmq配置</p><pre style=\"color: rgb(0, 0, 0);\">spring:<br>   rabbitmq:<br>      host: 192.168.79.132<br>      port: 5672<br>      username: admin<br>      password: admin</pre><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">3.修改git仓库配置文件</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\">4.刷新其中一个微服务触发事件,传播到其他的节点 微服务地址/bus/refresh</p>', null, '0', '16', '1', '0', '1', 'springcloud bus 消息中线', 'springcloud bus 消息中线', '1', '2018-09-17 09:29:22', '2018-09-19 22:26:13');
INSERT INTO `biz_article` VALUES ('5', 'redis安装注意事项', '1', 'upload/f5e5eca6-666b-4a2f-bedf-73e08c86286f.jpg', null, '0', '<p><span style=\"font-weight: bold; font-size: x-large;\">protected-mode no 远程访问关闭保护模式</span></p><p><span style=\"font-weight: bold; font-size: x-large;\">requirepass \"123456\" 设置密码</span></p><p><span style=\"font-weight: bold; font-size: x-large;\">bind 0.0.0.0 默认为127.0.0.1(只能本机访问)&nbsp;</span></p><p><p></p></p><p style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; line-height: 1.5;\"><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: bold; font-size: x-large;\">daemonize yes 开启后台启动&nbsp; 默认关闭</span></p>', null, '0', '10', '1', '0', '1', 'redis安装注意事项', 'redis', '1', '2018-09-17 09:57:07', '2018-09-19 22:25:52');
INSERT INTO `biz_article` VALUES ('6', 'Dockerfile基本知识', '1', 'upload/69da89cb-ba4f-4ee0-a484-a878bee1cf7a.jpg', null, '0', '<p></p><h1>Dockerfile基本知识</h1>FROM &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 指定基础镜像<br>MAINTAINER&nbsp; &nbsp;维护者信息<br>RUN&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;你想让他干啥(在命令前加RUN即可)<br>ADD&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;给他点创业基金(COPY文件,会自动解压)<br>WORKDIR&nbsp; &nbsp; &nbsp; &nbsp;设置当前工作,目录<br>VOLUME&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;设置卷,挂载主机目录<br>EXPOSE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;打开端口<br>CMD&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;奔跑吧兄弟(指定容器启动后要干的事情)<br><h1>基于centos7创建nginx的Dockerfile</h1>FROM centos:7<br>MAINTAINER wubo 343618924@qq.com<br>ADD nginx-1.15.0.tar.gz /usr/local/wubo/<br>RUN yum install -y pcre* gcc* openssl* make<br>WORKDIR /usr/local/wubo/nginx-1.15.0<br>VOLUME /data<br>RUN ./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_stub_status_module --with-pcre &amp;&amp; make &amp;&amp; make install<br>RUN echo \"daemon off;\" &gt;&gt; /usr/local/nginx/conf/nginx.conf<br>ENV PATH /usr/local/nginx/sbin:$PTAH<br>EXPOSE 80<br>CMD [\"nginx\"]<p></p>', null, '0', '23', '1', '0', '1', 'Dockerfile基本知识', 'Dockerfile', '1', '2018-09-17 10:07:37', '2018-09-19 22:25:33');
INSERT INTO `biz_article` VALUES ('7', 'springcloud+seluth+rabbitmq+zipkin+elasticsearch+docker-compose链路监控', '1', 'upload/0df34b43-6366-4be5-ba18-80d801ec5b06.jpg', null, '0', '<h1>1.安装好rabbitmq和elasticsearch</h1><h1>2.基于docker-compose搭建zipkin服务端</h1><p>1.编写docker-compose.yml文件</p><div><pre><code><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'宋体\';font-size:13.5pt;\"><span style=\"color:#cc7832;font-weight:bold;\">version</span>: <span style=\"color:#6a8759;\">\'2\'<br></span><span style=\"color:#cc7832;font-weight:bold;\">services</span>:<br>  <span style=\"color:#cc7832;font-weight:bold;\">zipkin</span>:<br>    <span style=\"color:#cc7832;font-weight:bold;\">container_name</span>: zipkin<br>    <span style=\"color:#cc7832;font-weight:bold;\">image</span>: openzipkin/zipkin<br>    <span style=\"color:#cc7832;font-weight:bold;\">environment</span>:<br>      - STORAGE_TYPE=elasticsearch<br>      - ES_HOSTS=192.168.1.110:9200<br>      - RABBIT_ADDRESSES=192.168.1.110:5672<br>      - RABBIT_USER=admin <br>      - RABBIT_PASSWORD=admin<br>    <span style=\"color:#cc7832;font-weight:bold;\">ports</span>:<br>      - 9411:9411</pre></code></pre><p><br></p><p>2.启动zipkin容器<br></p><p>在docker-compose.yml当前目录使用命令 启动 zipkin容器&nbsp; &nbsp;docker-compose up -d</p><p><br></p><h1>3.微服务配置</h1></div><p>1.添加maven依赖&nbsp;</p><pre><code><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'宋体\';font-size:13.5pt;\"><span style=\"color:#e8bf6a;\">&lt;dependency&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;groupId&gt;</span>org.springframework.cloud<span style=\"color:#e8bf6a;\">&lt;/groupId&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;artifactId&gt;</span>spring-cloud-stream-binder-rabbit<span style=\"color:#e8bf6a;\">&lt;/artifactId&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/dependency&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;dependency&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;groupId&gt;</span>org.springframework.cloud<span style=\"color:#e8bf6a;\">&lt;/groupId&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;artifactId&gt;</span>spring-cloud-starter-zipkin<span style=\"color:#e8bf6a;\">&lt;/artifactId&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/dependency&gt;</span></pre></code></pre><p>2.在application.yml中添加rabbitmq配置</p><pre><code><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'宋体\';font-size:13.5pt;\"><span style=\"color:#808080;\">#rabbitmq配置<br></span><span style=\"color:#cc7832;\">spring.rabbitmq.host</span><span style=\"color:#808080;\">=</span><span style=\"color:#6a8759;\">192.168.0.10<br></span><span style=\"color:#cc7832;\">spring.rabbitmq.port</span><span style=\"color:#808080;\">=</span><span style=\"color:#6897bb;\">5672<br></span><span style=\"color:#cc7832;\">spring.rabbitmq.username</span><span style=\"color:#808080;\">=</span><span style=\"color:#6a8759;\">guest<br></span><span style=\"color:#cc7832;\">spring.rabbitmq.password</span><span style=\"color:#808080;\">=</span><span style=\"color:#6a8759;\">guest</span></pre></code></pre>', null, '0', '16', '1', '0', '1', 'springcloud2.0+zipkin+elasticsearch链路监控', 'zipkin  elasticsearch 链路监控', '1', '2018-09-17 16:49:14', '2018-09-21 16:19:15');
INSERT INTO `biz_article` VALUES ('9', 'mybatis动态sql', '1', 'upload/6770d917-d745-4db7-b03b-052e745530d0.jpg', null, '0', '<pre><code><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'宋体\';font-size:13.5pt;\"><span style=\"color:#808080;\">&lt;!--批量动态更新,只产生一条sql,--&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;update </span><span style=\"color:#bababa;\">id</span><span style=\"color:#6a8759;\">=\"batchUpdateDeviceVoiceByCallback\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">    </span>UPDATE pro_device_voice    SET voice_status=<br>    <span style=\"color:#e8bf6a;\">&lt;foreach </span><span style=\"color:#bababa;\">collection</span><span style=\"color:#6a8759;\">=\"list\" </span><span style=\"color:#bababa;\">item</span><span style=\"color:#6a8759;\">=\"item\" </span><span style=\"color:#bababa;\">index</span><span style=\"color:#6a8759;\">=\"index\" </span><span style=\"color:#bababa;\">separator</span><span style=\"color:#6a8759;\">=\" \" </span><span style=\"color:#bababa;\">open</span><span style=\"color:#6a8759;\">=\"case device_imei\" </span><span style=\"color:#bababa;\">close</span><span style=\"color:#6a8759;\">=\"end\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">        </span>when #{item.deviceImei} then #{item.voiceStatus}<br>    <span style=\"color:#e8bf6a;\">&lt;/foreach&gt;<br></span><span style=\"color:#e8bf6a;\">    </span>WHERE batch_no = #{dto.batchNo}<br>    AND device_imei IN<br>    <span style=\"color:#e8bf6a;\">&lt;foreach </span><span style=\"color:#bababa;\">collection</span><span style=\"color:#6a8759;\">=\"dto.list\" </span><span style=\"color:#bababa;\">index</span><span style=\"color:#6a8759;\">=\"index\" </span><span style=\"color:#bababa;\">item</span><span style=\"color:#6a8759;\">=\"item\" </span><span style=\"color:#bababa;\">separator</span><span style=\"color:#6a8759;\">=\",\" </span><span style=\"color:#bababa;\">open</span><span style=\"color:#6a8759;\">=\"(\" </span><span style=\"color:#bababa;\">close</span><span style=\"color:#6a8759;\">=\")\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">        </span>#{item.deviceImei,jdbcType=BIGINT}<br>    <span style=\"color:#e8bf6a;\">&lt;/foreach&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/update&gt;</span></pre><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'宋体\';font-size:13.5pt;\"><span style=\"color:#808080;\">&lt;!--批量更新,需要在连接建立的时候允许批量更新--&gt;<br></span><span style=\"color:#808080;\">&lt;!--jdbc:mysql://localhost:3306/test?useUnicode=true&amp;characterEncoding=utf-8&amp;allowMultiQueries=true--&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;insert </span><span style=\"color:#bababa;\">id</span><span style=\"color:#6a8759;\">=\"batchUpdate\" </span><span style=\"color:#bababa;\">parameterType</span><span style=\"color:#6a8759;\">=\"java.util.List\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;foreach </span><span style=\"color:#bababa;\">collection</span><span style=\"color:#6a8759;\">=\"list\" </span><span style=\"color:#bababa;\">item</span><span style=\"color:#6a8759;\">=\"item\" </span><span style=\"color:#bababa;\">index</span><span style=\"color:#6a8759;\">=\"index\" </span><span style=\"color:#bababa;\">open</span><span style=\"color:#6a8759;\">=\"begin\" </span><span style=\"color:#bababa;\">close</span><span style=\"color:#6a8759;\">=\";end;\" </span><span style=\"color:#bababa;\">separator</span><span style=\"color:#6a8759;\">=\";\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">        </span>UPDATE pro_device<br>        SET<br>        is_deleted = #{item.deleteSign},<br>        modify_time = NOW(),<br>        modify_id = #{item.userId,jdbcType=BIGINT}<br>        WHERE device_id = #{item.deviceId}<br>    <span style=\"color:#e8bf6a;\">&lt;/foreach&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/insert&gt;</span></pre></code></pre><pre><code><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'宋体\';font-size:13.5pt;\"><span style=\"color:#808080;\">&lt;!--批量新增1.多条sql 支持事务--&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;insert </span><span style=\"color:#bababa;\">id</span><span style=\"color:#6a8759;\">=\"insertList\" </span><span style=\"color:#bababa;\">parameterType</span><span style=\"color:#6a8759;\">=\"java.util.List\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;foreach </span><span style=\"color:#bababa;\">collection</span><span style=\"color:#6a8759;\">=\"list\" </span><span style=\"color:#bababa;\">item</span><span style=\"color:#6a8759;\">=\"item\" </span><span style=\"color:#bababa;\">index</span><span style=\"color:#6a8759;\">=\"index\" </span><span style=\"color:#bababa;\">open</span><span style=\"color:#6a8759;\">=\"begin\" </span><span style=\"color:#bababa;\">close</span><span style=\"color:#6a8759;\">=\";end;\" </span><span style=\"color:#bababa;\">separator</span><span style=\"color:#6a8759;\">=\";\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">        </span>INSERT INTO t_account_list<br>        (account_submitor,account_gender,accoun)<br>        VALUES<br>        (#{item.accountSubmitor},#{item.accountGender})<br>    <span style=\"color:#e8bf6a;\">&lt;/foreach&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/insert&gt;</span></pre><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'宋体\';font-size:13.5pt;\"><span style=\"color:#808080;\">&lt;!--批量更新,只会产生一条sql--&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;insert </span><span style=\"color:#bababa;\">id</span><span style=\"color:#6a8759;\">=\"batchInsertDeviceVoice\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">    </span>INSERT INTO pro_device_voice<br>    (send_user_id, send_user_name)<br>    VALUES<br>    <span style=\"color:#e8bf6a;\">&lt;foreach </span><span style=\"color:#bababa;\">collection</span><span style=\"color:#6a8759;\">=\"list\" </span><span style=\"color:#bababa;\">item</span><span style=\"color:#6a8759;\">=\"deviceVoice\" </span><span style=\"color:#bababa;\">separator</span><span style=\"color:#6a8759;\">=\",\"</span><span style=\"color:#e8bf6a;\">&gt;<br></span><span style=\"color:#e8bf6a;\">        </span>(#{deviceVoice.sendUserId,jdbcType=BIGINT}, #{deviceVoice.sendUserName,jdbcType=VARCHAR})<br>    <span style=\"color:#e8bf6a;\">&lt;/foreach&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/insert&gt;</span></pre></code></pre>', null, '0', '20', '1', '0', '1', 'mybatis动态sql', ' mysql  mybatis  动态sql', '1', '2018-09-21 11:20:17', '2018-09-21 16:19:11');
INSERT INTO `biz_article` VALUES ('10', 'CAS原子操作', '1', 'upload/f9a20829-0905-49fb-822d-2692a66abee4.jpg', null, '0', '<p>1.什么叫做CAS</p><p>CAS即compare and swap的缩写,中文翻译为比较并且替换</p><p>CAS原理:</p><p>&nbsp; &nbsp; \n\nCAS 操作包含三个操作数 —— 内存位置（V）、预期原值（A）和新值(B)。 如果内存位置的值与预期原值相匹配，那么处理器会自动将该位置值更新为新值 。</p><p>&nbsp; &nbsp;否则，处理器不做任何操作。无论哪种情况，它都会在 CAS 指令之前返回该 位置的值。（在 CAS 的一些特殊情况下将仅返回 CAS 是否成功，而不提取当前 值。）</p><p>&nbsp; &nbsp;CAS 有效地说明了“我认为位置 V 应该包含值 A；如果包含该值，则将 B 放到这个位置；否则，不要更改该位置，只告诉我这个位置现在的值即可。”&nbsp;<br></p>', null, '0', '28', '1', '0', '1', 'CAS原子操作', 'CAS 原子操作 ', '1', '2018-09-21 17:06:01', '2018-09-25 10:49:21');
INSERT INTO `biz_article` VALUES ('11', 'nexus3 maven私服搭建', '1', '', null, '0', '<p>Nexus3 docker 安装<br>1.创建数据目录卷&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mkdir /home/nexus-data &amp;&amp; chown -R 200 /home/nexus-data</p><p>2.启动nexusdocker容器&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; docker run -d -p 8081:8081 --name nexus&nbsp; &nbsp;-u root&nbsp; &nbsp;-e NEXUS_CONTEXT=nexus&nbsp; -v /home/nexus-data:/nexus-data sonatype/nexus3</p><p>3.在maven的setting.xml的servers标签下新增以下标签 ,将jar包发送到私服的凭证</p><pre><code><p>    &lt;server&gt;<br>        &lt;id&gt;nexus-releases&lt;/id&gt;<br>        &lt;username&gt;admin&lt;/username&gt;<br>        &lt;password&gt;admin123&lt;/password&gt;<br>    &lt;/server&gt;<br>    &lt;server&gt;<br>        &lt;id&gt;nexus-snapshots&lt;/id&gt;<br>        &lt;username&gt;admin&lt;/username&gt;<br>        &lt;password&gt;admin123&lt;/password&gt;<br>    &lt;/server&gt;</p></code></pre><p><br></p><p>4.在项目中新增以下配置,</p><pre><code><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'Courier New\';font-size:12.0pt;\"><span style=\"color:#808080;\">&lt;!-- 设定插件仓库 --&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;pluginRepositories&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;pluginRepository&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;id&gt;</span>nexus<span style=\"color:#e8bf6a;\">&lt;/id&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;url&gt;</span>http://maven.aliyun.com/nexus/content/groups/public/<span style=\"color:#e8bf6a;\">&lt;/url&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;releases&gt;<br></span><span style=\"color:#e8bf6a;\">            &lt;enabled&gt;</span>true<span style=\"color:#e8bf6a;\">&lt;/enabled&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;/releases&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;snapshots&gt;<br></span><span style=\"color:#e8bf6a;\">            &lt;enabled&gt;</span>true<span style=\"color:#e8bf6a;\">&lt;/enabled&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;/snapshots&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;/pluginRepository&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/pluginRepositories&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;repositories&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;repository&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;id&gt;</span>nexus<span style=\"color:#e8bf6a;\">&lt;/id&gt;<br></span><span style=\"color:#e8bf6a;\">        </span><span style=\"color:#808080;\">&lt;!--<br></span><span style=\"color:#808080;\">        &lt;url&gt;http://maven.aliyun.com/nexus/content/groups/public/&lt;/url&gt; --&gt;<br></span><span style=\"color:#808080;\">        </span><span style=\"color:#e8bf6a;\">&lt;url&gt;</span>http://192.168.1.110:7080/nexus/repository/maven-public/<span style=\"color:#e8bf6a;\">&lt;/url&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;releases&gt;<br></span><span style=\"color:#e8bf6a;\">            &lt;enabled&gt;</span>true<span style=\"color:#e8bf6a;\">&lt;/enabled&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;/releases&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;snapshots&gt;<br></span><span style=\"color:#e8bf6a;\">            &lt;enabled&gt;</span>true<span style=\"color:#e8bf6a;\">&lt;/enabled&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;/snapshots&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;/repository&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;repository&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;id&gt;</span>spring-milestones<span style=\"color:#e8bf6a;\">&lt;/id&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;name&gt;</span>Spring Milestones<span style=\"color:#e8bf6a;\">&lt;/name&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;url&gt;</span>https://repo.spring.io/milestone<span style=\"color:#e8bf6a;\">&lt;/url&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;snapshots&gt;<br></span><span style=\"color:#e8bf6a;\">            &lt;enabled&gt;</span>false<span style=\"color:#e8bf6a;\">&lt;/enabled&gt;<br></span><span style=\"color:#e8bf6a;\">        &lt;/snapshots&gt;<br></span><span style=\"color:#e8bf6a;\">    &lt;/repository&gt;<br></span><span style=\"color:#e8bf6a;\">&lt;/repositories&gt;</span></pre></code></pre><p><br></p><p><br></p><p><br></p>', null, '0', '26', '1', '0', '1', 'nexus maven 私服', 'nexus maven 私服', '1', '2018-10-22 10:41:53', '2018-11-07 17:50:52');
INSERT INTO `biz_article` VALUES ('12', 'Docker常用命令', '1', 'upload/69da89cb-ba4f-4ee0-a484-a878bee1cf7a.jpg', null, '0', '<p>docker容器创建之后,设置启动策略 docker update --restart always  nexus<br></p>', null, '0', '23', '1', '0', '1', 'Docker常用命令', 'Docker', '1', '2018-11-02 09:42:24', '2018-11-02 09:42:24');
INSERT INTO `biz_article` VALUES ('13', 'jenkins配合nexus配合打包遇到的问题', '1', 'upload/69da89cb-ba4f-4ee0-a484-a878bee1cf7a.jpg', null, '0', '<p><span style=\"font-size: large; font-weight: bold;\">jenkins打包的时候依赖jar包代码有改变,发布快照版本到nexus,</span></p><p><span style=\"font-size: large; font-weight: bold;\">如果jar包版本未发生变化,jenkins不会再去nexus上拉去最新版本的代码</span></p><p><span style=\"font-size: large; font-weight: bold;\">解决办法1.</span></p><p>&nbsp; &nbsp;&nbsp;<span style=\"font-size: large; font-weight: bold;\">jenkins打包之前删除本地maven仓库的jar包,</span></p><p><span style=\"font-size: large; font-weight: bold;\">&nbsp; &nbsp;这样本地仓库不存在代码,</span><span style=\"font-size: large; font-weight: bold;\">就会去nexus远程仓库拉去最新的代码</span></p>', null, '0', '5', '1', '0', '1', 'jenkins nexus 打包', 'jenkins nexus', '1', '2018-11-07 17:56:03', '2018-11-07 17:57:57');

-- ----------------------------
-- Table structure for biz_article_look
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_look`;
CREATE TABLE `biz_article_look` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) DEFAULT NULL COMMENT '用户IP',
  `look_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '浏览时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article_look
-- ----------------------------
INSERT INTO `biz_article_look` VALUES ('1', '4', null, '222.211.249.239', '2018-09-21 16:33:01', '2018-09-21 16:33:01', '2018-09-21 16:33:01');
INSERT INTO `biz_article_look` VALUES ('2', '1', null, '222.211.249.239', '2018-09-21 16:33:17', '2018-09-21 16:33:17', '2018-09-21 16:33:17');
INSERT INTO `biz_article_look` VALUES ('3', '7', null, '222.211.249.239', '2018-09-21 16:47:19', '2018-09-21 16:47:19', '2018-09-21 16:47:19');
INSERT INTO `biz_article_look` VALUES ('4', '1', null, '222.211.249.239', '2018-09-21 16:57:01', '2018-09-21 16:57:01', '2018-09-21 16:57:01');
INSERT INTO `biz_article_look` VALUES ('5', '1', null, '222.211.249.239', '2018-09-21 16:57:33', '2018-09-21 16:57:33', '2018-09-21 16:57:33');
INSERT INTO `biz_article_look` VALUES ('6', '1', null, '222.211.249.239', '2018-09-21 16:57:57', '2018-09-21 16:57:57', '2018-09-21 16:57:57');
INSERT INTO `biz_article_look` VALUES ('7', '1', null, '222.211.249.239', '2018-09-21 16:58:30', '2018-09-21 16:58:30', '2018-09-21 16:58:30');
INSERT INTO `biz_article_look` VALUES ('8', '1', null, '222.211.249.239', '2018-09-21 16:58:53', '2018-09-21 16:58:53', '2018-09-21 16:58:53');
INSERT INTO `biz_article_look` VALUES ('9', '1', null, '222.211.249.239', '2018-09-21 16:58:56', '2018-09-21 16:58:56', '2018-09-21 16:58:56');
INSERT INTO `biz_article_look` VALUES ('10', '1', null, '222.211.249.239', '2018-09-21 16:58:58', '2018-09-21 16:58:58', '2018-09-21 16:58:58');
INSERT INTO `biz_article_look` VALUES ('11', '1', null, '222.211.249.239', '2018-09-21 16:58:59', '2018-09-21 16:58:59', '2018-09-21 16:58:59');
INSERT INTO `biz_article_look` VALUES ('12', '10', null, '222.211.249.239', '2018-09-21 17:06:16', '2018-09-21 17:06:16', '2018-09-21 17:06:16');
INSERT INTO `biz_article_look` VALUES ('13', '10', null, '222.211.249.239', '2018-09-21 17:37:29', '2018-09-21 17:37:29', '2018-09-21 17:37:29');
INSERT INTO `biz_article_look` VALUES ('14', '6', null, '222.211.249.239', '2018-09-21 17:37:45', '2018-09-21 17:37:45', '2018-09-21 17:37:45');
INSERT INTO `biz_article_look` VALUES ('15', '6', null, '222.211.249.239', '2018-09-21 17:38:00', '2018-09-21 17:38:00', '2018-09-21 17:38:00');
INSERT INTO `biz_article_look` VALUES ('16', '6', null, '222.211.249.239', '2018-09-21 17:38:12', '2018-09-21 17:38:12', '2018-09-21 17:38:12');
INSERT INTO `biz_article_look` VALUES ('17', '10', null, '110.184.69.6', '2018-09-21 23:45:42', '2018-09-21 23:45:42', '2018-09-21 23:45:42');
INSERT INTO `biz_article_look` VALUES ('18', '10', null, '110.184.69.6', '2018-09-22 01:32:50', '2018-09-22 01:32:50', '2018-09-22 01:32:50');
INSERT INTO `biz_article_look` VALUES ('19', '9', null, '110.184.69.6', '2018-09-22 01:41:54', '2018-09-22 01:41:54', '2018-09-22 01:41:54');
INSERT INTO `biz_article_look` VALUES ('20', '6', null, '110.184.69.6', '2018-09-22 01:50:35', '2018-09-22 01:50:35', '2018-09-22 01:50:35');
INSERT INTO `biz_article_look` VALUES ('21', '6', null, '0:0:0:0:0:0:0:1', '2018-09-22 01:50:45', '2018-09-22 01:50:45', '2018-09-22 01:50:45');
INSERT INTO `biz_article_look` VALUES ('22', '9', null, '140.205.205.25', '2018-09-22 03:24:47', '2018-09-22 03:24:47', '2018-09-22 03:24:47');
INSERT INTO `biz_article_look` VALUES ('23', '3', null, '140.205.205.25', '2018-09-22 03:24:48', '2018-09-22 03:24:48', '2018-09-22 03:24:48');
INSERT INTO `biz_article_look` VALUES ('24', '7', null, '140.205.205.23', '2018-09-22 03:24:48', '2018-09-22 03:24:48', '2018-09-22 03:24:48');
INSERT INTO `biz_article_look` VALUES ('25', '5', null, '140.205.205.25', '2018-09-22 03:24:48', '2018-09-22 03:24:48', '2018-09-22 03:24:48');
INSERT INTO `biz_article_look` VALUES ('26', '10', null, '140.205.205.23', '2018-09-22 03:24:48', '2018-09-22 03:24:48', '2018-09-22 03:24:48');
INSERT INTO `biz_article_look` VALUES ('27', '4', null, '140.205.205.23', '2018-09-22 03:24:48', '2018-09-22 03:24:48', '2018-09-22 03:24:48');
INSERT INTO `biz_article_look` VALUES ('28', '1', null, '140.205.205.23', '2018-09-22 03:24:48', '2018-09-22 03:24:48', '2018-09-22 03:24:48');
INSERT INTO `biz_article_look` VALUES ('29', '6', null, '140.205.205.23', '2018-09-22 03:24:50', '2018-09-22 03:24:50', '2018-09-22 03:24:50');
INSERT INTO `biz_article_look` VALUES ('30', '10', null, '110.184.69.6', '2018-09-22 10:41:12', '2018-09-22 10:41:12', '2018-09-22 10:41:12');
INSERT INTO `biz_article_look` VALUES ('31', '5', null, '140.205.205.25', '2018-09-23 07:23:17', '2018-09-23 07:23:17', '2018-09-23 07:23:17');
INSERT INTO `biz_article_look` VALUES ('32', '4', null, '140.205.205.23', '2018-09-23 07:23:17', '2018-09-23 07:23:17', '2018-09-23 07:23:17');
INSERT INTO `biz_article_look` VALUES ('33', '9', null, '140.205.205.25', '2018-09-23 07:23:17', '2018-09-23 07:23:17', '2018-09-23 07:23:17');
INSERT INTO `biz_article_look` VALUES ('34', '6', null, '140.205.205.25', '2018-09-23 07:23:17', '2018-09-23 07:23:17', '2018-09-23 07:23:17');
INSERT INTO `biz_article_look` VALUES ('35', '10', null, '140.205.205.23', '2018-09-23 07:23:18', '2018-09-23 07:23:18', '2018-09-23 07:23:18');
INSERT INTO `biz_article_look` VALUES ('36', '3', null, '140.205.205.25', '2018-09-23 07:23:18', '2018-09-23 07:23:18', '2018-09-23 07:23:18');
INSERT INTO `biz_article_look` VALUES ('37', '1', null, '140.205.205.23', '2018-09-23 07:23:19', '2018-09-23 07:23:19', '2018-09-23 07:23:19');
INSERT INTO `biz_article_look` VALUES ('38', '7', null, '140.205.205.23', '2018-09-23 07:23:19', '2018-09-23 07:23:19', '2018-09-23 07:23:19');
INSERT INTO `biz_article_look` VALUES ('39', '6', null, '203.208.60.93', '2018-09-23 18:55:39', '2018-09-23 18:55:39', '2018-09-23 18:55:39');
INSERT INTO `biz_article_look` VALUES ('40', '9', null, '203.208.60.108', '2018-09-23 18:55:46', '2018-09-23 18:55:46', '2018-09-23 18:55:46');
INSERT INTO `biz_article_look` VALUES ('41', '5', null, '203.208.60.107', '2018-09-23 18:55:54', '2018-09-23 18:55:54', '2018-09-23 18:55:54');
INSERT INTO `biz_article_look` VALUES ('42', '3', null, '203.208.60.34', '2018-09-23 18:56:01', '2018-09-23 18:56:01', '2018-09-23 18:56:01');
INSERT INTO `biz_article_look` VALUES ('43', '1', null, '203.208.60.58', '2018-09-23 18:56:09', '2018-09-23 18:56:09', '2018-09-23 18:56:09');
INSERT INTO `biz_article_look` VALUES ('44', '7', null, '203.208.60.86', '2018-09-23 18:56:16', '2018-09-23 18:56:16', '2018-09-23 18:56:16');
INSERT INTO `biz_article_look` VALUES ('45', '4', null, '203.208.60.122', '2018-09-23 18:56:24', '2018-09-23 18:56:24', '2018-09-23 18:56:24');
INSERT INTO `biz_article_look` VALUES ('46', '10', null, '203.208.60.67', '2018-09-23 18:56:32', '2018-09-23 18:56:32', '2018-09-23 18:56:32');
INSERT INTO `biz_article_look` VALUES ('47', '3', null, '203.208.60.96', '2018-09-24 07:09:37', '2018-09-24 07:09:37', '2018-09-24 07:09:37');
INSERT INTO `biz_article_look` VALUES ('48', '3', null, '140.205.205.25', '2018-09-24 07:21:34', '2018-09-24 07:21:34', '2018-09-24 07:21:34');
INSERT INTO `biz_article_look` VALUES ('49', '4', null, '140.205.205.23', '2018-09-24 07:21:34', '2018-09-24 07:21:34', '2018-09-24 07:21:34');
INSERT INTO `biz_article_look` VALUES ('50', '6', null, '140.205.205.25', '2018-09-24 07:21:34', '2018-09-24 07:21:34', '2018-09-24 07:21:34');
INSERT INTO `biz_article_look` VALUES ('51', '1', null, '140.205.205.25', '2018-09-24 07:21:35', '2018-09-24 07:21:35', '2018-09-24 07:21:35');
INSERT INTO `biz_article_look` VALUES ('52', '7', null, '140.205.205.23', '2018-09-24 07:21:35', '2018-09-24 07:21:35', '2018-09-24 07:21:35');
INSERT INTO `biz_article_look` VALUES ('53', '10', null, '140.205.205.23', '2018-09-24 07:21:35', '2018-09-24 07:21:35', '2018-09-24 07:21:35');
INSERT INTO `biz_article_look` VALUES ('54', '5', null, '140.205.205.23', '2018-09-24 07:21:35', '2018-09-24 07:21:35', '2018-09-24 07:21:35');
INSERT INTO `biz_article_look` VALUES ('55', '9', null, '140.205.205.25', '2018-09-24 07:21:36', '2018-09-24 07:21:36', '2018-09-24 07:21:36');
INSERT INTO `biz_article_look` VALUES ('56', '7', null, '203.208.60.84', '2018-09-24 10:52:36', '2018-09-24 10:52:36', '2018-09-24 10:52:36');
INSERT INTO `biz_article_look` VALUES ('57', '10', null, '203.208.60.66', '2018-09-24 11:12:57', '2018-09-24 11:12:57', '2018-09-24 11:12:57');
INSERT INTO `biz_article_look` VALUES ('58', '1', null, '203.208.60.60', '2018-09-24 13:34:47', '2018-09-24 13:34:47', '2018-09-24 13:34:47');
INSERT INTO `biz_article_look` VALUES ('59', '6', null, '203.208.60.37', '2018-09-24 18:19:41', '2018-09-24 18:19:41', '2018-09-24 18:19:41');
INSERT INTO `biz_article_look` VALUES ('60', '9', null, '203.208.60.78', '2018-09-24 18:21:33', '2018-09-24 18:21:33', '2018-09-24 18:21:33');
INSERT INTO `biz_article_look` VALUES ('61', '5', null, '203.208.60.15', '2018-09-24 18:24:53', '2018-09-24 18:24:53', '2018-09-24 18:24:53');
INSERT INTO `biz_article_look` VALUES ('62', '3', null, '203.208.60.45', '2018-09-24 18:27:18', '2018-09-24 18:27:18', '2018-09-24 18:27:18');
INSERT INTO `biz_article_look` VALUES ('63', '4', null, '203.208.60.74', '2018-09-24 18:40:05', '2018-09-24 18:40:05', '2018-09-24 18:40:05');
INSERT INTO `biz_article_look` VALUES ('64', '10', null, '203.208.60.127', '2018-09-24 19:10:24', '2018-09-24 19:10:24', '2018-09-24 19:10:24');
INSERT INTO `biz_article_look` VALUES ('65', '9', null, '140.205.205.25', '2018-09-25 07:17:33', '2018-09-25 07:17:33', '2018-09-25 07:17:33');
INSERT INTO `biz_article_look` VALUES ('66', '3', null, '140.205.205.25', '2018-09-25 07:17:33', '2018-09-25 07:17:33', '2018-09-25 07:17:33');
INSERT INTO `biz_article_look` VALUES ('67', '4', null, '140.205.205.23', '2018-09-25 07:17:33', '2018-09-25 07:17:33', '2018-09-25 07:17:33');
INSERT INTO `biz_article_look` VALUES ('68', '6', null, '140.205.205.23', '2018-09-25 07:17:33', '2018-09-25 07:17:33', '2018-09-25 07:17:33');
INSERT INTO `biz_article_look` VALUES ('69', '7', null, '140.205.205.23', '2018-09-25 07:17:33', '2018-09-25 07:17:33', '2018-09-25 07:17:33');
INSERT INTO `biz_article_look` VALUES ('70', '1', null, '140.205.205.23', '2018-09-25 07:17:33', '2018-09-25 07:17:34', '2018-09-25 07:17:34');
INSERT INTO `biz_article_look` VALUES ('71', '5', null, '140.205.205.23', '2018-09-25 07:17:34', '2018-09-25 07:17:34', '2018-09-25 07:17:34');
INSERT INTO `biz_article_look` VALUES ('72', '10', null, '140.205.205.23', '2018-09-25 07:17:34', '2018-09-25 07:17:34', '2018-09-25 07:17:34');
INSERT INTO `biz_article_look` VALUES ('73', '7', null, '203.208.60.109', '2018-09-25 10:34:49', '2018-09-25 10:34:49', '2018-09-25 10:34:49');
INSERT INTO `biz_article_look` VALUES ('74', '10', null, '222.210.11.140', '2018-09-25 10:49:57', '2018-09-25 10:49:57', '2018-09-25 10:49:57');
INSERT INTO `biz_article_look` VALUES ('75', '5', null, '203.208.60.107', '2018-09-25 10:54:38', '2018-09-25 10:54:38', '2018-09-25 10:54:38');
INSERT INTO `biz_article_look` VALUES ('76', '6', null, '203.208.60.58', '2018-09-25 11:34:15', '2018-09-25 11:34:15', '2018-09-25 11:34:15');
INSERT INTO `biz_article_look` VALUES ('77', '9', null, '203.208.60.28', '2018-09-25 13:04:26', '2018-09-25 13:04:26', '2018-09-25 13:04:26');
INSERT INTO `biz_article_look` VALUES ('78', '1', null, '203.208.60.102', '2018-09-25 13:15:48', '2018-09-25 13:15:48', '2018-09-25 13:15:48');
INSERT INTO `biz_article_look` VALUES ('79', '3', null, '203.208.60.72', '2018-09-25 13:44:19', '2018-09-25 13:44:19', '2018-09-25 13:44:19');
INSERT INTO `biz_article_look` VALUES ('80', '4', null, '203.208.60.23', '2018-09-25 13:54:31', '2018-09-25 13:54:31', '2018-09-25 13:54:31');
INSERT INTO `biz_article_look` VALUES ('81', '10', null, '203.208.60.39', '2018-09-25 14:04:39', '2018-09-25 14:04:39', '2018-09-25 14:04:39');
INSERT INTO `biz_article_look` VALUES ('82', '10', null, '203.208.60.29', '2018-09-25 14:44:35', '2018-09-25 14:44:35', '2018-09-25 14:44:35');
INSERT INTO `biz_article_look` VALUES ('83', '9', null, '140.205.205.25', '2018-09-26 07:20:12', '2018-09-26 07:20:12', '2018-09-26 07:20:12');
INSERT INTO `biz_article_look` VALUES ('84', '6', null, '140.205.205.25', '2018-09-26 07:20:12', '2018-09-26 07:20:12', '2018-09-26 07:20:12');
INSERT INTO `biz_article_look` VALUES ('85', '1', null, '140.205.205.25', '2018-09-26 07:20:12', '2018-09-26 07:20:12', '2018-09-26 07:20:12');
INSERT INTO `biz_article_look` VALUES ('86', '3', null, '140.205.205.25', '2018-09-26 07:20:12', '2018-09-26 07:20:12', '2018-09-26 07:20:12');
INSERT INTO `biz_article_look` VALUES ('87', '5', null, '140.205.205.25', '2018-09-26 07:20:12', '2018-09-26 07:20:12', '2018-09-26 07:20:12');
INSERT INTO `biz_article_look` VALUES ('88', '10', null, '140.205.205.25', '2018-09-26 07:20:13', '2018-09-26 07:20:13', '2018-09-26 07:20:13');
INSERT INTO `biz_article_look` VALUES ('89', '4', null, '140.205.205.25', '2018-09-26 07:20:13', '2018-09-26 07:20:13', '2018-09-26 07:20:13');
INSERT INTO `biz_article_look` VALUES ('90', '7', null, '140.205.205.25', '2018-09-26 07:20:13', '2018-09-26 07:20:13', '2018-09-26 07:20:13');
INSERT INTO `biz_article_look` VALUES ('91', '3', null, '101.227.12.55', '2018-09-26 10:06:17', '2018-09-26 10:06:17', '2018-09-26 10:06:17');
INSERT INTO `biz_article_look` VALUES ('92', '10', null, '222.210.11.140', '2018-09-26 15:11:02', '2018-09-26 15:11:02', '2018-09-26 15:11:02');
INSERT INTO `biz_article_look` VALUES ('93', '9', null, '140.205.205.25', '2018-09-27 07:17:22', '2018-09-27 07:17:22', '2018-09-27 07:17:22');
INSERT INTO `biz_article_look` VALUES ('94', '4', null, '140.205.205.25', '2018-09-27 07:17:22', '2018-09-27 07:17:22', '2018-09-27 07:17:22');
INSERT INTO `biz_article_look` VALUES ('95', '6', null, '140.205.205.23', '2018-09-27 07:17:22', '2018-09-27 07:17:22', '2018-09-27 07:17:22');
INSERT INTO `biz_article_look` VALUES ('96', '5', null, '140.205.205.25', '2018-09-27 07:17:22', '2018-09-27 07:17:22', '2018-09-27 07:17:22');
INSERT INTO `biz_article_look` VALUES ('97', '3', null, '140.205.205.25', '2018-09-27 07:17:22', '2018-09-27 07:17:22', '2018-09-27 07:17:22');
INSERT INTO `biz_article_look` VALUES ('98', '10', null, '140.205.205.25', '2018-09-27 07:17:22', '2018-09-27 07:17:22', '2018-09-27 07:17:22');
INSERT INTO `biz_article_look` VALUES ('99', '9', null, '222.210.11.140', '2018-09-27 10:14:22', '2018-09-27 10:14:22', '2018-09-27 10:14:22');
INSERT INTO `biz_article_look` VALUES ('100', '9', null, '222.210.11.140', '2018-09-27 10:19:06', '2018-09-27 10:19:06', '2018-09-27 10:19:06');
INSERT INTO `biz_article_look` VALUES ('101', '5', null, '140.205.205.25', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('102', '1', null, '140.205.205.23', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('103', '10', null, '140.205.205.25', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('104', '7', null, '140.205.205.25', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('105', '3', null, '140.205.205.23', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('106', '9', null, '140.205.205.25', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('107', '6', null, '140.205.205.23', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('108', '4', null, '140.205.205.23', '2018-09-28 03:21:32', '2018-09-28 03:21:32', '2018-09-28 03:21:32');
INSERT INTO `biz_article_look` VALUES ('109', '4', null, '183.57.53.196', '2018-09-28 08:59:34', '2018-09-28 08:59:34', '2018-09-28 08:59:34');
INSERT INTO `biz_article_look` VALUES ('110', '9', null, '222.211.235.6', '2018-09-29 17:03:02', '2018-09-29 17:03:02', '2018-09-29 17:03:02');
INSERT INTO `biz_article_look` VALUES ('111', '9', null, '183.57.53.222', '2018-09-29 17:03:24', '2018-09-29 17:03:24', '2018-09-29 17:03:24');
INSERT INTO `biz_article_look` VALUES ('112', '9', null, '61.151.178.236', '2018-09-29 17:03:24', '2018-09-29 17:03:24', '2018-09-29 17:03:24');
INSERT INTO `biz_article_look` VALUES ('113', '9', null, '180.97.118.219', '2018-09-29 17:03:24', '2018-09-29 17:03:24', '2018-09-29 17:03:24');
INSERT INTO `biz_article_look` VALUES ('114', '9', null, '222.211.235.6', '2018-09-29 17:03:25', '2018-09-29 17:03:25', '2018-09-29 17:03:25');
INSERT INTO `biz_article_look` VALUES ('115', '9', null, '116.30.222.221', '2018-09-29 17:03:29', '2018-09-29 17:03:29', '2018-09-29 17:03:29');
INSERT INTO `biz_article_look` VALUES ('116', '9', null, '219.136.9.4', '2018-09-29 17:03:39', '2018-09-29 17:03:39', '2018-09-29 17:03:39');
INSERT INTO `biz_article_look` VALUES ('117', '9', null, '222.211.205.180', '2018-09-29 17:03:59', '2018-09-29 17:03:59', '2018-09-29 17:03:59');
INSERT INTO `biz_article_look` VALUES ('118', '10', null, '219.136.9.4', '2018-09-29 17:10:21', '2018-09-29 17:10:21', '2018-09-29 17:10:21');
INSERT INTO `biz_article_look` VALUES ('119', '5', null, '219.136.9.4', '2018-09-29 17:10:22', '2018-09-29 17:10:22', '2018-09-29 17:10:22');
INSERT INTO `biz_article_look` VALUES ('120', '6', null, '219.136.9.4', '2018-09-29 17:10:32', '2018-09-29 17:10:32', '2018-09-29 17:10:32');
INSERT INTO `biz_article_look` VALUES ('121', '9', null, '219.136.9.4', '2018-09-29 17:11:17', '2018-09-29 17:11:17', '2018-09-29 17:11:17');
INSERT INTO `biz_article_look` VALUES ('122', '9', null, '183.159.231.228', '2018-09-29 19:25:50', '2018-09-29 19:25:50', '2018-09-29 19:25:50');
INSERT INTO `biz_article_look` VALUES ('123', '9', null, '14.17.3.64', '2018-09-29 22:21:52', '2018-09-29 22:21:52', '2018-09-29 22:21:52');
INSERT INTO `biz_article_look` VALUES ('124', '9', null, '59.36.119.226', '2018-09-30 09:03:37', '2018-09-30 09:03:37', '2018-09-30 09:03:37');
INSERT INTO `biz_article_look` VALUES ('125', '10', null, '222.211.235.6', '2018-09-30 17:29:23', '2018-09-30 17:29:23', '2018-09-30 17:29:23');
INSERT INTO `biz_article_look` VALUES ('126', '1', null, '222.211.235.6', '2018-09-30 17:31:17', '2018-09-30 17:31:17', '2018-09-30 17:31:17');
INSERT INTO `biz_article_look` VALUES ('127', '10', null, '222.211.235.6', '2018-09-30 17:31:49', '2018-09-30 17:31:49', '2018-09-30 17:31:49');
INSERT INTO `biz_article_look` VALUES ('128', '10', null, '222.211.235.6', '2018-09-30 17:31:52', '2018-09-30 17:31:52', '2018-09-30 17:31:52');
INSERT INTO `biz_article_look` VALUES ('129', '10', null, '222.211.235.6', '2018-09-30 17:31:56', '2018-09-30 17:31:56', '2018-09-30 17:31:56');
INSERT INTO `biz_article_look` VALUES ('130', '1', null, '173.212.201.251', '2018-10-01 02:57:28', '2018-10-01 02:57:28', '2018-10-01 02:57:28');
INSERT INTO `biz_article_look` VALUES ('131', '10', null, '173.212.201.251', '2018-10-01 02:57:30', '2018-10-01 02:57:30', '2018-10-01 02:57:30');
INSERT INTO `biz_article_look` VALUES ('132', '3', null, '173.212.201.251', '2018-10-01 02:57:32', '2018-10-01 02:57:32', '2018-10-01 02:57:32');
INSERT INTO `biz_article_look` VALUES ('133', '4', null, '173.212.201.251', '2018-10-01 02:57:34', '2018-10-01 02:57:34', '2018-10-01 02:57:34');
INSERT INTO `biz_article_look` VALUES ('134', '5', null, '173.212.201.251', '2018-10-01 02:57:36', '2018-10-01 02:57:36', '2018-10-01 02:57:36');
INSERT INTO `biz_article_look` VALUES ('135', '6', null, '173.212.201.251', '2018-10-01 02:57:38', '2018-10-01 02:57:38', '2018-10-01 02:57:38');
INSERT INTO `biz_article_look` VALUES ('136', '7', null, '173.212.201.251', '2018-10-01 02:57:40', '2018-10-01 02:57:40', '2018-10-01 02:57:40');
INSERT INTO `biz_article_look` VALUES ('137', '9', null, '173.212.201.251', '2018-10-01 02:57:44', '2018-10-01 02:57:44', '2018-10-01 02:57:44');
INSERT INTO `biz_article_look` VALUES ('138', '10', null, '110.184.66.84', '2018-10-01 20:42:37', '2018-10-01 20:42:37', '2018-10-01 20:42:37');
INSERT INTO `biz_article_look` VALUES ('139', '9', null, '110.184.66.84', '2018-10-01 20:42:42', '2018-10-01 20:42:42', '2018-10-01 20:42:42');
INSERT INTO `biz_article_look` VALUES ('140', '7', null, '110.184.66.84', '2018-10-01 20:42:48', '2018-10-01 20:42:48', '2018-10-01 20:42:48');
INSERT INTO `biz_article_look` VALUES ('141', '6', null, '203.208.60.34', '2018-10-02 15:57:07', '2018-10-02 15:57:07', '2018-10-02 15:57:07');
INSERT INTO `biz_article_look` VALUES ('142', '9', null, '203.208.60.86', '2018-10-02 17:12:54', '2018-10-02 17:12:54', '2018-10-02 17:12:54');
INSERT INTO `biz_article_look` VALUES ('143', '5', null, '203.208.60.27', '2018-10-02 18:28:41', '2018-10-02 18:28:41', '2018-10-02 18:28:41');
INSERT INTO `biz_article_look` VALUES ('144', '3', null, '203.208.60.22', '2018-10-02 19:44:28', '2018-10-02 19:44:28', '2018-10-02 19:44:28');
INSERT INTO `biz_article_look` VALUES ('145', '1', null, '180.76.15.141', '2018-10-02 19:57:10', '2018-10-02 19:57:10', '2018-10-02 19:57:10');
INSERT INTO `biz_article_look` VALUES ('146', '1', null, '203.208.60.121', '2018-10-02 21:00:16', '2018-10-02 21:00:16', '2018-10-02 21:00:16');
INSERT INTO `biz_article_look` VALUES ('147', '7', null, '203.208.60.107', '2018-10-02 22:16:02', '2018-10-02 22:16:02', '2018-10-02 22:16:02');
INSERT INTO `biz_article_look` VALUES ('148', '4', null, '203.208.60.18', '2018-10-02 23:31:49', '2018-10-02 23:31:49', '2018-10-02 23:31:49');
INSERT INTO `biz_article_look` VALUES ('149', '10', null, '203.208.60.97', '2018-10-03 00:47:36', '2018-10-03 00:47:36', '2018-10-03 00:47:36');
INSERT INTO `biz_article_look` VALUES ('150', '4', null, '203.208.60.62', '2018-10-03 20:22:45', '2018-10-03 20:22:45', '2018-10-03 20:22:45');
INSERT INTO `biz_article_look` VALUES ('151', '7', null, '169.1.219.190', '2018-10-04 06:09:41', '2018-10-04 06:09:41', '2018-10-04 06:09:41');
INSERT INTO `biz_article_look` VALUES ('152', '7', null, '180.76.15.27', '2018-10-04 06:59:01', '2018-10-04 06:59:01', '2018-10-04 06:59:01');
INSERT INTO `biz_article_look` VALUES ('153', '1', null, '110.184.66.42', '2018-10-04 10:09:58', '2018-10-04 10:09:58', '2018-10-04 10:09:58');
INSERT INTO `biz_article_look` VALUES ('154', '1', null, '110.184.66.42', '2018-10-04 10:24:42', '2018-10-04 10:24:42', '2018-10-04 10:24:42');
INSERT INTO `biz_article_look` VALUES ('155', '1', null, '110.184.66.42', '2018-10-04 10:38:21', '2018-10-04 10:38:21', '2018-10-04 10:38:21');
INSERT INTO `biz_article_look` VALUES ('156', '4', null, '203.208.60.32', '2018-10-04 12:30:31', '2018-10-04 12:30:31', '2018-10-04 12:30:31');
INSERT INTO `biz_article_look` VALUES ('157', '4', null, '203.208.60.61', '2018-10-04 21:43:48', '2018-10-04 21:43:48', '2018-10-04 21:43:48');
INSERT INTO `biz_article_look` VALUES ('158', '4', null, '203.208.60.2', '2018-10-05 08:21:47', '2018-10-05 08:21:47', '2018-10-05 08:21:47');
INSERT INTO `biz_article_look` VALUES ('159', '1', null, '180.76.15.34', '2018-10-05 12:32:25', '2018-10-05 12:32:25', '2018-10-05 12:32:25');
INSERT INTO `biz_article_look` VALUES ('160', '4', null, '203.208.60.101', '2018-10-05 19:25:16', '2018-10-05 19:25:16', '2018-10-05 19:25:16');
INSERT INTO `biz_article_look` VALUES ('161', '4', null, '203.208.60.27', '2018-10-06 09:23:23', '2018-10-06 09:23:23', '2018-10-06 09:23:23');
INSERT INTO `biz_article_look` VALUES ('162', '7', null, '180.76.15.14', '2018-10-06 12:41:17', '2018-10-06 12:41:17', '2018-10-06 12:41:17');
INSERT INTO `biz_article_look` VALUES ('163', '4', null, '203.208.60.10', '2018-10-06 18:57:10', '2018-10-06 18:57:10', '2018-10-06 18:57:10');
INSERT INTO `biz_article_look` VALUES ('164', '4', null, '203.208.60.19', '2018-10-07 04:49:34', '2018-10-07 04:49:34', '2018-10-07 04:49:34');
INSERT INTO `biz_article_look` VALUES ('165', '1', null, '180.76.15.143', '2018-10-07 06:08:53', '2018-10-07 06:08:53', '2018-10-07 06:08:53');
INSERT INTO `biz_article_look` VALUES ('166', '4', null, '203.208.60.27', '2018-10-07 14:52:48', '2018-10-07 14:52:48', '2018-10-07 14:52:48');
INSERT INTO `biz_article_look` VALUES ('167', '1', null, '203.208.60.73', '2018-10-07 22:43:49', '2018-10-07 22:43:49', '2018-10-07 22:43:49');
INSERT INTO `biz_article_look` VALUES ('168', '4', null, '203.208.60.114', '2018-10-07 23:24:38', '2018-10-07 23:24:38', '2018-10-07 23:24:38');
INSERT INTO `biz_article_look` VALUES ('169', '10', null, '110.184.64.160', '2018-10-08 07:34:44', '2018-10-08 07:34:44', '2018-10-08 07:34:44');
INSERT INTO `biz_article_look` VALUES ('170', '1', null, '203.208.60.53', '2018-10-08 08:06:29', '2018-10-08 08:06:29', '2018-10-08 08:06:29');
INSERT INTO `biz_article_look` VALUES ('171', '9', null, '222.211.235.85', '2018-10-08 09:27:13', '2018-10-08 09:27:13', '2018-10-08 09:27:13');
INSERT INTO `biz_article_look` VALUES ('172', '3', null, '222.211.235.85', '2018-10-08 09:27:17', '2018-10-08 09:27:17', '2018-10-08 09:27:17');
INSERT INTO `biz_article_look` VALUES ('173', '4', null, '203.208.60.42', '2018-10-08 09:37:23', '2018-10-08 09:37:23', '2018-10-08 09:37:23');
INSERT INTO `biz_article_look` VALUES ('174', '6', null, '222.211.235.85', '2018-10-08 15:35:46', '2018-10-08 15:35:46', '2018-10-08 15:35:46');
INSERT INTO `biz_article_look` VALUES ('175', '5', null, '203.208.60.26', '2018-10-08 17:50:45', '2018-10-08 17:50:45', '2018-10-08 17:50:45');
INSERT INTO `biz_article_look` VALUES ('176', '7', null, '203.208.60.12', '2018-10-08 19:23:12', '2018-10-08 19:23:12', '2018-10-08 19:23:12');
INSERT INTO `biz_article_look` VALUES ('177', '9', null, '203.208.60.70', '2018-10-08 20:52:09', '2018-10-08 20:52:09', '2018-10-08 20:52:09');
INSERT INTO `biz_article_look` VALUES ('178', '4', null, '203.208.60.73', '2018-10-08 23:22:49', '2018-10-08 23:22:49', '2018-10-08 23:22:49');
INSERT INTO `biz_article_look` VALUES ('179', '7', null, '203.208.60.32', '2018-10-09 04:43:55', '2018-10-09 04:43:55', '2018-10-09 04:43:55');
INSERT INTO `biz_article_look` VALUES ('180', '1', null, '203.208.60.25', '2018-10-09 05:33:53', '2018-10-09 05:33:53', '2018-10-09 05:33:53');
INSERT INTO `biz_article_look` VALUES ('181', '9', null, '203.208.60.93', '2018-10-09 07:20:58', '2018-10-09 07:20:58', '2018-10-09 07:20:58');
INSERT INTO `biz_article_look` VALUES ('182', '4', null, '203.208.60.120', '2018-10-09 09:10:45', '2018-10-09 09:10:45', '2018-10-09 09:10:45');
INSERT INTO `biz_article_look` VALUES ('183', '6', null, '203.208.60.101', '2018-10-09 10:08:48', '2018-10-09 10:08:48', '2018-10-09 10:08:48');
INSERT INTO `biz_article_look` VALUES ('184', '7', null, '203.208.60.107', '2018-10-09 13:49:49', '2018-10-09 13:49:49', '2018-10-09 13:49:49');
INSERT INTO `biz_article_look` VALUES ('185', '1', null, '203.208.60.105', '2018-10-09 15:00:03', '2018-10-09 15:00:03', '2018-10-09 15:00:03');
INSERT INTO `biz_article_look` VALUES ('186', '9', null, '203.208.60.9', '2018-10-09 17:08:47', '2018-10-09 17:08:47', '2018-10-09 17:08:47');
INSERT INTO `biz_article_look` VALUES ('187', '4', null, '203.208.60.114', '2018-10-09 18:38:26', '2018-10-09 18:38:26', '2018-10-09 18:38:26');
INSERT INTO `biz_article_look` VALUES ('188', '3', null, '203.208.60.73', '2018-10-09 18:48:19', '2018-10-09 18:48:19', '2018-10-09 18:48:19');
INSERT INTO `biz_article_look` VALUES ('189', '6', null, '203.208.60.20', '2018-10-09 19:38:48', '2018-10-09 19:38:48', '2018-10-09 19:38:48');
INSERT INTO `biz_article_look` VALUES ('190', '10', null, '203.208.60.66', '2018-10-09 20:19:19', '2018-10-09 20:19:19', '2018-10-09 20:19:19');
INSERT INTO `biz_article_look` VALUES ('191', '5', null, '203.208.60.86', '2018-10-09 20:29:36', '2018-10-09 20:29:36', '2018-10-09 20:29:36');
INSERT INTO `biz_article_look` VALUES ('192', '7', null, '203.208.60.90', '2018-10-09 21:20:03', '2018-10-09 21:20:03', '2018-10-09 21:20:03');
INSERT INTO `biz_article_look` VALUES ('193', '7', null, '203.208.60.14', '2018-10-09 23:11:15', '2018-10-09 23:11:15', '2018-10-09 23:11:15');
INSERT INTO `biz_article_look` VALUES ('194', '1', null, '203.208.60.108', '2018-10-10 00:32:32', '2018-10-10 00:32:32', '2018-10-10 00:32:32');
INSERT INTO `biz_article_look` VALUES ('195', '9', null, '203.208.60.99', '2018-10-10 02:42:45', '2018-10-10 02:42:45', '2018-10-10 02:42:45');
INSERT INTO `biz_article_look` VALUES ('196', '9', null, '58.251.121.186', '2018-10-10 03:02:27', '2018-10-10 03:02:27', '2018-10-10 03:02:27');
INSERT INTO `biz_article_look` VALUES ('197', '4', null, '203.208.60.31', '2018-10-10 04:02:54', '2018-10-10 04:02:54', '2018-10-10 04:02:54');
INSERT INTO `biz_article_look` VALUES ('198', '4', null, '203.208.60.18', '2018-10-10 04:02:55', '2018-10-10 04:02:55', '2018-10-10 04:02:55');
INSERT INTO `biz_article_look` VALUES ('199', '3', null, '203.208.60.88', '2018-10-10 04:12:54', '2018-10-10 04:12:54', '2018-10-10 04:12:54');
INSERT INTO `biz_article_look` VALUES ('200', '9', null, '203.208.60.103', '2018-10-10 04:43:00', '2018-10-10 04:43:00', '2018-10-10 04:43:00');
INSERT INTO `biz_article_look` VALUES ('201', '1', null, '203.208.60.40', '2018-10-10 04:53:20', '2018-10-10 04:53:20', '2018-10-10 04:53:20');
INSERT INTO `biz_article_look` VALUES ('202', '6', null, '203.208.60.72', '2018-10-10 05:03:13', '2018-10-10 05:03:13', '2018-10-10 05:03:13');
INSERT INTO `biz_article_look` VALUES ('203', '10', null, '203.208.60.6', '2018-10-10 05:43:07', '2018-10-10 05:43:07', '2018-10-10 05:43:07');
INSERT INTO `biz_article_look` VALUES ('204', '5', null, '203.208.60.18', '2018-10-10 06:23:01', '2018-10-10 06:23:01', '2018-10-10 06:23:01');
INSERT INTO `biz_article_look` VALUES ('205', '7', null, '203.208.60.77', '2018-10-10 08:14:07', '2018-10-10 08:14:07', '2018-10-10 08:14:07');
INSERT INTO `biz_article_look` VALUES ('206', '3', null, '203.208.60.66', '2018-10-10 08:44:44', '2018-10-10 08:44:44', '2018-10-10 08:44:44');
INSERT INTO `biz_article_look` VALUES ('207', '3', null, '203.208.60.98', '2018-10-10 08:44:56', '2018-10-10 08:44:56', '2018-10-10 08:44:56');
INSERT INTO `biz_article_look` VALUES ('208', '1', null, '203.208.60.106', '2018-10-10 10:15:31', '2018-10-10 10:15:31', '2018-10-10 10:15:31');
INSERT INTO `biz_article_look` VALUES ('209', '10', null, '124.239.130.130', '2018-10-10 10:18:23', '2018-10-10 10:18:23', '2018-10-10 10:18:23');
INSERT INTO `biz_article_look` VALUES ('210', '5', null, '203.208.60.93', '2018-10-10 11:05:42', '2018-10-10 11:05:42', '2018-10-10 11:05:42');
INSERT INTO `biz_article_look` VALUES ('211', '3', null, '203.208.60.66', '2018-10-10 13:06:57', '2018-10-10 13:06:57', '2018-10-10 13:06:57');
INSERT INTO `biz_article_look` VALUES ('212', '9', null, '203.208.60.44', '2018-10-10 13:36:41', '2018-10-10 13:36:41', '2018-10-10 13:36:41');
INSERT INTO `biz_article_look` VALUES ('213', '4', null, '203.208.60.23', '2018-10-10 14:16:38', '2018-10-10 14:16:38', '2018-10-10 14:16:38');
INSERT INTO `biz_article_look` VALUES ('214', '10', null, '203.208.60.84', '2018-10-10 14:46:50', '2018-10-10 14:46:50', '2018-10-10 14:46:50');
INSERT INTO `biz_article_look` VALUES ('215', '6', null, '203.208.60.21', '2018-10-10 14:56:47', '2018-10-10 14:56:47', '2018-10-10 14:56:47');
INSERT INTO `biz_article_look` VALUES ('216', '4', null, '203.208.60.123', '2018-10-11 15:35:24', '2018-10-11 15:35:24', '2018-10-11 15:35:24');
INSERT INTO `biz_article_look` VALUES ('217', '7', null, '203.208.60.97', '2018-10-11 17:15:51', '2018-10-11 17:15:51', '2018-10-11 17:15:51');
INSERT INTO `biz_article_look` VALUES ('218', '5', null, '203.208.60.96', '2018-10-11 19:46:01', '2018-10-11 19:46:01', '2018-10-11 19:46:01');
INSERT INTO `biz_article_look` VALUES ('219', '10', null, '203.208.60.16', '2018-10-11 21:06:44', '2018-10-11 21:06:44', '2018-10-11 21:06:44');
INSERT INTO `biz_article_look` VALUES ('220', '3', null, '203.208.60.87', '2018-10-11 21:46:53', '2018-10-11 21:46:53', '2018-10-11 21:46:53');
INSERT INTO `biz_article_look` VALUES ('221', '9', null, '203.208.60.112', '2018-10-12 01:07:02', '2018-10-12 01:07:02', '2018-10-12 01:07:02');
INSERT INTO `biz_article_look` VALUES ('222', '7', null, '203.208.60.0', '2018-10-12 02:17:29', '2018-10-12 02:17:29', '2018-10-12 02:17:29');
INSERT INTO `biz_article_look` VALUES ('223', '5', null, '203.208.60.93', '2018-10-12 05:13:47', '2018-10-12 05:13:47', '2018-10-12 05:13:47');
INSERT INTO `biz_article_look` VALUES ('224', '3', null, '159.65.24.22', '2018-10-12 06:43:15', '2018-10-12 06:43:15', '2018-10-12 06:43:15');
INSERT INTO `biz_article_look` VALUES ('225', '1', null, '159.65.24.22', '2018-10-12 06:43:17', '2018-10-12 06:43:17', '2018-10-12 06:43:17');
INSERT INTO `biz_article_look` VALUES ('226', '5', null, '159.65.24.22', '2018-10-12 06:43:19', '2018-10-12 06:43:19', '2018-10-12 06:43:19');
INSERT INTO `biz_article_look` VALUES ('227', '4', null, '159.65.24.22', '2018-10-12 06:43:21', '2018-10-12 06:43:21', '2018-10-12 06:43:21');
INSERT INTO `biz_article_look` VALUES ('228', '6', null, '159.65.24.22', '2018-10-12 06:43:23', '2018-10-12 06:43:23', '2018-10-12 06:43:23');
INSERT INTO `biz_article_look` VALUES ('229', '3', null, '203.208.60.24', '2018-10-12 09:25:09', '2018-10-12 09:25:09', '2018-10-12 09:25:09');
INSERT INTO `biz_article_look` VALUES ('230', '10', null, '203.208.60.37', '2018-10-12 10:45:22', '2018-10-12 10:45:22', '2018-10-12 10:45:22');
INSERT INTO `biz_article_look` VALUES ('231', '7', null, '203.208.60.102', '2018-10-12 11:25:42', '2018-10-12 11:25:42', '2018-10-12 11:25:42');
INSERT INTO `biz_article_look` VALUES ('232', '5', null, '203.208.60.29', '2018-10-12 14:26:52', '2018-10-12 14:26:52', '2018-10-12 14:26:52');
INSERT INTO `biz_article_look` VALUES ('233', '3', null, '203.208.60.51', '2018-10-12 18:58:33', '2018-10-12 18:58:33', '2018-10-12 18:58:33');
INSERT INTO `biz_article_look` VALUES ('234', '9', null, '203.208.60.114', '2018-10-12 20:08:48', '2018-10-12 20:08:48', '2018-10-12 20:08:48');
INSERT INTO `biz_article_look` VALUES ('235', '7', null, '203.208.60.102', '2018-10-12 21:44:18', '2018-10-12 21:44:18', '2018-10-12 21:44:18');
INSERT INTO `biz_article_look` VALUES ('236', '5', null, '66.249.79.72', '2018-10-13 01:27:43', '2018-10-13 01:27:43', '2018-10-13 01:27:43');
INSERT INTO `biz_article_look` VALUES ('237', '10', null, '203.208.60.71', '2018-10-13 01:42:49', '2018-10-13 01:42:49', '2018-10-13 01:42:49');
INSERT INTO `biz_article_look` VALUES ('238', '9', null, '101.226.102.70', '2018-10-13 01:53:03', '2018-10-13 01:53:03', '2018-10-13 01:53:03');
INSERT INTO `biz_article_look` VALUES ('239', '9', null, '220.243.135.53', '2018-10-15 04:10:53', '2018-10-15 04:10:53', '2018-10-15 04:10:53');
INSERT INTO `biz_article_look` VALUES ('240', '3', null, '220.243.136.179', '2018-10-15 04:10:54', '2018-10-15 04:10:54', '2018-10-15 04:10:54');
INSERT INTO `biz_article_look` VALUES ('241', '5', null, '220.243.136.116', '2018-10-15 04:10:54', '2018-10-15 04:10:54', '2018-10-15 04:10:54');
INSERT INTO `biz_article_look` VALUES ('242', '6', null, '220.243.135.53', '2018-10-15 04:10:54', '2018-10-15 04:10:54', '2018-10-15 04:10:54');
INSERT INTO `biz_article_look` VALUES ('243', '10', null, '220.243.135.116', '2018-10-15 04:10:54', '2018-10-15 04:10:54', '2018-10-15 04:10:54');
INSERT INTO `biz_article_look` VALUES ('244', '1', null, '220.243.136.138', '2018-10-15 04:10:55', '2018-10-15 04:10:55', '2018-10-15 04:10:55');
INSERT INTO `biz_article_look` VALUES ('245', '7', null, '220.243.135.49', '2018-10-15 04:10:56', '2018-10-15 04:10:56', '2018-10-15 04:10:56');
INSERT INTO `biz_article_look` VALUES ('246', '4', null, '220.243.136.238', '2018-10-15 04:10:56', '2018-10-15 04:10:56', '2018-10-15 04:10:56');
INSERT INTO `biz_article_look` VALUES ('247', '9', null, '222.211.249.60', '2018-10-15 15:37:02', '2018-10-15 15:37:02', '2018-10-15 15:37:02');
INSERT INTO `biz_article_look` VALUES ('248', '7', null, '203.208.60.14', '2018-10-16 06:20:31', '2018-10-16 06:20:31', '2018-10-16 06:20:31');
INSERT INTO `biz_article_look` VALUES ('249', '7', null, '58.251.121.186', '2018-10-16 11:36:26', '2018-10-16 11:36:26', '2018-10-16 11:36:26');
INSERT INTO `biz_article_look` VALUES ('250', '5', null, '203.208.60.11', '2018-10-16 21:45:09', '2018-10-16 21:45:09', '2018-10-16 21:45:09');
INSERT INTO `biz_article_look` VALUES ('251', '7', null, '183.128.161.200', '2018-10-17 10:21:56', '2018-10-17 10:21:56', '2018-10-17 10:21:56');
INSERT INTO `biz_article_look` VALUES ('252', '9', null, '222.211.248.186', '2018-10-17 10:42:04', '2018-10-17 10:42:04', '2018-10-17 10:42:04');
INSERT INTO `biz_article_look` VALUES ('253', '5', null, '203.208.60.46', '2018-10-17 14:45:43', '2018-10-17 14:45:43', '2018-10-17 14:45:43');
INSERT INTO `biz_article_look` VALUES ('254', '10', null, '58.56.87.74', '2018-10-17 17:21:07', '2018-10-17 17:21:07', '2018-10-17 17:21:07');
INSERT INTO `biz_article_look` VALUES ('255', '6', null, '220.243.135.207', '2018-10-17 17:54:05', '2018-10-17 17:54:05', '2018-10-17 17:54:05');
INSERT INTO `biz_article_look` VALUES ('256', '5', null, '220.243.135.18', '2018-10-17 17:54:05', '2018-10-17 17:54:05', '2018-10-17 17:54:05');
INSERT INTO `biz_article_look` VALUES ('257', '10', null, '220.243.135.144', '2018-10-17 17:54:05', '2018-10-17 17:54:05', '2018-10-17 17:54:05');
INSERT INTO `biz_article_look` VALUES ('258', '9', null, '220.243.136.144', '2018-10-17 17:54:05', '2018-10-17 17:54:05', '2018-10-17 17:54:05');
INSERT INTO `biz_article_look` VALUES ('259', '7', null, '52.80.243.138', '2018-10-17 17:54:06', '2018-10-17 17:54:06', '2018-10-17 17:54:06');
INSERT INTO `biz_article_look` VALUES ('260', '1', null, '220.243.135.98', '2018-10-17 17:54:06', '2018-10-17 17:54:06', '2018-10-17 17:54:06');
INSERT INTO `biz_article_look` VALUES ('261', '3', null, '220.243.135.35', '2018-10-17 17:54:06', '2018-10-17 17:54:06', '2018-10-17 17:54:06');
INSERT INTO `biz_article_look` VALUES ('262', '5', null, '203.208.60.29', '2018-10-18 02:47:48', '2018-10-18 02:47:48', '2018-10-18 02:47:48');
INSERT INTO `biz_article_look` VALUES ('263', '1', null, '222.211.248.186', '2018-10-19 14:41:38', '2018-10-19 14:41:38', '2018-10-19 14:41:38');
INSERT INTO `biz_article_look` VALUES ('264', '7', null, '203.208.60.19', '2018-10-20 15:17:39', '2018-10-20 15:17:39', '2018-10-20 15:17:39');
INSERT INTO `biz_article_look` VALUES ('265', '7', null, '203.208.60.94', '2018-10-21 00:39:28', '2018-10-21 00:39:28', '2018-10-21 00:39:28');
INSERT INTO `biz_article_look` VALUES ('266', '5', null, '203.208.60.80', '2018-10-21 07:41:56', '2018-10-21 07:41:56', '2018-10-21 07:41:56');
INSERT INTO `biz_article_look` VALUES ('267', '5', null, '203.208.60.29', '2018-10-21 07:41:57', '2018-10-21 07:41:57', '2018-10-21 07:41:57');
INSERT INTO `biz_article_look` VALUES ('268', '9', null, '220.243.135.62', '2018-10-21 11:32:32', '2018-10-21 11:32:32', '2018-10-21 11:32:32');
INSERT INTO `biz_article_look` VALUES ('269', '4', null, '220.243.135.49', '2018-10-21 11:32:32', '2018-10-21 11:32:32', '2018-10-21 11:32:32');
INSERT INTO `biz_article_look` VALUES ('270', '1', null, '220.243.135.49', '2018-10-21 11:32:32', '2018-10-21 11:32:32', '2018-10-21 11:32:32');
INSERT INTO `biz_article_look` VALUES ('271', '5', null, '220.243.136.3', '2018-10-21 11:32:33', '2018-10-21 11:32:33', '2018-10-21 11:32:33');
INSERT INTO `biz_article_look` VALUES ('272', '10', null, '220.243.136.66', '2018-10-21 11:32:34', '2018-10-21 11:32:34', '2018-10-21 11:32:34');
INSERT INTO `biz_article_look` VALUES ('273', '6', null, '220.243.136.97', '2018-10-21 11:32:34', '2018-10-21 11:32:34', '2018-10-21 11:32:34');
INSERT INTO `biz_article_look` VALUES ('274', '7', null, '220.243.136.97', '2018-10-21 11:32:35', '2018-10-21 11:32:35', '2018-10-21 11:32:35');
INSERT INTO `biz_article_look` VALUES ('275', '7', null, '203.208.60.118', '2018-10-21 13:14:17', '2018-10-21 13:14:17', '2018-10-21 13:14:17');
INSERT INTO `biz_article_look` VALUES ('276', '9', null, '101.227.151.57', '2018-10-21 15:32:14', '2018-10-21 15:32:14', '2018-10-21 15:32:14');
INSERT INTO `biz_article_look` VALUES ('277', '10', null, '203.208.60.99', '2018-10-21 16:40:49', '2018-10-21 16:40:49', '2018-10-21 16:40:49');
INSERT INTO `biz_article_look` VALUES ('278', '3', null, '203.208.60.23', '2018-10-21 16:50:56', '2018-10-21 16:50:56', '2018-10-21 16:50:56');
INSERT INTO `biz_article_look` VALUES ('279', '7', null, '66.249.79.170', '2018-10-21 22:12:55', '2018-10-21 22:12:55', '2018-10-21 22:12:55');
INSERT INTO `biz_article_look` VALUES ('280', '4', null, '220.181.108.108', '2018-10-22 01:39:59', '2018-10-22 01:39:59', '2018-10-22 01:39:59');
INSERT INTO `biz_article_look` VALUES ('281', '6', null, '123.125.71.104', '2018-10-22 05:21:43', '2018-10-22 05:21:43', '2018-10-22 05:21:43');
INSERT INTO `biz_article_look` VALUES ('282', '3', null, '123.125.71.99', '2018-10-22 08:42:14', '2018-10-22 08:42:14', '2018-10-22 08:42:14');
INSERT INTO `biz_article_look` VALUES ('283', '7', null, '203.208.60.83', '2018-10-22 09:56:56', '2018-10-22 09:56:56', '2018-10-22 09:56:56');
INSERT INTO `biz_article_look` VALUES ('284', '11', null, '222.211.234.85', '2018-10-22 10:42:01', '2018-10-22 10:42:01', '2018-10-22 10:42:01');
INSERT INTO `biz_article_look` VALUES ('285', '11', null, '222.211.234.85', '2018-10-22 10:42:18', '2018-10-22 10:42:18', '2018-10-22 10:42:18');
INSERT INTO `biz_article_look` VALUES ('286', '11', null, '222.211.234.85', '2018-10-22 10:49:30', '2018-10-22 10:49:30', '2018-10-22 10:49:30');
INSERT INTO `biz_article_look` VALUES ('287', '11', null, '222.211.234.85', '2018-10-22 10:49:54', '2018-10-22 10:49:54', '2018-10-22 10:49:54');
INSERT INTO `biz_article_look` VALUES ('288', '11', null, '203.208.60.122', '2018-10-22 14:38:39', '2018-10-22 14:38:39', '2018-10-22 14:38:39');
INSERT INTO `biz_article_look` VALUES ('289', '4', null, '203.208.60.15', '2018-10-22 15:38:13', '2018-10-22 15:38:13', '2018-10-22 15:38:13');
INSERT INTO `biz_article_look` VALUES ('290', '5', null, '220.181.108.121', '2018-10-22 19:14:07', '2018-10-22 19:14:07', '2018-10-22 19:14:07');
INSERT INTO `biz_article_look` VALUES ('291', '11', null, '203.208.60.107', '2018-10-22 21:31:21', '2018-10-22 21:31:21', '2018-10-22 21:31:21');
INSERT INTO `biz_article_look` VALUES ('292', '7', null, '123.125.71.56', '2018-10-22 23:15:37', '2018-10-22 23:15:37', '2018-10-22 23:15:37');
INSERT INTO `biz_article_look` VALUES ('293', '10', null, '220.181.108.99', '2018-10-23 06:44:58', '2018-10-23 06:44:58', '2018-10-23 06:44:58');
INSERT INTO `biz_article_look` VALUES ('294', '9', null, '220.181.108.165', '2018-10-23 18:07:18', '2018-10-23 18:07:18', '2018-10-23 18:07:18');
INSERT INTO `biz_article_look` VALUES ('295', '1', null, '220.181.108.144', '2018-10-24 09:46:19', '2018-10-24 09:46:19', '2018-10-24 09:46:19');
INSERT INTO `biz_article_look` VALUES ('296', '11', null, '220.250.39.106', '2018-10-24 20:51:03', '2018-10-24 20:51:03', '2018-10-24 20:51:03');
INSERT INTO `biz_article_look` VALUES ('297', '11', null, '220.250.39.106', '2018-10-24 20:51:49', '2018-10-24 20:51:49', '2018-10-24 20:51:49');
INSERT INTO `biz_article_look` VALUES ('298', '3', null, '207.46.13.153', '2018-10-24 21:35:32', '2018-10-24 21:35:32', '2018-10-24 21:35:32');
INSERT INTO `biz_article_look` VALUES ('299', '1', null, '203.208.60.84', '2018-10-25 11:04:14', '2018-10-25 11:04:14', '2018-10-25 11:04:14');
INSERT INTO `biz_article_look` VALUES ('300', '6', null, '203.208.60.60', '2018-10-25 14:18:56', '2018-10-25 14:18:56', '2018-10-25 14:18:56');
INSERT INTO `biz_article_look` VALUES ('301', '7', null, '203.208.60.90', '2018-10-25 17:19:17', '2018-10-25 17:19:17', '2018-10-25 17:19:17');
INSERT INTO `biz_article_look` VALUES ('302', '6', null, '123.125.71.103', '2018-10-25 18:30:52', '2018-10-25 18:30:52', '2018-10-25 18:30:52');
INSERT INTO `biz_article_look` VALUES ('303', '9', null, '203.208.60.100', '2018-10-25 18:59:31', '2018-10-25 18:59:31', '2018-10-25 18:59:31');
INSERT INTO `biz_article_look` VALUES ('304', '5', null, '203.208.60.122', '2018-10-26 01:11:16', '2018-10-26 01:11:16', '2018-10-26 01:11:16');
INSERT INTO `biz_article_look` VALUES ('305', '3', null, '220.181.108.175', '2018-10-26 02:29:35', '2018-10-26 02:29:35', '2018-10-26 02:29:35');
INSERT INTO `biz_article_look` VALUES ('306', '4', null, '123.125.71.16', '2018-10-26 09:19:42', '2018-10-26 09:19:42', '2018-10-26 09:19:42');
INSERT INTO `biz_article_look` VALUES ('307', '7', null, '203.208.60.10', '2018-10-26 11:36:51', '2018-10-26 11:36:51', '2018-10-26 11:36:51');
INSERT INTO `biz_article_look` VALUES ('308', '5', null, '207.46.13.152', '2018-10-27 06:14:22', '2018-10-27 06:14:22', '2018-10-27 06:14:22');
INSERT INTO `biz_article_look` VALUES ('309', '11', null, '220.181.108.80', '2018-10-27 06:36:17', '2018-10-27 06:36:17', '2018-10-27 06:36:17');
INSERT INTO `biz_article_look` VALUES ('310', '1', null, '207.46.13.195', '2018-10-27 16:22:08', '2018-10-27 16:22:08', '2018-10-27 16:22:08');
INSERT INTO `biz_article_look` VALUES ('311', '4', null, '220.243.136.21', '2018-10-28 00:02:35', '2018-10-28 00:02:35', '2018-10-28 00:02:35');
INSERT INTO `biz_article_look` VALUES ('312', '9', null, '220.243.135.50', '2018-10-28 00:02:39', '2018-10-28 00:02:39', '2018-10-28 00:02:39');
INSERT INTO `biz_article_look` VALUES ('313', '5', null, '220.243.135.204', '2018-10-28 00:02:40', '2018-10-28 00:02:40', '2018-10-28 00:02:40');
INSERT INTO `biz_article_look` VALUES ('314', '7', null, '220.243.136.117', '2018-10-28 00:02:42', '2018-10-28 00:02:42', '2018-10-28 00:02:42');
INSERT INTO `biz_article_look` VALUES ('315', '6', null, '220.243.136.238', '2018-10-28 00:02:43', '2018-10-28 00:02:43', '2018-10-28 00:02:43');
INSERT INTO `biz_article_look` VALUES ('316', '1', null, '220.243.135.176', '2018-10-28 00:02:51', '2018-10-28 00:02:51', '2018-10-28 00:02:51');
INSERT INTO `biz_article_look` VALUES ('317', '11', null, '111.206.36.10', '2018-10-28 05:17:06', '2018-10-28 05:17:06', '2018-10-28 05:17:06');
INSERT INTO `biz_article_look` VALUES ('318', '11', null, '14.215.176.145', '2018-10-28 16:43:49', '2018-10-28 16:43:49', '2018-10-28 16:43:49');
INSERT INTO `biz_article_look` VALUES ('319', '6', null, '42.156.136.109', '2018-10-29 09:05:48', '2018-10-29 09:05:48', '2018-10-29 09:05:48');
INSERT INTO `biz_article_look` VALUES ('320', '11', null, '36.110.199.12', '2018-10-29 13:21:24', '2018-10-29 13:21:24', '2018-10-29 13:21:24');
INSERT INTO `biz_article_look` VALUES ('321', '1', null, '115.231.223.126', '2018-10-29 14:37:13', '2018-10-29 14:37:13', '2018-10-29 14:37:13');
INSERT INTO `biz_article_look` VALUES ('322', '7', null, '106.11.152.171', '2018-10-29 18:57:22', '2018-10-29 18:57:22', '2018-10-29 18:57:22');
INSERT INTO `biz_article_look` VALUES ('323', '11', null, '115.239.212.138', '2018-10-30 04:41:27', '2018-10-30 04:41:27', '2018-10-30 04:41:27');
INSERT INTO `biz_article_look` VALUES ('324', '10', null, '40.77.167.148', '2018-10-30 06:34:27', '2018-10-30 06:34:27', '2018-10-30 06:34:27');
INSERT INTO `biz_article_look` VALUES ('325', '10', null, '106.11.159.156', '2018-10-30 14:52:21', '2018-10-30 14:52:21', '2018-10-30 14:52:21');
INSERT INTO `biz_article_look` VALUES ('326', '9', null, '106.11.152.57', '2018-10-30 17:49:53', '2018-10-30 17:49:53', '2018-10-30 17:49:53');
INSERT INTO `biz_article_look` VALUES ('327', '3', null, '42.120.161.73', '2018-10-30 20:31:54', '2018-10-30 20:31:54', '2018-10-30 20:31:54');
INSERT INTO `biz_article_look` VALUES ('328', '1', null, '220.243.135.188', '2018-10-30 20:49:06', '2018-10-30 20:49:06', '2018-10-30 20:49:06');
INSERT INTO `biz_article_look` VALUES ('329', '4', null, '220.243.135.188', '2018-10-30 20:49:06', '2018-10-30 20:49:06', '2018-10-30 20:49:06');
INSERT INTO `biz_article_look` VALUES ('330', '7', null, '220.243.136.188', '2018-10-30 20:49:06', '2018-10-30 20:49:06', '2018-10-30 20:49:06');
INSERT INTO `biz_article_look` VALUES ('331', '9', null, '220.243.135.23', '2018-10-30 20:49:06', '2018-10-30 20:49:06', '2018-10-30 20:49:06');
INSERT INTO `biz_article_look` VALUES ('332', '6', null, '220.243.135.8', '2018-10-30 20:49:08', '2018-10-30 20:49:08', '2018-10-30 20:49:08');
INSERT INTO `biz_article_look` VALUES ('333', '5', null, '220.243.136.149', '2018-10-30 20:49:11', '2018-10-30 20:49:11', '2018-10-30 20:49:11');
INSERT INTO `biz_article_look` VALUES ('334', '9', null, '40.77.167.178', '2018-10-31 01:49:51', '2018-10-31 01:49:51', '2018-10-31 01:49:51');
INSERT INTO `biz_article_look` VALUES ('335', '11', null, '220.181.51.82', '2018-10-31 03:03:27', '2018-10-31 03:03:27', '2018-10-31 03:03:27');
INSERT INTO `biz_article_look` VALUES ('336', '9', null, '101.226.114.193', '2018-10-31 06:43:27', '2018-10-31 06:43:27', '2018-10-31 06:43:27');
INSERT INTO `biz_article_look` VALUES ('337', '11', null, '36.110.199.170', '2018-10-31 12:16:33', '2018-10-31 12:16:33', '2018-10-31 12:16:33');
INSERT INTO `biz_article_look` VALUES ('338', '7', null, '113.89.6.28', '2018-10-31 22:14:12', '2018-10-31 22:14:12', '2018-10-31 22:14:12');
INSERT INTO `biz_article_look` VALUES ('339', '4', null, '106.11.152.74', '2018-11-01 07:06:19', '2018-11-01 07:06:19', '2018-11-01 07:06:19');
INSERT INTO `biz_article_look` VALUES ('340', '1', null, '47.74.242.88', '2018-11-01 08:16:48', '2018-11-01 08:16:48', '2018-11-01 08:16:48');
INSERT INTO `biz_article_look` VALUES ('341', '10', null, '47.74.242.88', '2018-11-01 08:16:48', '2018-11-01 08:16:48', '2018-11-01 08:16:48');
INSERT INTO `biz_article_look` VALUES ('342', '11', null, '47.74.242.88', '2018-11-01 08:16:48', '2018-11-01 08:16:48', '2018-11-01 08:16:48');
INSERT INTO `biz_article_look` VALUES ('343', '3', null, '47.74.242.88', '2018-11-01 08:16:48', '2018-11-01 08:16:48', '2018-11-01 08:16:48');
INSERT INTO `biz_article_look` VALUES ('344', '4', null, '47.74.242.88', '2018-11-01 08:16:48', '2018-11-01 08:16:48', '2018-11-01 08:16:48');
INSERT INTO `biz_article_look` VALUES ('345', '5', null, '47.74.242.88', '2018-11-01 08:16:49', '2018-11-01 08:16:49', '2018-11-01 08:16:49');
INSERT INTO `biz_article_look` VALUES ('346', '6', null, '47.74.242.88', '2018-11-01 08:16:49', '2018-11-01 08:16:49', '2018-11-01 08:16:49');
INSERT INTO `biz_article_look` VALUES ('347', '7', null, '47.74.242.88', '2018-11-01 08:16:49', '2018-11-01 08:16:49', '2018-11-01 08:16:49');
INSERT INTO `biz_article_look` VALUES ('348', '9', null, '47.74.242.88', '2018-11-01 08:16:50', '2018-11-01 08:16:50', '2018-11-01 08:16:50');
INSERT INTO `biz_article_look` VALUES ('349', '11', null, '106.11.156.177', '2018-11-01 10:10:41', '2018-11-01 10:10:41', '2018-11-01 10:10:41');
INSERT INTO `biz_article_look` VALUES ('350', '7', null, '123.125.71.88', '2018-11-01 10:19:48', '2018-11-01 10:19:48', '2018-11-01 10:19:48');
INSERT INTO `biz_article_look` VALUES ('351', '11', null, '123.125.67.147', '2018-11-01 12:20:54', '2018-11-01 12:20:54', '2018-11-01 12:20:54');
INSERT INTO `biz_article_look` VALUES ('352', '1', null, '42.156.139.72', '2018-11-01 13:57:22', '2018-11-01 13:57:22', '2018-11-01 13:57:22');
INSERT INTO `biz_article_look` VALUES ('353', '5', null, '106.11.155.185', '2018-11-01 16:59:45', '2018-11-01 16:59:45', '2018-11-01 16:59:45');
INSERT INTO `biz_article_look` VALUES ('354', '7', null, '203.208.60.35', '2018-11-01 17:39:44', '2018-11-01 17:39:44', '2018-11-01 17:39:44');
INSERT INTO `biz_article_look` VALUES ('355', '3', null, '203.208.60.67', '2018-11-01 20:30:20', '2018-11-01 20:30:20', '2018-11-01 20:30:20');
INSERT INTO `biz_article_look` VALUES ('356', '5', null, '203.208.60.121', '2018-11-01 20:50:56', '2018-11-01 20:50:56', '2018-11-01 20:50:56');
INSERT INTO `biz_article_look` VALUES ('357', '10', null, '203.208.60.14', '2018-11-01 21:11:24', '2018-11-01 21:11:24', '2018-11-01 21:11:24');
INSERT INTO `biz_article_look` VALUES ('358', '4', null, '203.208.60.43', '2018-11-02 00:33:39', '2018-11-02 00:33:39', '2018-11-02 00:33:39');
INSERT INTO `biz_article_look` VALUES ('359', '1', null, '203.208.60.91', '2018-11-02 01:03:22', '2018-11-02 01:03:22', '2018-11-02 01:03:22');
INSERT INTO `biz_article_look` VALUES ('360', '7', null, '203.208.60.77', '2018-11-02 02:23:41', '2018-11-02 02:23:41', '2018-11-02 02:23:41');
INSERT INTO `biz_article_look` VALUES ('361', '9', null, '203.208.60.47', '2018-11-02 03:54:27', '2018-11-02 03:54:27', '2018-11-02 03:54:27');
INSERT INTO `biz_article_look` VALUES ('362', '6', null, '203.208.60.20', '2018-11-02 04:14:08', '2018-11-02 04:14:08', '2018-11-02 04:14:08');
INSERT INTO `biz_article_look` VALUES ('363', '11', null, '111.206.36.134', '2018-11-02 04:36:02', '2018-11-02 04:36:02', '2018-11-02 04:36:02');
INSERT INTO `biz_article_look` VALUES ('364', '6', null, '207.46.13.153', '2018-11-02 04:59:25', '2018-11-02 04:59:25', '2018-11-02 04:59:25');
INSERT INTO `biz_article_look` VALUES ('365', '1', null, '123.125.71.39', '2018-11-02 06:26:44', '2018-11-02 06:26:44', '2018-11-02 06:26:44');
INSERT INTO `biz_article_look` VALUES ('366', '5', null, '203.208.60.13', '2018-11-02 07:05:09', '2018-11-02 07:05:09', '2018-11-02 07:05:09');
INSERT INTO `biz_article_look` VALUES ('367', '3', null, '203.208.60.10', '2018-11-02 08:25:12', '2018-11-02 08:25:12', '2018-11-02 08:25:12');
INSERT INTO `biz_article_look` VALUES ('368', '12', null, '222.211.235.32', '2018-11-02 09:42:47', '2018-11-02 09:42:47', '2018-11-02 09:42:47');
INSERT INTO `biz_article_look` VALUES ('369', '11', null, '203.208.60.22', '2018-11-02 10:16:19', '2018-11-02 10:16:19', '2018-11-02 10:16:19');
INSERT INTO `biz_article_look` VALUES ('370', '12', null, '203.208.60.120', '2018-11-02 10:17:07', '2018-11-02 10:17:07', '2018-11-02 10:17:07');
INSERT INTO `biz_article_look` VALUES ('371', '11', null, '123.125.67.212', '2018-11-02 10:46:13', '2018-11-02 10:46:13', '2018-11-02 10:46:13');
INSERT INTO `biz_article_look` VALUES ('372', '10', null, '203.208.60.30', '2018-11-02 11:36:47', '2018-11-02 11:36:47', '2018-11-02 11:36:47');
INSERT INTO `biz_article_look` VALUES ('373', '1', null, '203.208.60.1', '2018-11-02 12:57:14', '2018-11-02 12:57:14', '2018-11-02 12:57:14');
INSERT INTO `biz_article_look` VALUES ('374', '4', null, '203.208.60.34', '2018-11-02 13:47:55', '2018-11-02 13:47:55', '2018-11-02 13:47:55');
INSERT INTO `biz_article_look` VALUES ('375', '7', null, '203.208.60.29', '2018-11-02 14:08:19', '2018-11-02 14:08:19', '2018-11-02 14:08:19');
INSERT INTO `biz_article_look` VALUES ('376', '12', null, '203.208.60.111', '2018-11-02 14:13:04', '2018-11-02 14:13:04', '2018-11-02 14:13:04');
INSERT INTO `biz_article_look` VALUES ('377', '7', null, '175.6.6.230', '2018-11-02 14:41:34', '2018-11-02 14:41:34', '2018-11-02 14:41:34');
INSERT INTO `biz_article_look` VALUES ('378', '11', null, '101.226.114.193', '2018-11-02 15:15:22', '2018-11-02 15:15:22', '2018-11-02 15:15:22');
INSERT INTO `biz_article_look` VALUES ('379', '12', null, '222.211.235.32', '2018-11-02 15:30:38', '2018-11-02 15:30:38', '2018-11-02 15:30:38');
INSERT INTO `biz_article_look` VALUES ('380', '12', null, '222.211.235.32', '2018-11-02 15:38:23', '2018-11-02 15:38:23', '2018-11-02 15:38:23');
INSERT INTO `biz_article_look` VALUES ('381', '12', null, '222.211.235.32', '2018-11-02 15:38:27', '2018-11-02 15:38:27', '2018-11-02 15:38:27');
INSERT INTO `biz_article_look` VALUES ('382', '3', null, '182.48.100.70', '2018-11-02 16:00:00', '2018-11-02 16:00:00', '2018-11-02 16:00:00');
INSERT INTO `biz_article_look` VALUES ('383', '3', null, '203.208.60.21', '2018-11-02 16:09:42', '2018-11-02 16:09:42', '2018-11-02 16:09:42');
INSERT INTO `biz_article_look` VALUES ('384', '9', null, '203.208.60.115', '2018-11-02 16:49:55', '2018-11-02 16:49:55', '2018-11-02 16:49:55');
INSERT INTO `biz_article_look` VALUES ('385', '6', null, '203.208.60.24', '2018-11-02 18:00:00', '2018-11-02 18:00:00', '2018-11-02 18:00:00');
INSERT INTO `biz_article_look` VALUES ('386', '5', null, '203.208.60.12', '2018-11-02 18:39:50', '2018-11-02 18:39:50', '2018-11-02 18:39:50');
INSERT INTO `biz_article_look` VALUES ('387', '4', null, '203.208.60.85', '2018-11-02 19:09:34', '2018-11-02 19:09:34', '2018-11-02 19:09:34');
INSERT INTO `biz_article_look` VALUES ('388', '4', null, '203.208.60.6', '2018-11-02 19:09:36', '2018-11-02 19:09:36', '2018-11-02 19:09:36');
INSERT INTO `biz_article_look` VALUES ('389', '12', null, '106.11.158.73', '2018-11-02 20:24:06', '2018-11-02 20:24:06', '2018-11-02 20:24:06');
INSERT INTO `biz_article_look` VALUES ('390', '7', null, '203.208.60.12', '2018-11-02 20:30:38', '2018-11-02 20:30:38', '2018-11-02 20:30:38');
INSERT INTO `biz_article_look` VALUES ('391', '5', null, '203.208.60.72', '2018-11-02 23:12:36', '2018-11-02 23:12:36', '2018-11-02 23:12:36');
INSERT INTO `biz_article_look` VALUES ('392', '3', null, '203.208.60.125', '2018-11-03 01:06:12', '2018-11-03 01:06:12', '2018-11-03 01:06:12');
INSERT INTO `biz_article_look` VALUES ('393', '11', null, '123.125.67.208', '2018-11-03 03:47:08', '2018-11-03 03:47:08', '2018-11-03 03:47:08');
INSERT INTO `biz_article_look` VALUES ('394', '10', null, '203.208.60.52', '2018-11-03 04:44:24', '2018-11-03 04:44:24', '2018-11-03 04:44:24');
INSERT INTO `biz_article_look` VALUES ('395', '7', null, '203.208.60.60', '2018-11-03 05:14:01', '2018-11-03 05:14:01', '2018-11-03 05:14:01');
INSERT INTO `biz_article_look` VALUES ('396', '5', null, '203.208.60.49', '2018-11-03 08:26:48', '2018-11-03 08:26:48', '2018-11-03 08:26:48');
INSERT INTO `biz_article_look` VALUES ('397', '3', null, '203.208.60.63', '2018-11-03 11:36:21', '2018-11-03 11:36:21', '2018-11-03 11:36:21');
INSERT INTO `biz_article_look` VALUES ('398', '9', null, '203.208.60.77', '2018-11-03 11:55:55', '2018-11-03 11:55:55', '2018-11-03 11:55:55');
INSERT INTO `biz_article_look` VALUES ('399', '11', null, '36.110.199.140', '2018-11-03 14:21:09', '2018-11-03 14:21:09', '2018-11-03 14:21:09');
INSERT INTO `biz_article_look` VALUES ('400', '7', null, '203.208.60.61', '2018-11-03 14:26:47', '2018-11-03 14:26:47', '2018-11-03 14:26:47');
INSERT INTO `biz_article_look` VALUES ('401', '7', null, '203.208.60.107', '2018-11-03 14:26:54', '2018-11-03 14:26:54', '2018-11-03 14:26:54');
INSERT INTO `biz_article_look` VALUES ('402', '12', null, '203.208.60.21', '2018-11-03 14:31:19', '2018-11-03 14:31:19', '2018-11-03 14:31:19');
INSERT INTO `biz_article_look` VALUES ('403', '7', null, '223.74.68.130', '2018-11-03 22:02:36', '2018-11-03 22:02:36', '2018-11-03 22:02:36');
INSERT INTO `biz_article_look` VALUES ('404', '11', null, '203.208.60.117', '2018-11-03 22:27:37', '2018-11-03 22:27:37', '2018-11-03 22:27:37');
INSERT INTO `biz_article_look` VALUES ('405', '3', null, '223.74.68.130', '2018-11-04 01:27:32', '2018-11-04 01:27:32', '2018-11-04 01:27:32');
INSERT INTO `biz_article_look` VALUES ('406', '11', null, '111.206.36.143', '2018-11-04 05:03:23', '2018-11-04 05:03:23', '2018-11-04 05:03:23');
INSERT INTO `biz_article_look` VALUES ('407', '11', null, '123.125.67.146', '2018-11-04 06:52:01', '2018-11-04 06:52:01', '2018-11-04 06:52:01');
INSERT INTO `biz_article_look` VALUES ('408', '12', null, '123.125.71.115', '2018-11-04 12:08:35', '2018-11-04 12:08:35', '2018-11-04 12:08:35');
INSERT INTO `biz_article_look` VALUES ('409', '11', null, '14.215.176.17', '2018-11-05 04:08:55', '2018-11-05 04:08:55', '2018-11-05 04:08:55');
INSERT INTO `biz_article_look` VALUES ('410', '11', null, '36.110.199.138', '2018-11-05 11:17:11', '2018-11-05 11:17:11', '2018-11-05 11:17:11');
INSERT INTO `biz_article_look` VALUES ('411', '3', null, '106.11.153.168', '2018-11-05 13:22:39', '2018-11-05 13:22:39', '2018-11-05 13:22:39');
INSERT INTO `biz_article_look` VALUES ('412', '11', null, '123.125.67.206', '2018-11-05 13:54:19', '2018-11-05 13:54:19', '2018-11-05 13:54:19');
INSERT INTO `biz_article_look` VALUES ('413', '12', null, '114.88.185.245', '2018-11-05 21:45:10', '2018-11-05 21:45:10', '2018-11-05 21:45:10');
INSERT INTO `biz_article_look` VALUES ('414', '12', null, '14.215.176.9', '2018-11-06 05:54:31', '2018-11-06 05:54:31', '2018-11-06 05:54:31');
INSERT INTO `biz_article_look` VALUES ('415', '11', null, '220.181.51.79', '2018-11-06 07:04:17', '2018-11-06 07:04:17', '2018-11-06 07:04:17');
INSERT INTO `biz_article_look` VALUES ('416', '7', null, '100.35.75.170', '2018-11-06 09:33:07', '2018-11-06 09:33:07', '2018-11-06 09:33:07');
INSERT INTO `biz_article_look` VALUES ('417', '4', null, '100.35.75.170', '2018-11-06 09:33:08', '2018-11-06 09:33:08', '2018-11-06 09:33:08');
INSERT INTO `biz_article_look` VALUES ('418', '9', null, '100.35.75.170', '2018-11-06 09:33:10', '2018-11-06 09:33:10', '2018-11-06 09:33:10');
INSERT INTO `biz_article_look` VALUES ('419', '6', null, '100.35.75.170', '2018-11-06 09:33:12', '2018-11-06 09:33:12', '2018-11-06 09:33:12');
INSERT INTO `biz_article_look` VALUES ('420', '10', null, '100.35.75.170', '2018-11-06 09:33:14', '2018-11-06 09:33:14', '2018-11-06 09:33:14');
INSERT INTO `biz_article_look` VALUES ('421', '5', null, '100.35.75.170', '2018-11-06 09:33:16', '2018-11-06 09:33:16', '2018-11-06 09:33:16');
INSERT INTO `biz_article_look` VALUES ('422', '1', null, '100.35.75.170', '2018-11-06 09:33:17', '2018-11-06 09:33:17', '2018-11-06 09:33:17');
INSERT INTO `biz_article_look` VALUES ('423', '5', null, '100.35.75.170', '2018-11-06 09:33:21', '2018-11-06 09:33:21', '2018-11-06 09:33:21');
INSERT INTO `biz_article_look` VALUES ('424', '12', null, '220.181.108.95', '2018-11-06 11:58:45', '2018-11-06 11:58:45', '2018-11-06 11:58:45');
INSERT INTO `biz_article_look` VALUES ('425', '4', null, '121.35.3.64', '2018-11-06 12:19:42', '2018-11-06 12:19:42', '2018-11-06 12:19:42');
INSERT INTO `biz_article_look` VALUES ('426', '1', null, '220.181.108.150', '2018-11-06 15:04:36', '2018-11-06 15:04:36', '2018-11-06 15:04:36');
INSERT INTO `biz_article_look` VALUES ('427', '11', null, '36.110.199.35', '2018-11-07 02:19:50', '2018-11-07 02:19:50', '2018-11-07 02:19:50');
INSERT INTO `biz_article_look` VALUES ('428', '11', null, '220.181.51.110', '2018-11-07 10:22:26', '2018-11-07 10:22:26', '2018-11-07 10:22:26');
INSERT INTO `biz_article_look` VALUES ('429', '11', null, '222.211.235.32', '2018-11-07 10:51:31', '2018-11-07 10:51:31', '2018-11-07 10:51:31');
INSERT INTO `biz_article_look` VALUES ('430', '6', null, '222.211.235.32', '2018-11-07 10:51:46', '2018-11-07 10:51:46', '2018-11-07 10:51:46');
INSERT INTO `biz_article_look` VALUES ('431', '7', null, '222.211.235.32', '2018-11-07 10:52:01', '2018-11-07 10:52:01', '2018-11-07 10:52:01');
INSERT INTO `biz_article_look` VALUES ('432', '7', null, '222.211.235.32', '2018-11-07 10:56:12', '2018-11-07 10:56:12', '2018-11-07 10:56:12');
INSERT INTO `biz_article_look` VALUES ('433', '4', null, '222.211.235.32', '2018-11-07 14:33:08', '2018-11-07 14:33:08', '2018-11-07 14:33:08');
INSERT INTO `biz_article_look` VALUES ('434', '13', null, '222.211.249.122', '2018-11-07 17:56:16', '2018-11-07 17:56:16', '2018-11-07 17:56:16');
INSERT INTO `biz_article_look` VALUES ('435', '13', null, '222.211.249.122', '2018-11-07 17:58:03', '2018-11-07 17:58:03', '2018-11-07 17:58:03');
INSERT INTO `biz_article_look` VALUES ('436', '13', null, '222.211.249.122', '2018-11-07 17:59:13', '2018-11-07 17:59:13', '2018-11-07 17:59:13');
INSERT INTO `biz_article_look` VALUES ('437', '13', null, '106.11.155.133', '2018-11-07 21:59:05', '2018-11-07 21:59:05', '2018-11-07 21:59:05');
INSERT INTO `biz_article_look` VALUES ('438', '7', null, '220.181.108.152', '2018-11-08 03:57:22', '2018-11-08 03:57:22', '2018-11-08 03:57:22');
INSERT INTO `biz_article_look` VALUES ('439', '4', null, '222.211.249.122', '2018-11-08 10:04:12', '2018-11-08 10:04:12', '2018-11-08 10:04:12');
INSERT INTO `biz_article_look` VALUES ('440', '11', null, '123.125.67.145', '2018-11-08 11:55:24', '2018-11-08 11:55:24', '2018-11-08 11:55:24');
INSERT INTO `biz_article_look` VALUES ('441', '13', null, '110.184.64.116', '2018-12-30 10:08:00', '2018-12-30 10:08:00', '2018-12-30 10:08:00');
INSERT INTO `biz_article_look` VALUES ('442', '13', null, '110.184.64.116', '2018-12-30 11:26:24', '2018-12-30 11:26:24', '2018-12-30 11:26:24');
INSERT INTO `biz_article_look` VALUES ('443', '12', null, '110.184.64.116', '2018-12-30 11:26:26', '2018-12-30 11:26:26', '2018-12-30 11:26:26');
INSERT INTO `biz_article_look` VALUES ('444', '13', null, '203.208.60.11', '2018-12-30 11:33:30', '2018-12-30 11:33:30', '2018-12-30 11:33:30');
INSERT INTO `biz_article_look` VALUES ('445', '13', null, '110.184.64.116', '2018-12-30 11:43:31', '2018-12-30 11:43:31', '2018-12-30 11:43:31');
INSERT INTO `biz_article_look` VALUES ('446', '10', null, '110.184.64.116', '2018-12-30 11:43:37', '2018-12-30 11:43:37', '2018-12-30 11:43:37');
INSERT INTO `biz_article_look` VALUES ('447', '7', null, '180.76.15.16', '2018-12-30 12:33:01', '2018-12-30 12:33:01', '2018-12-30 12:33:01');
INSERT INTO `biz_article_look` VALUES ('448', '11', null, '203.208.60.94', '2018-12-30 14:03:42', '2018-12-30 14:03:42', '2018-12-30 14:03:42');
INSERT INTO `biz_article_look` VALUES ('449', '11', null, '180.76.15.14', '2018-12-30 14:20:52', '2018-12-30 14:20:52', '2018-12-30 14:20:52');
INSERT INTO `biz_article_look` VALUES ('450', '13', null, '106.11.159.58', '2018-12-30 14:30:06', '2018-12-30 14:30:06', '2018-12-30 14:30:06');
INSERT INTO `biz_article_look` VALUES ('451', '13', null, '14.17.3.65', '2018-12-30 14:52:56', '2018-12-30 14:52:56', '2018-12-30 14:52:56');
INSERT INTO `biz_article_look` VALUES ('452', '1', null, '203.208.60.48', '2018-12-30 16:23:50', '2018-12-30 16:23:50', '2018-12-30 16:23:50');
INSERT INTO `biz_article_look` VALUES ('453', '7', null, '203.208.60.45', '2018-12-30 17:44:25', '2018-12-30 17:44:25', '2018-12-30 17:44:25');
INSERT INTO `biz_article_look` VALUES ('454', '4', null, '203.208.60.113', '2018-12-30 20:05:10', '2018-12-30 20:05:10', '2018-12-30 20:05:10');
INSERT INTO `biz_article_look` VALUES ('455', '13', null, '203.208.60.126', '2018-12-30 20:45:10', '2018-12-30 20:45:10', '2018-12-30 20:45:10');
INSERT INTO `biz_article_look` VALUES ('456', '6', null, '42.156.136.49', '2018-12-30 21:40:31', '2018-12-30 21:40:31', '2018-12-30 21:40:31');
INSERT INTO `biz_article_look` VALUES ('457', '13', null, '123.125.71.117', '2018-12-31 00:14:46', '2018-12-31 00:14:46', '2018-12-31 00:14:46');
INSERT INTO `biz_article_look` VALUES ('458', '1', null, '180.76.15.30', '2018-12-31 00:47:50', '2018-12-31 00:47:50', '2018-12-31 00:47:50');
INSERT INTO `biz_article_look` VALUES ('459', '13', null, '123.125.71.32', '2018-12-31 01:21:26', '2018-12-31 01:21:26', '2018-12-31 01:21:26');
INSERT INTO `biz_article_look` VALUES ('460', '6', null, '101.91.62.11', '2018-12-31 01:32:24', '2018-12-31 01:32:24', '2018-12-31 01:32:24');
INSERT INTO `biz_article_look` VALUES ('461', '1', null, '203.208.60.89', '2018-12-31 03:58:29', '2018-12-31 03:58:29', '2018-12-31 03:58:29');
INSERT INTO `biz_article_look` VALUES ('462', '9', null, '180.76.15.153', '2018-12-31 05:13:48', '2018-12-31 05:13:48', '2018-12-31 05:13:48');
INSERT INTO `biz_article_look` VALUES ('463', '1', null, '58.251.121.184', '2018-12-31 05:17:12', '2018-12-31 05:17:12', '2018-12-31 05:17:12');
INSERT INTO `biz_article_look` VALUES ('464', '13', null, '203.208.60.106', '2018-12-31 08:39:17', '2018-12-31 08:39:17', '2018-12-31 08:39:17');
INSERT INTO `biz_article_look` VALUES ('465', '9', null, '101.226.102.70', '2018-12-31 09:55:58', '2018-12-31 09:55:58', '2018-12-31 09:55:58');
INSERT INTO `biz_article_look` VALUES ('466', '13', null, '183.57.53.177', '2018-12-31 12:15:02', '2018-12-31 12:15:02', '2018-12-31 12:15:02');
INSERT INTO `biz_article_look` VALUES ('467', '12', null, '106.11.158.120', '2018-12-31 12:52:59', '2018-12-31 12:52:59', '2018-12-31 12:52:59');
INSERT INTO `biz_article_look` VALUES ('468', '13', null, '123.125.67.148', '2018-12-31 19:27:37', '2018-12-31 19:27:37', '2018-12-31 19:27:37');
INSERT INTO `biz_article_look` VALUES ('469', '13', null, '203.208.60.120', '2018-12-31 20:01:47', '2018-12-31 20:01:47', '2018-12-31 20:01:47');
INSERT INTO `biz_article_look` VALUES ('470', '13', null, '110.184.64.116', '2018-12-31 23:19:43', '2018-12-31 23:19:43', '2018-12-31 23:19:43');
INSERT INTO `biz_article_look` VALUES ('471', '11', null, '110.184.64.116', '2018-12-31 23:19:57', '2018-12-31 23:19:57', '2018-12-31 23:19:57');
INSERT INTO `biz_article_look` VALUES ('472', '7', null, '110.184.64.116', '2018-12-31 23:20:10', '2018-12-31 23:20:10', '2018-12-31 23:20:10');
INSERT INTO `biz_article_look` VALUES ('473', '6', null, '110.184.64.116', '2018-12-31 23:20:28', '2018-12-31 23:20:28', '2018-12-31 23:20:28');
INSERT INTO `biz_article_look` VALUES ('474', '13', null, '110.184.64.116', '2018-12-31 23:20:40', '2018-12-31 23:20:40', '2018-12-31 23:20:40');
INSERT INTO `biz_article_look` VALUES ('475', '1', null, '110.184.64.116', '2018-12-31 23:20:49', '2018-12-31 23:20:49', '2018-12-31 23:20:49');
INSERT INTO `biz_article_look` VALUES ('476', '3', null, '110.184.64.116', '2018-12-31 23:21:17', '2018-12-31 23:21:17', '2018-12-31 23:21:17');
INSERT INTO `biz_article_look` VALUES ('477', '4', null, '110.184.64.116', '2018-12-31 23:22:11', '2018-12-31 23:22:11', '2018-12-31 23:22:11');
INSERT INTO `biz_article_look` VALUES ('478', '13', null, '101.91.62.109', '2019-01-01 00:41:53', '2019-01-01 00:41:53', '2019-01-01 00:41:53');
INSERT INTO `biz_article_look` VALUES ('479', '7', null, '42.156.137.116', '2019-01-01 03:04:46', '2019-01-01 03:04:46', '2019-01-01 03:04:46');
INSERT INTO `biz_article_look` VALUES ('480', '7', null, '203.208.60.1', '2019-01-01 03:14:21', '2019-01-01 03:14:21', '2019-01-01 03:14:21');
INSERT INTO `biz_article_look` VALUES ('481', '13', null, '220.181.51.79', '2019-01-01 08:35:18', '2019-01-01 08:35:18', '2019-01-01 08:35:18');
INSERT INTO `biz_article_look` VALUES ('482', '13', null, '203.208.60.75', '2019-01-01 09:51:42', '2019-01-01 09:51:42', '2019-01-01 09:51:42');
INSERT INTO `biz_article_look` VALUES ('483', '4', null, '42.156.139.40', '2019-01-01 10:33:50', '2019-01-01 10:33:50', '2019-01-01 10:33:50');
INSERT INTO `biz_article_look` VALUES ('484', '1', null, '106.14.168.238', '2019-01-01 14:43:11', '2019-01-01 14:43:11', '2019-01-01 14:43:11');
INSERT INTO `biz_article_look` VALUES ('485', '5', null, '106.11.156.109', '2019-01-01 17:20:53', '2019-01-01 17:20:53', '2019-01-01 17:20:53');
INSERT INTO `biz_article_look` VALUES ('486', '7', null, '203.208.60.120', '2019-01-01 17:24:27', '2019-01-01 17:24:27', '2019-01-01 17:24:27');
INSERT INTO `biz_article_look` VALUES ('487', '13', null, '203.208.60.19', '2019-01-02 00:27:43', '2019-01-02 00:27:43', '2019-01-02 00:27:43');
INSERT INTO `biz_article_look` VALUES ('488', '10', null, '207.46.13.19', '2019-01-02 01:46:06', '2019-01-02 01:46:06', '2019-01-02 01:46:06');
INSERT INTO `biz_article_look` VALUES ('489', '7', null, '203.208.60.40', '2019-01-02 03:28:35', '2019-01-02 03:28:35', '2019-01-02 03:28:35');

-- ----------------------------
-- Table structure for biz_article_love
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_love`;
CREATE TABLE `biz_article_love` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) DEFAULT NULL COMMENT '用户IP',
  `love_time` datetime DEFAULT NULL COMMENT '浏览时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article_love
-- ----------------------------

-- ----------------------------
-- Table structure for biz_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_tags`;
CREATE TABLE `biz_article_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL COMMENT '标签表主键',
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_article_tags
-- ----------------------------
INSERT INTO `biz_article_tags` VALUES ('39', '1', '6', '2018-09-19 22:25:33', '2018-09-19 22:25:33');
INSERT INTO `biz_article_tags` VALUES ('40', '6', '5', '2018-09-19 22:25:52', '2018-09-19 22:25:52');
INSERT INTO `biz_article_tags` VALUES ('41', '6', '4', '2018-09-19 22:26:13', '2018-09-19 22:26:13');
INSERT INTO `biz_article_tags` VALUES ('42', '1', '3', '2018-09-19 22:26:29', '2018-09-19 22:26:29');
INSERT INTO `biz_article_tags` VALUES ('43', '6', '1', '2018-09-19 22:26:46', '2018-09-19 22:26:46');
INSERT INTO `biz_article_tags` VALUES ('54', '2', '9', '2018-09-21 15:43:05', '2018-09-21 15:43:05');
INSERT INTO `biz_article_tags` VALUES ('57', '7', '7', '2018-09-21 15:52:28', '2018-09-21 15:52:28');
INSERT INTO `biz_article_tags` VALUES ('60', '2', '10', '2018-09-25 10:49:21', '2018-09-25 10:49:21');
INSERT INTO `biz_article_tags` VALUES ('64', '1', '12', '2018-11-02 09:42:24', '2018-11-02 09:42:24');
INSERT INTO `biz_article_tags` VALUES ('66', '3', '11', '2018-11-07 17:50:52', '2018-11-07 17:50:52');
INSERT INTO `biz_article_tags` VALUES ('68', '1', '13', '2018-11-07 17:57:57', '2018-11-07 17:57:57');

-- ----------------------------
-- Table structure for biz_comment
-- ----------------------------
DROP TABLE IF EXISTS `biz_comment`;
CREATE TABLE `biz_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) DEFAULT NULL COMMENT '被评论的文章或者页面的ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '评论人的ID',
  `pid` bigint(20) unsigned DEFAULT NULL COMMENT '父级评论的id',
  `qq` varchar(13) DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(13) DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `url` varchar(200) DEFAULT NULL COMMENT '评论人的网站地址（未登录用户）',
  `status` enum('VERIFYING','APPROVED','REJECT','DELETED') DEFAULT 'VERIFYING' COMMENT '评论的状态',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论时的ip',
  `lng` varchar(50) DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) DEFAULT NULL COMMENT '评论时的地址',
  `os` varchar(64) DEFAULT NULL COMMENT '评论时的系统类型',
  `os_short_name` varchar(10) DEFAULT NULL COMMENT '评论时的系统的简称',
  `browser` varchar(64) DEFAULT NULL COMMENT '评论时的浏览器类型',
  `browser_short_name` varchar(10) DEFAULT NULL COMMENT '评论时的浏览器的简称',
  `content` varchar(2000) DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持（赞）',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对（踩）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_comment
-- ----------------------------
INSERT INTO `biz_comment` VALUES ('1', '-1', null, '0', '123456789', '央视财经评论3', 'https://q1.qlogo.cn/g?b=qq&nk=123456789&s=40', '123456789@qq.com', 'https://user.qzone.qq.com/123456789', 'VERIFYING', '175.6.6.230', '112.97276661621', '28.207791843871', '湖南省长沙市', 'Windows 10', null, 'Chrome 64.0.3282.186', null, '<p>3123123</p>', null, '0', '0', '2018-11-02 14:40:59', '2018-11-02 14:40:59');

-- ----------------------------
-- Table structure for biz_tags
-- ----------------------------
DROP TABLE IF EXISTS `biz_tags`;
CREATE TABLE `biz_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '书签名',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_tags
-- ----------------------------
INSERT INTO `biz_tags` VALUES ('1', 'Linux', null, '2018-01-14 21:35:31', '2018-01-14 21:35:31');
INSERT INTO `biz_tags` VALUES ('2', 'Java', null, '2018-01-14 21:35:45', '2018-01-14 21:35:45');
INSERT INTO `biz_tags` VALUES ('3', 'Spring', null, '2018-01-14 21:35:52', '2018-01-14 21:35:52');
INSERT INTO `biz_tags` VALUES ('4', 'Spring Boot', null, '2018-01-14 21:36:01', '2018-01-14 21:36:01');
INSERT INTO `biz_tags` VALUES ('5', '大数据', '', '2018-01-14 21:36:07', '2018-09-16 01:42:09');
INSERT INTO `biz_tags` VALUES ('6', '分布式', '分布式', '2018-09-21 08:32:20', '2018-09-21 08:32:20');
INSERT INTO `biz_tags` VALUES ('7', 'Spring Cloud', 'Spring Cloud', '2018-09-17 20:53:45', '2018-09-17 20:53:45');

-- ----------------------------
-- Table structure for biz_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_type`;
CREATE TABLE `biz_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '文章类型名',
  `description` varchar(200) DEFAULT NULL COMMENT '类型介绍',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `available` tinyint(1) unsigned DEFAULT '1' COMMENT '是否可用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of biz_type
-- ----------------------------
INSERT INTO `biz_type` VALUES ('1', null, '大数据', '大数据', '1', 'fa fa-qq', '1', '2018-09-16 01:43:00', '2018-09-16 01:43:31');
INSERT INTO `biz_type` VALUES ('5', null, '服务器', '服务器', '4', 'fa fa-linux', '1', '2018-09-16 01:50:49', '2018-09-16 02:03:03');
INSERT INTO `biz_type` VALUES ('7', '1', 'Hadoop', 'Hadoop', '1', '', '1', '2018-09-16 02:05:44', '2018-09-16 02:05:44');
INSERT INTO `biz_type` VALUES ('8', '1', 'Storm', 'Storm', '2', '', '1', '2018-09-16 02:06:10', '2018-09-16 02:06:10');
INSERT INTO `biz_type` VALUES ('9', '1', 'Spark', 'Spark', '3', '', '1', '2018-09-16 02:06:31', '2018-09-16 02:06:31');
INSERT INTO `biz_type` VALUES ('10', '1', 'ElasticSearch', 'ElasticSearch', '1', '', '1', '2018-09-16 12:34:45', '2018-09-21 16:16:12');
INSERT INTO `biz_type` VALUES ('13', null, '框架', '框架', '10', 'fa fa-anchor', '1', '2018-09-16 13:02:03', '2018-09-16 13:03:22');
INSERT INTO `biz_type` VALUES ('14', '13', 'Spring', 'Spring', null, '', '1', '2018-09-16 13:03:59', '2018-09-16 13:03:59');
INSERT INTO `biz_type` VALUES ('15', '13', 'Springboot', 'Springboot', null, '', '1', '2018-09-16 13:04:15', '2018-09-16 13:04:15');
INSERT INTO `biz_type` VALUES ('16', '13', 'SpringCloud', 'SpringCloud', null, '', '1', '2018-09-16 13:04:36', '2018-09-16 13:04:36');
INSERT INTO `biz_type` VALUES ('20', '13', 'MyBatis', 'MyBatis', '2', '', '1', '2018-09-16 13:07:00', '2018-09-16 13:07:00');
INSERT INTO `biz_type` VALUES ('23', '5', 'Docker', 'Docker', null, '', '1', '2018-09-17 09:36:57', '2018-09-17 09:36:57');
INSERT INTO `biz_type` VALUES ('24', '1', 'Zookeeper', 'Zookeeper', '1', '', '1', '2018-09-17 20:51:42', '2018-09-21 16:16:46');
INSERT INTO `biz_type` VALUES ('25', '27', 'Scala', 'Scala', '2', '', '1', '2018-09-21 16:27:53', '2018-09-21 16:58:19');
INSERT INTO `biz_type` VALUES ('26', '5', '软件安装', '软件安装', '1', '', '1', '2018-09-21 16:28:53', '2018-09-21 16:28:53');
INSERT INTO `biz_type` VALUES ('27', null, '编程语言', '编程语言', '1', 'fa fa-etsy', '1', '2018-09-21 16:56:57', '2018-09-21 16:56:57');
INSERT INTO `biz_type` VALUES ('28', '27', 'java', 'java', '1', '', '1', '2018-09-21 16:57:55', '2018-09-21 16:57:55');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `home_desc` varchar(255) DEFAULT NULL COMMENT '首页描述',
  `home_keywords` varchar(255) DEFAULT NULL COMMENT '首页关键字',
  `domain` varchar(255) DEFAULT NULL COMMENT '根域名',
  `cms_url` varchar(255) DEFAULT NULL COMMENT '管理系统的url',
  `site_url` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_desc` varchar(255) DEFAULT NULL COMMENT '站点描述',
  `site_favicon` varchar(255) DEFAULT NULL COMMENT '站点LOGO',
  `static_web_site` varchar(255) DEFAULT NULL COMMENT '资源文件（js、css等的路径）',
  `author_name` varchar(100) DEFAULT NULL COMMENT '站长名称',
  `author_email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `wx_code` varchar(255) DEFAULT NULL COMMENT '微信二维码地址',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博',
  `github` varchar(255) DEFAULT NULL COMMENT 'github',
  `maintenance` tinyint(1) unsigned DEFAULT NULL COMMENT '是否开启维护通知',
  `maintenance_data` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '系统维护时间',
  `comment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否开启评论',
  `qiuniu_base_path` varchar(255) DEFAULT NULL COMMENT '七牛路径',
  `qiniu_access_key` varchar(100) DEFAULT NULL COMMENT '七牛ACCESS_KEY',
  `qiniu_secret_key` varchar(100) DEFAULT NULL COMMENT '七牛SECRET_KEY',
  `qiniu_bucket_name` varchar(100) DEFAULT NULL COMMENT '七牛BUCKET_NAME',
  `baidu_push_token` varchar(100) DEFAULT NULL COMMENT '百度推送的token',
  `wx_praise_code` varchar(200) DEFAULT NULL COMMENT '微信赞赏码',
  `zfb_praise_code` varchar(200) DEFAULT NULL COMMENT '支付宝赞赏码',
  `baidu_api_ak` varchar(100) DEFAULT NULL COMMENT '百度api授权AK(获取地址：http://lbsyun.baidu.com/apiconsole/key)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'Dream of flying是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。', 'Dream of flying', 'https://dreamatach.com', 'https://dreamatach.com:8085', 'https://dreamatach.com', 'Dream of flying', 'Dream of flying', 'https://dreamatach.com/img/favicon.ico', 'https://dreamatach.com', '晓飞', '343618924@qq.com', 'http://118.25.212.23/WeChat.jpg', '343618924@qq.com', '', 'https://github.com/wuboee', '0', '2018-11-11 11:11:11', '1', 'https://dreamatach.com/', 'TVfOZbfVjqAAnyO0K1RmLo3OR_e7f8AzMSxkhFmH', 'AfcV2li2_mCNy8YAnQBz90_jKXfWivZ6E0Neohvp', 'dream', 'C06o35RTUZCy7qbI', 'qrcode/wx_code.png', 'qrcode/zfb_code.png', 'NwHaYlGalDEpgxm46xBaC3T9', '2018-01-19 23:07:52', '2018-09-19 19:58:06');

-- ----------------------------
-- Table structure for sys_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_link`;
CREATE TABLE `sys_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL COMMENT '链接地址',
  `name` varchar(50) DEFAULT NULL COMMENT '链接名',
  `description` varchar(300) DEFAULT NULL COMMENT '链接介绍',
  `email` varchar(100) DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(13) DEFAULT NULL COMMENT '友链站长QQ',
  `favicon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态',
  `home_page_display` tinyint(1) unsigned DEFAULT '1' COMMENT '是否首页显示',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `source` enum('ADMIN','AUTOMATIC') DEFAULT 'ADMIN' COMMENT '来源：管理员添加、自动申请',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_link
-- ----------------------------
INSERT INTO `sys_link` VALUES ('1', 'http://dreamatach.com', '晓飞的博客', '个人博客', '343618924@qq.com', '343618924', '', '1', '1', '', 'AUTOMATIC', '2018-09-16 14:00:18', '2018-09-20 08:58:16');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '被通知的用户ID',
  `status` enum('RELEASE','NOT_RELEASE') DEFAULT 'NOT_RELEASE' COMMENT '通知状态',
  `title` varchar(200) DEFAULT NULL COMMENT '通知的标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '通知的内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT '0',
  `sort` int(10) unsigned DEFAULT NULL,
  `external` tinyint(1) unsigned DEFAULT NULL COMMENT '是否外部链接',
  `available` tinyint(1) unsigned DEFAULT '0',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_resource_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '用户管理', 'menu', '', '', '0', '4', '0', '1', 'fa fa-users', '2018-05-22 10:08:05', '2018-08-24 14:11:29');
INSERT INTO `sys_resources` VALUES ('2', '用户列表', 'menu', '/users', 'users', '1', '1', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('3', '新增用户', 'button', null, 'user:add', '2', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('4', '批量删除用户', 'button', null, 'user:batchDelete', '2', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('5', '编辑用户', 'button', null, 'user:edit,user:get', '2', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('6', '删除用户', 'button', null, 'user:delete', '2', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('7', '分配用户角色', 'button', null, 'user:allotRole', '2', '6', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('8', '权限管理', 'menu', '', '', '0', '3', '0', '1', 'fa fa-cogs', '2018-05-22 10:08:05', '2018-08-24 14:11:10');
INSERT INTO `sys_resources` VALUES ('9', '资源管理', 'menu', '/resources', 'resources', '8', '1', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('10', '新增资源', 'button', null, 'resource:add', '9', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('11', '批量删除资源', 'button', null, 'resource:batchDelete', '9', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('12', '编辑资源', 'button', null, 'resource:edit,resource:get', '9', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('13', '删除资源', 'button', null, 'resource:delete', '9', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('14', '角色管理', 'menu', '/roles', 'roles', '8', '2', '0', '1', '', '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('15', '新增角色', 'button', null, 'role:add', '14', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('16', '批量删除角色', 'button', null, 'role:batchDelete', '14', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('17', '编辑角色', 'button', null, 'role:edit,role:get', '14', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('18', '删除角色', 'button', null, 'role:delete', '14', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('19', '分配角色资源', 'button', null, 'role:allotResource', '14', '6', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('20', '文章管理', 'menu', '', '', '0', '1', '0', '1', 'fa fa-list', '2018-05-22 10:08:05', '2018-08-24 14:10:25');
INSERT INTO `sys_resources` VALUES ('21', '文章列表', 'menu', '/articles', 'articles', '20', '1', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('22', '发表文章', 'button', null, 'article:publish', '21', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('23', '批量删除文章', 'button', null, 'article:batchDelete', '21', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('24', '批量推送文章', 'button', null, 'article:batchPush', '21', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('25', '推送文章', 'button', null, 'article:push', '21', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('26', '置顶文章', 'button', null, 'article:top', '21', '6', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('27', '推荐文章', 'button', null, 'article:recommend', '21', '7', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('28', '编辑文章', 'button', null, 'article:edit,article:get', '21', '8', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('29', '删除文章', 'button', null, 'article:delete', '21', '9', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('30', '分类列表', 'menu', '/article/types', 'types', '20', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('31', '添加分类', 'button', null, 'type:add', '30', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('32', '批量删除分类', 'button', null, 'type:batchDelete', '30', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('33', '编辑分类', 'button', null, 'type:edit,type:get', '30', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('34', '删除分类', 'button', null, 'type:delete', '30', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('35', '标签列表', 'menu', '/article/tags', 'tags', '20', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('36', '添加标签', 'button', null, 'tag:add', '35', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('37', '批量删除标签', 'button', null, 'tag:batchDelete', '35', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('38', '编辑标签', 'button', null, 'tag:edit,tag:get', '35', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('39', '删除标签', 'button', null, 'tag:delete', '35', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('40', '网站管理', 'menu', '', '', '0', '2', '0', '1', 'fa fa-globe', '2018-05-22 10:08:05', '2018-08-24 14:10:45');
INSERT INTO `sys_resources` VALUES ('41', '友情链接', 'menu', '/links', 'links', '40', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('42', '添加友情链接', 'button', null, 'link:add', '41', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('43', '批量删除友情链接', 'button', null, 'link:batchDelete', '41', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('44', '编辑友情链接', 'button', null, 'link:edit,link:get', '41', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('45', '删除友情链接', 'button', null, 'link:delete', '41', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('46', '评论管理', 'menu', '/comments', 'comments', '40', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('47', '批量删除评论', 'button', null, 'comment:batchDelete', '46', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('48', '回复评论', 'button', null, 'comment:reply', '46', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('49', '审核评论', 'button', null, 'comment:audit', '46', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('50', '删除评论', 'button', null, 'comment:delete', '46', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('51', '模板管理', 'menu', '/templates', 'templates', '40', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('52', '添加模板', 'button', null, 'template:add', '51', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('53', '批量删除模板', 'button', null, 'template:batchDelete', '51', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('54', '编辑模板', 'button', null, 'template:edit,template:get', '51', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('55', '删除模板', 'button', null, 'template:delete', '51', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('56', '更新日志', 'menu', '/updates', 'updateLogs', '40', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('57', '添加更新日志', 'button', null, 'updateLog:add', '51', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('58', '批量删除更新日志', 'button', null, 'updateLog:batchDelete', '51', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('59', '编辑更新日志', 'button', null, 'updateLog:edit,updateLog:get', '51', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('60', '删除更新日志', 'button', null, 'updateLog:delete', '51', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('61', '公告管理', 'menu', '/notices', 'notices', '40', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('62', '添加公告', 'button', null, 'notice:add', '61', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('63', '批量删除公告', 'button', null, 'notice:batchDelete', '61', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('64', '编辑公告', 'button', null, 'notice:edit,notice:get', '61', '4', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('65', '删除公告', 'button', null, 'notice:delete', '61', '5', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('66', '发布公告', 'button', null, 'notice:release', '61', '6', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('67', '撤回公告', 'button', null, 'notice:withdraw', '61', '7', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('68', '测试页面', 'menu', '', '', '0', '6', '0', '1', 'fa fa-desktop', '2018-05-22 10:08:05', '2018-08-24 14:11:42');
INSERT INTO `sys_resources` VALUES ('69', 'icons图标', 'menu', '/icons', 'icons', '68', '2', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('70', 'shiro测试', 'menu', '/shiro', 'shiro', '68', '3', '0', '1', null, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES ('71', '推送消息', 'menu', '/notice', 'notice', '40', null, '0', '1', '', '2018-06-26 16:16:51', '2018-06-26 16:16:51');
INSERT INTO `sys_resources` VALUES ('72', '实验室', 'menu', '', '', '0', '5', '0', '1', 'fa fa-flask', '2018-07-30 11:28:50', '2018-08-24 14:11:37');
INSERT INTO `sys_resources` VALUES ('73', '文章搬运工', 'menu', '/remover', 'remover', '72', null, '0', '1', '', '2018-08-17 21:16:24', '2018-08-17 21:22:58');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'role:root', '超级管理员', '1', '2017-12-20 16:40:24', '2017-12-20 16:40:26');
INSERT INTO `sys_role` VALUES ('2', 'role:admin', '管理员', '1', '2017-12-22 13:56:39', '2017-12-22 13:56:39');
INSERT INTO `sys_role` VALUES ('3', 'role:comment', '评论审核管理员', '1', '2018-05-22 11:37:37', '2018-05-22 11:37:37');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `resources_id` bigint(20) unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES ('1', '1', '1', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('2', '1', '2', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('3', '1', '3', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('4', '1', '4', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('5', '1', '5', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('6', '1', '6', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('7', '1', '7', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('8', '1', '8', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('9', '1', '9', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('10', '1', '10', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('11', '1', '11', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('12', '1', '12', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('13', '1', '13', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('14', '1', '14', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('15', '1', '15', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('16', '1', '16', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('17', '1', '17', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('18', '1', '18', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('19', '1', '19', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('20', '1', '20', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('21', '1', '21', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('22', '1', '22', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('23', '1', '23', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('24', '1', '24', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('25', '1', '25', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('26', '1', '26', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('27', '1', '27', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('28', '1', '28', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('29', '1', '29', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('30', '1', '30', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('31', '1', '31', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('32', '1', '32', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('33', '1', '33', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('34', '1', '34', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('35', '1', '35', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('36', '1', '36', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('37', '1', '37', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('38', '1', '38', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('39', '1', '39', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('40', '1', '40', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('41', '1', '41', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('42', '1', '42', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('43', '1', '43', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('44', '1', '44', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('45', '1', '45', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('46', '1', '46', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('47', '1', '47', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('48', '1', '48', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('49', '1', '49', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('50', '1', '50', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('51', '1', '51', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('52', '1', '52', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('53', '1', '57', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('54', '1', '53', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('55', '1', '58', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('56', '1', '54', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('57', '1', '59', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('58', '1', '55', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('59', '1', '60', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('60', '1', '56', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('61', '1', '61', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('62', '1', '62', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('63', '1', '63', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('64', '1', '64', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('65', '1', '65', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('66', '1', '66', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('67', '1', '67', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('68', '1', '68', '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES ('84', '2', '20', '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES ('85', '2', '21', '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES ('86', '2', '24', '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES ('87', '2', '25', '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES ('88', '2', '26', '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES ('89', '2', '27', '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES ('93', '3', '40', '2018-05-22 11:37:48', '2018-05-22 11:37:48');
INSERT INTO `sys_role_resources` VALUES ('94', '3', '46', '2018-05-22 11:37:48', '2018-05-22 11:37:48');
INSERT INTO `sys_role_resources` VALUES ('95', '3', '48', '2018-05-22 11:37:48', '2018-05-22 11:37:48');
INSERT INTO `sys_role_resources` VALUES ('96', '3', '49', '2018-05-22 11:37:48', '2018-05-22 11:37:48');

-- ----------------------------
-- Table structure for sys_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_template`;
CREATE TABLE `sys_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ref_key` varchar(100) DEFAULT NULL COMMENT '键',
  `ref_value` text COMMENT '模板内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_template
-- ----------------------------
INSERT INTO `sys_template` VALUES ('1', 'TM_SITEMAP_XML', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n	<url>\r\n		<loc>${config.siteUrl}</loc>\r\n		<priority>1.0</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/about</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/links</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/guestbook</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/updateLog</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/recommended</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<#list articleList as item>\r\n		<url>\r\n			<loc>${config.siteUrl}/article/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	<#list articleTypeList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/type/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	\r\n	<#list articleTagsList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/tag/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n</urlset>', '2018-01-19 10:47:06', '2018-03-13 17:41:31');
INSERT INTO `sys_template` VALUES ('2', 'TM_SITEMAP_TXT', '${config.siteUrl}\r\n${config.siteUrl}/about\r\n${config.siteUrl}/links\r\n${config.siteUrl}/guestbook\r\n${config.siteUrl}/updateLog\r\n${config.siteUrl}/recommended\r\n<#list articleList as item>\r\n${config.siteUrl}/article/${item.id}\r\n</#list>\r\n<#list articleTypeList as item>\r\n${config.siteUrl}/type/${item.id}\r\n</#list>\r\n<#list articleTagsList as item>\r\n${config.siteUrl}/tag/${item.id}\r\n</#list>', '2018-01-19 10:47:12', '2018-02-28 12:11:59');
INSERT INTO `sys_template` VALUES ('3', 'TM_SITEMAP_HTML', '<!DOCTYPE html>\r\n<html lang=\"zh-CN\">\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n    <title>${config.siteName} 网站地图</title>\r\n    <meta name=\"author\" content=\"SiteMapX.com\"/>\r\n    <meta name=\"robots\" content=\"index,follow\"/>\r\n    <style type=\"text/css\">\r\n        body {\r\n            color: #000000;\r\n            background: #ffffff;\r\n            margin: 20px;\r\n            font-family: Verdana, Arial, Helvetica, sans-serif;\r\n            font-size: 12px;\r\n        }\r\n\r\n        #myTable {\r\n            list-style: none;\r\n            margin: 10px 0px 10px 0px;\r\n            padding: 0px;\r\n            width: 100%;\r\n            min-width: 804px;\r\n        }\r\n\r\n        #myTable li {\r\n            list-style-type: none;\r\n            width: 100%;\r\n            min-width: 404px;\r\n            height: 20px;\r\n            line-height: 20px;\r\n        }\r\n\r\n        .pull-left{\r\n            float: left!important;\r\n        }\r\n        .pull-right{\r\n            float: right!important;\r\n        }\r\n\r\n        #myTable li .T1-h {\r\n            font-weight: bold;\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T3-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T4-h {\r\n            width: 100px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T1 {\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T3 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T4 {\r\n            width: 100px;\r\n        }\r\n\r\n        #footer {\r\n            padding: 2px;\r\n            margin: 0px;\r\n            font-size: 8pt;\r\n            color: gray;\r\n            min-width: 900px;\r\n        }\r\n\r\n        #footer a {\r\n            color: gray;\r\n        }\r\n\r\n        .myClear {\r\n            clear: both;\r\n        }\r\n\r\n        #nav, #content, #footer {padding: 8px; border: 1px solid #EEEEEE; clear: both; width: 95%; margin: auto; margin-top: 10px;}\r\n\r\n    </style>\r\n</head>\r\n<body>\r\n<h2 style=\"text-align: center; margin-top: 20px\">${config.siteName?if_exists} 网站地图 </h2>\r\n<div id=\"nav\"><a href=\"${config.siteUrl?if_exists}\"><strong>${config.siteName?if_exists}</strong></a> &raquo; <a href=\"${config.siteUrl?if_exists}/sitemap.html\">站点地图</a></div>\r\n<div id=\"content\">\r\n    <h3>最新文章</h3>\r\n    <ul id=\"myTable\">\r\n        <li>\r\n            <div class=\"T1-h pull-left\">URL</div>\r\n            <div class=\"T2-h pull-right\">Last Change</div>\r\n            <div class=\"T3-h pull-right\">Change Frequency</div>\r\n            <div class=\"T4-h pull-right\">Priority</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName} | 一个程序员的个人博客</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">1</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/about\" title=\"${config.siteName}\">关于 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/links\" title=\"${config.siteName}\">友情链接 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/guestbook\" title=\"${config.siteName}\">留言板 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/updateLog\" title=\"${config.siteName}\">网站更新记录 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n		<div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/recommended\" title=\"${config.siteName}\">站长推荐 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <#list articleList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/article/${item.id}\" title=\"${item.title}\">${item.title} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>分类目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTypeList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/type/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>标签目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTagsList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/tag/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"footer\">\r\n    该文件由<a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName}</a>网站自动生成。\r\n</div>\r\n</body>\r\n</html>', '2018-01-19 10:47:43', '2018-03-13 17:40:52');
INSERT INTO `sys_template` VALUES ('4', 'TM_ROBOTS', 'Crawl-delay: 5\r\nSitemap: https://www.zhyd.me/sitemap.txt\r\nSitemap: https://www.zhyd.me/sitemap.xml\r\nSitemap: https://www.zhyd.me/sitemap.html\r\n', '2018-01-19 10:48:27', '2018-01-19 10:48:27');
INSERT INTO `sys_template` VALUES ('5', 'TM_LINKS', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>站长<a href=\"${link.url?if_exists}\" target=\"_blank\">${link.name?if_exists}</a>，您好!</p>\r\n        <p>您于 ${link.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 提交的友链申请已通过系统审核。以下为您提交的信息，请确认（如有误，请联系我）！</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <li>${link.email?if_exists}</li>\r\n            <li>${link.qq?if_exists}</li>\r\n            <li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li>\r\n        </ul>\r\n        </p>\r\n        <p>本站会不定期检查连接有效性，如果因为贵站改版、服务到期等原因导致无法正常访问的，我会暂时停掉贵站友链，待贵站可以正常访问后，本站会继续启用贵站友链。</p>\r\n        <p>特别注意：以下情况，本站将在不做任何通知下，<strong>取消友链</strong>！</p>\r\n        <ul>\r\n            <li>私自取消本站友情链接</li>\r\n            <li>更换域名且未通知本站</li>\r\n            <li>网站内容长期不更新</li>\r\n            <li>友链上使用诸如nofollow之类的属性</li>\r\n        </ul>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl?if_exists}\" target=\"_blank\">${config.siteName?if_exists}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-01-19 10:48:54', '2018-01-19 10:48:54');
INSERT INTO `sys_template` VALUES ('6', 'TM_COMMENT_AUDIT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论审核结果通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论审核结果通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname?if_exists}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl?if_exists}${comment.sourceUrl?if_exists}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <#if comment.status == \'APPROVED\'>\r\n        <p>已通过管理员审核并显示。</p>\r\n        <p>\r\n            您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <#elseif comment.status == \'REJECT\'>\r\n        <p>审核失败！失败原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#elseif comment.status == \'DELETED\'>\r\n        <p>已被管理员删除！删除原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#else>\r\n        <p>管理员正在审核中！审核通过后将给您及时发送通知！</p>\r\n        </#if>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-01-26 21:17:38', '2018-01-26 21:17:38');
INSERT INTO `sys_template` VALUES ('7', 'TM_COMMENT_REPLY', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论回复通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论回复通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl}${comment.sourceUrl}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <p>\r\n            有了 <strong>新的回复</strong>！您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-01-26 21:17:55', '2018-01-26 21:17:55');
INSERT INTO `sys_template` VALUES ('8', 'TM_LINKS_TO_ADMIN', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>有新的友情链接加入，信息如下</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <#if link.favicon?exists><li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li></#if>\r\n        </ul>\r\n        </p>\r\n        <p><a style=\"text-decoration:none;\" href=\"http://admin.zhyd.me\" target=\"_blank\">去后台继续审核</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-03-31 14:14:11', '2018-03-31 14:14:11');
INSERT INTO `sys_template` VALUES ('9', 'TM_NEW_COMMENT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>新评论通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            新评论通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>\r\n            评论内容：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\"><#if comment?exists>${comment.content}<#else>**无评论内容**</#if></div>\r\n        <p>\r\n            <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">查看完整评论</a>\r\n        </p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-03-31 14:19:04', '2018-03-31 14:19:04');

-- ----------------------------
-- Table structure for sys_update_recorde
-- ----------------------------
DROP TABLE IF EXISTS `sys_update_recorde`;
CREATE TABLE `sys_update_recorde` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(20) DEFAULT NULL COMMENT '更新版本',
  `description` varchar(2500) DEFAULT NULL COMMENT '更新记录备注',
  `recorde_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '项目更新时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_update_recorde
-- ----------------------------
INSERT INTO `sys_update_recorde` VALUES ('1', '1.0.1', '第一版', '2018-01-19 22:16:40', '2018-01-19 22:16:40', '2018-01-19 22:16:40');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(30) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `gender` tinyint(2) unsigned DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `user_type` enum('ROOT','ADMIN','USER') DEFAULT 'ADMIN' COMMENT '超级管理员、管理员、普通用户',
  `company` varchar(100) DEFAULT NULL COMMENT '公司',
  `blog` varchar(255) DEFAULT NULL COMMENT '个人博客地址',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `source` enum('GITHUB','WEIBO','QQ','ZHYD') DEFAULT 'ZHYD' COMMENT '用户来源(默认ZHYD=本网站注册用户)',
  `privacy` tinyint(2) DEFAULT NULL COMMENT '隐私（1：公开，0：不公开）',
  `notification` tinyint(2) unsigned DEFAULT NULL COMMENT '通知：(1：通知显示消息详情，2：通知不显示详情)',
  `score` int(10) unsigned DEFAULT '0' COMMENT '金币值',
  `experience` int(10) unsigned DEFAULT '0' COMMENT '经验值',
  `reg_ip` varchar(30) DEFAULT NULL COMMENT '注册IP',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `status` int(1) unsigned DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'root', 'CGUx1FN++xS+4wNDFeN6DA==', '超级管理员', '13684068237', '343618924@qq.com', '343618924', null, null, 'https://static.zhyd.me/static/img/favicon.ico', 'ROOT', null, null, null, 'ZHYD', null, null, '0', '0', null, '110.184.64.116', '2018-12-30 20:02:39', '256', null, '1', '2018-01-02 09:32:15', '2018-12-30 20:02:39');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '2018-01-02 10:47:27', '2018-01-02 10:47:27');
