
<%@page import="navers.Api_naver"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%><%=Api_naver.getJson("news", request.getParameter("key"))%>
    