/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.UserDAO;
import dto.UserDTO;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author Dell
 */
public class VerifyRegister {

    private static UserDAO usDao = new UserDAO();

    public static boolean verifyUsername(String usName) {
        if (usName == null || usName.trim().isEmpty()) {
            return false;
        }
        List<UserDTO> users = usDao.readAll();
        boolean checkDuplicate = true;
        for (UserDTO user : users) {
            if (user.getUser_name().equals(usName)) {
                checkDuplicate = false;
                break;
            }
        }
        return checkDuplicate;
    }

    public static boolean verifyPassword(String password) {
        String regex = "^.{8,}$";
        return password != null && password.matches(regex);
    }

    public static boolean verifyConfirmPassword(String password, String cfPassword) {
        return password.equals(cfPassword);
    }

    public static boolean verifyFullname(String fullname) {
        return !(fullname == null || fullname.trim().isEmpty());
    }

    public static boolean verifyEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        return Pattern.matches(emailRegex, email);
    }

    public static boolean verifyPhoneNumber(String phone) {
        if (phone == null || phone.trim().isEmpty()) {
            return false;
        }
        String phoneRegex = "^\\+?[0-9]{1,4}[0-9]{6,14}$";
        return Pattern.matches(phoneRegex, phone);
    }
}
