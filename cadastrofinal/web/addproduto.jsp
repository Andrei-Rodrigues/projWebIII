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
    String nome = request.getParameter("nome");
    String precoString = request.getParameter("preco");
    double preco = 0.0;
    try {
        preco = Double.parseDouble(precoString);
    } catch (NumberFormatException e) {
        e.printStackTrace();
    }

    // Create the Produto object
    Produto produto = new Produto();
    produto.setNome(nome);
    produto.setPreco(preco);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastro", "root", "");
    
        ProdutoDAO produtoDAO = new ProdutoDAO(conn);
        produtoDAO.adicionarProduto(produto);
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    response.sendRedirect("index.jsp");
%>
