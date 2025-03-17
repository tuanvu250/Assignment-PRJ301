package utils;

import dao.UserDAO;
import dto.UserDTO;
import java.security.MessageDigest;
import java.util.List;

public class PasswordUtils {
    public static boolean checkMirage = false;
    public static String hashPassword(String plainPassword) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messagedigest = md.digest(plainPassword.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : messagedigest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            return null;
        }
    }

    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        String newHashedPassword = hashPassword(plainPassword);
        return newHashedPassword != null && newHashedPassword.equals(hashedPassword);
    }

    public static void miragePasswords() {
        UserDAO usdao = new UserDAO();
        List<UserDTO> users = usdao.readAll();
        for (UserDTO user : users) {
            String plainPassword = user.getPassword();
            String hashedPassword = hashPassword(plainPassword);
            user.setPassword(hashedPassword);
            usdao.update(user);
        }
    }

    public static void main(String[] args) {
        miragePasswords();
    }
}
