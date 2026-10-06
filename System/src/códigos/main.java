package códigos;
import códigos.Interfaces.*;

public class main {

    public static void main(String[] args) {

        java.awt.EventQueue.invokeLater(() -> {
        TelaLogin login = new TelaLogin();
        login.setLocationRelativeTo(null);
        login.setVisible(true);
        });
    }
}

