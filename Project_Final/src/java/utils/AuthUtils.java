package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

public class AuthUtils {

    public static UserDTO getUser(String usName) {
        UserDAO usDao = new UserDAO();
        return usDao.readByUSName(usName);
    }

    public static boolean isVeriryUser(String userName, String password) {
        UserDTO usDto = getUser(userName);
        return usDto != null && usDto.getPassword().equals(password);
    }
    public static boolean isLoggedIn(HttpSession session){
        return session.getAttribute("user") != null;
    }
}
