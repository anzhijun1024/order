#!/usr/bin/env bash
#编译+部署order站点

#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
export PROJ_PATH=/software/tomcat9/webapps/jenkins

# 输入你的环境上tomcat的全路径
export TOMCAT_APP_PATH=/software/tomcat9




cd $PROJ_PATH/order
mvn clean install

cd $TOMCAT_APP_PATH/bin
sh shutdown.sh


# 删除原有工程
rm -rf $TOMCAT_APP_PATH/webapps/ROOT
rm -f $TOMCAT_APP_PATH/webapps/ROOT.war
rm -f $TOMCAT_APP_PATH/webapps/order.war

# 复制新的工程
cp $PROJ_PATH/order/target/order.war $TOMCAT_APP_PATH/webapps/newpro

cd $TOMCAT_APP_PATH/webapps/newpro
mv order.war ROOT.war

# 启动Tomcat
cd $TOMCAT_APP_PATH/bin
sh ./startup.sh



