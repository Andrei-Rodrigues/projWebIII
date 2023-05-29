package com.andrei.proj;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Produto Data Access Object
public class ProdutoDAO {
    
    private final Connection conn;

    public ProdutoDAO(Connection conn) {
        this.conn = conn;
    }

    public void adicionarProduto(Produto produto) {
        try {
            String query = "INSERT INTO produtos (nome, preco) VALUES (?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, produto.getNome());
                stmt.setDouble(2, produto.getPreco());
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editarProduto(Produto produto) {
        try {
            String query = "UPDATE produtos SET nome = ?, preco = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, produto.getNome());
                stmt.setDouble(2, produto.getPreco());
                stmt.setInt(3, produto.getId());
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluirProduto(int id) {
        try {
            String query = "DELETE FROM produtos WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, id);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Produto> listarProdutos() {
        List<Produto> produtos = new ArrayList<>();

        try {
            String query = "SELECT * FROM produtos";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nome = rs.getString("nome");
                    double preco = rs.getDouble("preco");
                    Produto produto = new Produto();
                    produto.setId(id);
                    produto.setNome(nome);
                    produto.setPreco(preco);
                    produtos.add(produto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produtos;
    }
}
