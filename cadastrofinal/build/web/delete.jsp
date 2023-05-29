<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>  
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.andrei.proj.Produto"%>
<%@ page import="com.andrei.proj.ProdutoDAO"%>

<%
    String id = request.getParameter("id");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastro", "root", "");
    
        ProdutoDAO produtoDAO = new ProdutoDAO(conn);
        
        produtoDAO.excluirProduto(Integer.valueOf(id));
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    response.sendRedirect("index.jsp");
%>
