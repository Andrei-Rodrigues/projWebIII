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
    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastro", "root", "");
    
        ProdutoDAO produtoDAO = new ProdutoDAO(conn);
        
        List<Produto> produtos = produtoDAO.listarProdutos();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de produtos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: #fff;
        }

        button {
            padding: 3px 8px;
            margin-right: 5px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Cadastro de produtos</h1>

    <form id="produtoForm" action="addproduto.jsp" method="post">
        <label for="nome">Nome do Produto:</label>
        <input type="text" id="nome" name="nome">

        <label for="preco">Preco:</label>
        <input type="number" id="preco" name="preco">

        <input type="submit" value="Adicionar">
    </form>
    
    <hr>
    
    <table id="produtoTable">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Preco</th>
            <th>Acoes</th>
        </tr>
        <%
        for(int i = 0; i < produtos.size(); i++){
        %>
        <tr>
            <td><%=produtos.get(i).getId()%> </td>
            <td><%=produtos.get(i).getNome()%> </td>
            <td><%=produtos.get(i).getPreco()%></td>
            <td>
                <a href="delete.jsp?id=<%= produtos.get(i).getId() %>">Deletar</a>
                <a href="edit.jsp?id=<%= produtos.get(i).getId() %>&nome=<%= produtos.get(i).getNome() %>&preco=<%= produtos.get(i).getPreco() %>">Editar</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    </body>
</html>

<%
    } catch (Exception e) {
        out.println(e);
        out.println("<br><h1>Falha na conexão");
    }

%>