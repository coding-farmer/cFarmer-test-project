<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
	<h1>springmvc + servlet3 可以支持访问jar中jsp 文件</h1>
	</p>

	<p>
	<ul style="list-style-type:decimal;">
		<li>
			servlet3 运行容器 tomcat 7 以上版本或jetty 8 以上
		</li>
	
		<li>
			servlet3 pom<br>
			<textarea rows="6" cols="100"><dependency>
	<groupId>javax.servlet</groupId>
	<artifactId>javax.servlet-api</artifactId>
	<version>3.1-b02</version>
	<type>jar</type>
</dependency></textarea>
		</li>
		
		<li>servlet3 web.xml schema <br> 
		<textarea rows="5" cols="100">
<web-app xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
version="3.0"></textarea>
		</li>
			
		
		<li>
			jar中jsp 存放路径<br>
			<textarea rows="5" cols="100">META-INF/resources

相当于项目的webRoot目录，可以添加子目录
</textarea>
		</li>
		
		<li>
			spring-mvc xml 配置<br>
			<textarea rows="9" cols="100"><bean
	class="org.springframework.web.servlet.view.InternalResourceViewResolver">
	<property name="prefix" value="/" />
	<property name="suffix" value=".jsp" />
	<property name="order" value="2" />
</bean>

prefix /  就是指webRoot 目录
</textarea>
		</li>
		
		<li>
			静态资源与可以放到jar的  META-INF/resources 下<br />
			<textarea rows="3" cols="100"><mvc:resources location="/static/**" mapping="/static/**" /></textarea>
		</li>
		<li>
			模板需注意 <br />
			<textarea rows="38" cols="100">	
<!-- velocity视图解析器 
prefix 指source相对目录，可以在classpath 中，也可以在jar中。
-->
<bean id="velocityViewResolver"
	class="org.springframework.web.servlet.view.velocity.VelocityViewResolver">
	<property name="cache" value="false"></property>
	<property name="prefix" value="/META-INF/resources/WEB-INF/views/velocity/"/>
	<property name="suffix" value=".html" />
	<property name="order" value="1"></property>
	<property name="exposeSpringMacroHelpers" value="true" />
	<property name="contentType" value="text/html;charset=utf-8" />
	<property name="exposeSessionAttributes" value="true"></property>
</bean>

<!-- velocity环境配置 
resourceLoaderPath  指load目录的相对路径，如果非/开头，是webRoot 相对路径，可以是系统全路径
也可以配置多个，用英文逗号分隔
在加载模板时，会先用resourceLoaderPath + prefix 去找模板。
当没有时，再去 项目的classpath jar 中找 prefix 路径
-->
<bean id="velocityConfig"
	class="org.springframework.web.servlet.view.velocity.VelocityConfigurer">
	<property name="velocityProperties">
		<props>
			<prop key="input.encoding">UTF-8</prop>
			<prop key="output.encoding">UTF-8</prop>
		</props>
	</property>
	<property name="preferFileSystemAccess">
		<value>false</value>
	</property>

	<property name="resourceLoaderPath">
		<value>WEB-INF/views/</value>
	</property>
</bean></textarea>
		</li>
	</ul>
	</p>
</body>
</html>