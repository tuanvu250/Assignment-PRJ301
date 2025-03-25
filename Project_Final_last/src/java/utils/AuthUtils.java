package utils;

import dao.ProductColorDAO;
import dao.RoleDAO;
import dao.SaleDAO;
import dao.ShoesProductDAO;
import dao.UserDAO;
import dto.ShoesProductDTO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

public class AuthUtils {

    public static final String ADMIN_ROLE = "Admin";

    public static UserDTO getUser(String usName) {
        UserDAO usDao = new UserDAO();
        return usDao.readByUsName(usName);
    }

    public static UserDTO getUser(HttpSession session) {
        return (UserDTO) session.getAttribute("user");
    }

    public static boolean verifyUser(String userName, String password) {
        UserDTO user = getUser(userName);
        return user != null && PasswordUtils.checkPassword(password, user.getPassword());
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("user") != null;
    }

    public static boolean isSale(ShoesProductDTO shoes) {
        return shoes.getStatus().equals("Sale");
    }

    public static boolean isSoldout(ShoesProductDTO shoes) {
        return shoes.getStatus().equals("Soldout");
    }
    
    public static double saleNum(String id) {
        SaleDAO dao = new SaleDAO();
        return dao.saleNum(id);
    }
    
    public static String nameShoes(String id) {
        ShoesProductDAO dao = new ShoesProductDAO();
        return dao.readById(id).getShoes_name();
    }
    
    public static String nameColor(String id) {
        ProductColorDAO dao = new ProductColorDAO();
        return dao.readById(id).getColor_name();
    }

    public static boolean checkIsAdmin(HttpSession session) {
        if (!isLoggedIn(session)) {
            return false;
        }
        RoleDAO rdao = new RoleDAO();
        UserDTO user = getUser(session);
        return rdao.readById(user.getRole_id()).getRole_name().equalsIgnoreCase(ADMIN_ROLE);
    }

}
