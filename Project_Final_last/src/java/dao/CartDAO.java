/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CartDTO;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class CartDAO implements IDAO<CartDTO, String> {

    @Override
    public boolean create(CartDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<CartDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CartDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(CartDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<CartDTO> readAllByUserId(String username) {
        String sql = "SELECT CD.CART_ID, SHOES_ID, COLOR_ID, SIZE_ID, QUANTITY, PRICE"
                + " FROM CART_DETAIL CD JOIN CART C ON CD.CART_ID = C.CART_ID"
                + " WHERE C.USER_NAME = ?";
        List<CartDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDTO cart = new CartDTO(
                        rs.getString("CART_ID"),
                        rs.getString("SHOES_ID"),
                        rs.getString("COLOR_ID"),
                        rs.getString("SIZE_ID"),
                        rs.getInt("QUANTITY"),
                        rs.getBigDecimal("PRICE")
                );
                list.add(cart);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean addToCart(String username, String shoesId, String colorId, String sizeId, int quantity, BigDecimal price) {
        String sql = "SELECT CART_ID FROM [dbo].[CART] WHERE USER_NAME = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            String CarId = null;
            if (!rs.next()) {
                String getMaxFavIdQuery = "SELECT MAX(CART_ID) FROM [dbo].[CART]";
                Statement st = conn.createStatement();
                rs = st.executeQuery(getMaxFavIdQuery);
                String newCarId = "CAR001"; // Mặc định nếu chưa có bản ghi nào
                if (rs.next() && rs.getString(1) != null) {
                    String lastId = rs.getString(1); // Lấy mã FAV cuối cùng (FAV002, FAV003,...)
                    int number = Integer.parseInt(lastId.substring(3)) + 1; // Cắt "FAV" và chuyển số
                    newCarId = String.format("CAR%03d", number); // Định dạng thành FAVxxx
                }

                // Chèn bản ghi mới vào FAVOURITE
                String insertFavQuery = "INSERT INTO [dbo].[CART] (CART_ID, USER_NAME) VALUES (?, ?)";
                ps = conn.prepareStatement(insertFavQuery);
                ps.setString(1, newCarId);
                ps.setString(2, username);
                ps.executeUpdate();
                CarId = newCarId;
            } else {
                CarId = rs.getString("CART_ID");
            }
            if (!checkCart(shoesId, colorId, sizeId)) {
                sql = "INSERT INTO [dbo].[CART_DETAIL] (CART_ID, SHOES_ID, COLOR_ID, SIZE_ID, QUANTITY, PRICE)"
                        + " VALUES (?, ?, ?, ?, ?, ?)";
                BigDecimal total = price.multiply(BigDecimal.valueOf(quantity));

                ps = conn.prepareStatement(sql);
                ps.setString(1, CarId);
                ps.setString(2, shoesId);
                ps.setString(3, colorId);
                ps.setString(4, sizeId);
                ps.setInt(5, quantity);
                ps.setBigDecimal(6, total);
                return ps.executeUpdate() > 0;
            } else {
                sql = "SELECT QUANTITY FROM [dbo].[CART_DETAIL] "
                        + " WHERE CART_ID = ? AND SHOES_ID = ? AND COLOR_ID = ?"
                        + " AND SIZE_ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, CarId);
                ps.setString(2, shoesId);
                ps.setString(3, colorId);
                ps.setString(4, sizeId);
                rs = ps.executeQuery();
                int currentQuantity = 0;
                if (rs.next()) {
                    currentQuantity = rs.getInt("QUANTITY");
                }
                BigDecimal total = price.multiply(BigDecimal.valueOf(quantity + currentQuantity));
                sql = "UPDATE [dbo].[CART_DETAIL] SET QUANTITY = ?, PRICE = ?"
                        + " WHERE CART_ID = ? AND SHOES_ID = ? "
                        + " AND COLOR_ID = ? AND SIZE_ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, currentQuantity + quantity);
                ps.setBigDecimal(2, total);
                ps.setString(3, CarId);
                ps.setString(4, shoesId);
                ps.setString(5, colorId);
                ps.setString(6, sizeId);
                return ps.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkCart(String shoesId, String colorId, String sizeId) {
        String sql = "SELECT CART_ID FROM [dbo].[CART_DETAIL]"
                + " WHERE SHOES_ID = ? AND COLOR_ID = ? AND SIZE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shoesId);
            ps.setString(2, colorId);
            ps.setString(3, sizeId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteCart(String username, String shoesId, String colorId, String sizeId) {
        String sql = "DELETE CD "
                + " FROM [dbo].[CART_DETAIL] CD JOIN"
                + " [dbo].[CART] C ON CD.CART_ID = C.CART_ID"
                + " WHERE C.USER_NAME = ? AND CD.SHOES_ID = ?"
                + " AND CD.COLOR_ID = ? AND CD.SIZE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, shoesId);
            ps.setString(3, colorId);
            ps.setString(4, sizeId);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteAllCart(String username) {
        String sql = "DELETE CD "
                + " FROM [dbo].[CART_DETAIL] CD JOIN"
                + " [dbo].[CART] C ON CD.CART_ID = C.CART_ID"
                + " WHERE C.USER_NAME = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
