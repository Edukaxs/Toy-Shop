
package conexao;

import códigos.Interfaces.*;
import javax.swing.JOptionPane;
import java.sql.*;

public class Conexao {

    private final String driver =
        "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    private final String url =
        "jdbc:sqlserver://localhost:1433;databaseName=LojaDeBrinquedos;integratedSecurity=true;encrypt=true;trustServerCertificate=true";

    private final String usuario = "";
    private final String senha = "";

    private Connection conexao;
    public Statement statement;
    public ResultSet resultset;

    public boolean conecta() {
        boolean resultado = true;

        try {
            Class.forName(driver);

            conexao = DriverManager.getConnection(url);

            TelaAviso aviso = new TelaAviso("aprovado", "Conexão estabelecida", "Banco de dados conectado com sucesso.");
            aviso.setLocationRelativeTo(null);
            aviso.setVisible(true);

        } catch (ClassNotFoundException erro) {
            JOptionPane.showMessageDialog(
                null,
                "Driver JDBC não localizado: " + erro.getMessage()
            );
            resultado = false;

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(
                null,
                "Erro ao conectar ao SQL Server: "
                    + erro.getMessage()
            );
            resultado = false;
        }

        return resultado;
    }

    public void desconecta() {
        try {
            if (conexao != null && !conexao.isClosed()) {
                conexao.close();
            }
        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(
                null,
                "Erro ao fechar conexão: " + erro.getMessage()
            );
        }
    }

    public void executaSQL(String sql) {
        try {
            statement = conexao.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY
            );

            resultset = statement.executeQuery(sql);

        } catch (SQLException erro) {
            JOptionPane.showMessageDialog(
                null,
                "Erro no comando SQL: " + erro.getMessage()
            );
        }
    }
}
