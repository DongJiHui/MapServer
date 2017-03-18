# 教育资源地图服务端
## 项目环境
1、eclipse+javaee插件或者myeclipse

2、Maven项目管理工具

3、apache-tomcat-8.0.24

4、MySQL5.7
## 项目调试
1、eclipse环境下导入项目：File->Import->Existing Maven Projects 选择该项目导入

2、右键该项目->properties->Add->Java Build Path Entries->Maven dependecies ，将Deploy Path填写为WEB-INF/lib

3、src/main/resources/jdbc.properties中的jdbc.username和jdbc.password改为你本机的MySQL的用户名以及密码

4、右键该项目->Run As->Maven install，自动从远端加载依赖库

5、在MySQL中运行map.sql进行数据库的初始化

6、在tomcat插件中添加该项目，便可运行调试
