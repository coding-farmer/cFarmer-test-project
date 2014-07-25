<%@page import="java.util.Comparator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <c:set var="ctx" value="${pageContext.request.contextPath}" />
 
 
 <%
 	String path = request.getContextPath();
	Map<String,String> map = new TreeMap(new Comparator(){
		public int compare(Object o1, Object o2){
			int i1 = Integer.valueOf(o1.toString().split(",")[0]);
			int i2 = Integer.valueOf(o2.toString().split(",")[0]);
			return i1-i2;
		}
	});
	int index = 1;	
	map.put(index++ +",help",path +  "/help.jsp");	
	map.put(index++ +",访问jar中jsp",path +  "/helloJARJSP");	
	map.put(index++ +",项目中与jar中同时有jsp",path +  "/helloJSP");	
	map.put(index++ +",访问jar中velocity 页面", path + "/helloJARHTML");	
	map.put(index++ +",项目中与jar中同时有velocity", path + "/helloHTML");
	map.put(index++ +",jar中的js", path + "/static/jquery-1.9.1.js");
%>
</head>
<body style="width: 98%;height: 98%">
	<table cellpadding="0" cellspacing="0"  height="98%" width="98%" >
		
		<tr>
			<td valign="top" width="20%" style="border:solid 1px red;">
				<div>
					<ul>
						<%
							for(Entry<String,String> entry:map.entrySet()){
								System.err.print(entry.getValue());
								out.print("<li><a href=\""+entry.getValue()+"\" target='content'>"+entry.getKey()+"</a></li>");								
							}
						%>
					</ul>
				</div>
			</td>
			<td valign="top" height="600px" style="word-wrap: break-word; word-break: normal;">
				<iframe id="content" name="content" src="${ctx }/help.jsp" width="96%" style="height: 96%; word-wrap: break-word; word-break: normal; " height="100%">
				</iframe>				
			</td>
		</tr>
	</table>
</body>
</html>