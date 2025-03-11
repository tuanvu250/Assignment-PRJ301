package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

public class AuthUtils {

    public static UserDTO getUser(String usName) {
        UserDAO usDao = new UserDAO();
        return usDao.readByUsName(usName);
    }

    public static boolean verifyUser(String userName, String password) {
        UserDTO user = getUser(userName);
        return user != null && PasswordUtils.checkPassword(password, user.getPassword());
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("currentUser") != null;
    }
    
}
