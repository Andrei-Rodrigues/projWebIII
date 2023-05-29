<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.andrei.proj.Produto"%>
<%@ page import="com.andrei.proj.ProdutoDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar produto</title>
</head>
<body>
    <%  
        String idString = request.getParameter("id");
        String nome = request.getParameter("nome");
        String precoString = request.getParameter("preco").replace(",", ".");

        int id = Integer.valueOf(idString);

        double preco = 0.0;
        try {
            preco = Double.parseDouble(precoString);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        Produto produto = new Produto();
        produto.setId(id);
        produto.setNome(nome);
        produto.setPreco(preco);
    %>

    <h1>Editar Produto</h1>

    <form action="editproduto.jsp" method="post">
        <input type="hidden" name="id" value="<%= produto.getId() %>">
        
        <label for="nome">nome:</label>
        <input type="text" id="nome" name="nome" value="<%= produto.getNome() %>">
        <br>


        <label for="preco">Preco:</label>
        <input type="number" id="preco" name="preco" value="<%= produto.getPreco() %>">
        <br>

        <input type="submit" value="Update">
    </form>
</body>
</html>
