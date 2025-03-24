/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductColorDTO;
import dto.ShoesProductDTO;
import dto.UserDTO;
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
public class ShoesProductDAO implements IDAO<ShoesProductDTO, String> {

    @Override
    public boolean create(ShoesProductDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ShoesProductDTO> readAll() {
        return null;
    }

    public List<ShoesProductDTO> searchShoes2(String searchTerm, String gender, String status,
            String style, String productLine, String priceMin,
            String priceMax, String material, String color) {
        List<ShoesProductDTO> list = new ArrayList<>();
        List<Object> params = new ArrayList<>();
        String sql = "SELECT DISTINCT sp.*"
                + " FROM [dbo].[SHOES_PRODUCT] sp"
                + " JOIN [dbo].[SHOES_COLOR_SIZE] sc ON sp.SHOES_ID = sc.SHOES_ID"
                + " JOIN [dbo].[PRODUCT_COLOR] c ON sc.COLOR_ID = c.COLOR_ID"
                + " WHERE 1=1";
        Boolean isSoldout;
        if (status != null && !status.isEmpty()) {
            sql += " AND STATUS = ?";
            params.add(status);
            isSoldout = status.equals("Soldout");
        } else {
            isSoldout = false;
        }

        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            sql += " AND sp.SHOES_NAME LIKE ?";
            params.add("%" + searchTerm + "%");
        }

        if (!isSoldout) {
            sql += " AND STATUS != 'Soldout'";
        }
        if (gender != null && !gender.isEmpty()) {
            sql += " AND (GENDER = ? OR GENDER = 'Unisex')";
            params.add(gender);
        }
        if (style != null && !style.isEmpty()) {
            sql += " AND STYLE_ID = ?";
            params.add(style);
        }
        if (productLine != null && !productLine.isEmpty()) {
            sql += " AND LINE_ID = ?";
            params.add(productLine);
        }
        if (material != null && !material.isEmpty()) {
            sql += " AND MAT_ID = ?";
            params.add(material);
        }

        if (color != null && !color.isEmpty()) {
            sql += " AND sc.COLOR_ID = ?";
            params.add(color);
        }

        if (priceMin != null && !priceMin.isEmpty() && priceMax != null && !priceMax.isEmpty()) {
            int min = Integer.parseInt(priceMin);
            int max = Integer.parseInt(priceMax);
            sql += " AND PRICE between ? and ?";
            params.add(min);
            params.add(max);
        }
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShoesProductDTO shoes = new ShoesProductDTO(
                        rs.getString("SHOES_ID"),
                        rs.getString("SHOES_NAME"),
                        rs.getDate("PRODUCE_DATE").toLocalDate(),
                        rs.getBigDecimal("PRICE"),
                        rs.getInt("QUANTITY"),
                        rs.getString("GENDER"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("STATUS"),
                        rs.getString("STYLE_ID"),
                        rs.getString("LINE_ID"),
                        rs.getString("MAT_ID"),
                        rs.getString("SALE_ID")
                );
                list.add(shoes);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ShoesProductDTO> searchShoes(String searchTerm, String gender, String status,
            String style, String productLine, String priceMin,
            String priceMax, String material, String color, int page, int pageSize) {
        List<ShoesProductDTO> list = new ArrayList<>();
        List<Object> params = new ArrayList<>();
        String sql = "SELECT DISTINCT sp.*"
                + " FROM [dbo].[SHOES_PRODUCT] sp"
                + " JOIN [dbo].[SHOES_COLOR_SIZE] sc ON sp.SHOES_ID = sc.SHOES_ID"
                + " JOIN [dbo].[PRODUCT_COLOR] c ON sc.COLOR_ID = c.COLOR_ID"
                + " WHERE 1=1";
        Boolean isSoldout;
        if (status != null && !status.isEmpty()) {
            sql += " AND STATUS = ?";
            params.add(status);
            isSoldout = status.equals("Soldout");
        } else {
            isSoldout = false;
        }

        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            sql += " AND sp.SHOES_NAME LIKE ?";
            params.add("%" + searchTerm + "%");
        }

        if (!isSoldout) {
            sql += " AND STATUS != 'Soldout'";
        }
        if (gender != null && !gender.isEmpty()) {
            sql += " AND (GENDER = ? OR GENDER = 'Unisex')";
            params.add(gender);
        }
        if (style != null && !style.isEmpty()) {
            sql += " AND STYLE_ID = ?";
            params.add(style);
        }
        if (productLine != null && !productLine.isEmpty()) {
            sql += " AND LINE_ID = ?";
            params.add(productLine);
        }
        if (material != null && !material.isEmpty()) {
            sql += " AND MAT_ID = ?";
            params.add(material);
        }

        if (color != null && !color.isEmpty()) {
            sql += " AND sc.COLOR_ID = ?";
            params.add(color);
        }

        if (priceMin != null && !priceMin.isEmpty() && priceMax != null && !priceMax.isEmpty()) {
            int min = Integer.parseInt(priceMin);
            int max = Integer.parseInt(priceMax);
            sql += " AND PRICE between ? and ?";
            params.add(min);
            params.add(max);
        }
        int offset = (page - 1) * pageSize;
        sql += " ORDER BY sp.SHOES_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        params.add(offset);
        params.add(pageSize);
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShoesProductDTO shoes = new ShoesProductDTO(
                        rs.getString("SHOES_ID"),
                        rs.getString("SHOES_NAME"),
                        rs.getDate("PRODUCE_DATE").toLocalDate(),
                        rs.getBigDecimal("PRICE"),
                        rs.getInt("QUANTITY"),
                        rs.getString("GENDER"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("STATUS"),
                        rs.getString("STYLE_ID"),
                        rs.getString("LINE_ID"),
                        rs.getString("MAT_ID"),
                        rs.getString("SALE_ID")
                );
                list.add(shoes);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ShoesProductDTO> searchShoesByName(String searchTerm) {
        String sql = "select * from [dbo].[SHOES_PRODUCT] where SHOES_NAME like ?";
        List<ShoesProductDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShoesProductDTO shoes = new ShoesProductDTO(
                        rs.getString("SHOES_ID"),
                        rs.getString("SHOES_NAME"),
                        rs.getDate("PRODUCE_DATE").toLocalDate(),
                        rs.getBigDecimal("PRICE"),
                        rs.getInt("QUANTITY"),
                        rs.getString("GENDER"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("STATUS"),
                        rs.getString("STYLE_ID"),
                        rs.getString("LINE_ID"),
                        rs.getString("MAT_ID"),
                        rs.getString("SALE_ID")
                );
                list.add(shoes);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public boolean update(ShoesProductDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ShoesProductDTO readById(String id) {
        String sql = "select * from [dbo].[SHOES_PRODUCT] where SHOES_ID = ?";
        List<ShoesProductDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ShoesProductDTO shoes = new ShoesProductDTO(
                        rs.getString("SHOES_ID"),
                        rs.getString("SHOES_NAME"),
                        rs.getDate("PRODUCE_DATE").toLocalDate(),
                        rs.getBigDecimal("PRICE"),
                        rs.getInt("QUANTITY"),
                        rs.getString("GENDER"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("STATUS"),
                        rs.getString("STYLE_ID"),
                        rs.getString("LINE_ID"),
                        rs.getString("MAT_ID"),
                        rs.getString("SALE_ID")
                );
                return shoes;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<ProductColorDTO> colorOfShoes(String id) {
        String sql = "select distinct cl.COLOR_ID, cl.COLOR_NAME, cl.COLOR_CODE "
                + "from [dbo].[SHOES_COLOR_SIZE] sh join [dbo].[PRODUCT_COLOR] cl on sh.COLOR_ID = cl.COLOR_ID "
                + "where sh.SHOES_ID = ?";
        List<ProductColorDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductColorDTO color = new ProductColorDTO(
                        rs.getString("COLOR_ID"),
                        rs.getString("COLOR_NAME"),
                        rs.getString("COLOR_CODE")
                );
                list.add(color);
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean addToFav(String username, String shoesId) {
        String sql = "SELECT FAV_ID FROM [dbo].[FAVOURITE] WHERE USER_NAME = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            String favId = null;
            if (!rs.next()) {
                String getMaxFavIdQuery = "SELECT MAX(FAV_ID) FROM FAVOURITE";
                Statement st = conn.createStatement();
                rs = st.executeQuery(getMaxFavIdQuery);
                String newFavId = "FAV001"; // Mặc định nếu chưa có bản ghi nào
                if (rs.next() && rs.getString(1) != null) {
                    String lastId = rs.getString(1); // Lấy mã FAV cuối cùng (FAV002, FAV003,...)
                    int number = Integer.parseInt(lastId.substring(3)) + 1; // Cắt "FAV" và chuyển số
                    newFavId = String.format("FAV%03d", number); // Định dạng thành FAVxxx
                }

                // Chèn bản ghi mới vào FAVOURITE
                String insertFavQuery = "INSERT INTO [dbo].[FAVOURITE] (FAV_ID, USER_NAME) VALUES (?, ?)";
                ps = conn.prepareStatement(insertFavQuery);
                ps.setString(1, newFavId);
                ps.setString(2, username);
                ps.executeUpdate();
                favId = newFavId;
            } else {
                favId = rs.getString("FAV_ID");
            }
            sql = "INSERT INTO [dbo].[FAVOURITE_DETAIL] (FAV_ID, SHOES_ID) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, favId);
            ps.setString(2, shoesId);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
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

    public boolean deleteFromFav(String username, String shoesId) {
        String sql = "DELETE FD"
                + " FROM [dbo].[FAVOURITE_DETAIL] FD"
                + " JOIN [dbo].[FAVOURITE] F ON FD.FAV_ID = F.FAV_ID"
                + " WHERE F.USER_NAME = ? AND FD.SHOES_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, shoesId);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteAllFav(String username) {
        String sql = "DELETE FD"
                + " FROM [dbo].[FAVOURITE_DETAIL] FD"
                + " JOIN [dbo].[FAVOURITE] F ON FD.FAV_ID = F.FAV_ID"
                + " WHERE F.USER_NAME = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<ShoesProductDTO> readAllFav(String username) {
        String sql = "SELECT FD.SHOES_ID"
                + " FROM [dbo].[FAVOURITE_DETAIL] FD"
                + " JOIN [dbo].[FAVOURITE] F ON FD.FAV_ID = F.FAV_ID"
                + " WHERE F.USER_NAME = ?";
        List<ShoesProductDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(readById(rs.getString("SHOES_ID")));
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkFav(String shoesId, String username) {
        String sql = "SELECT COUNT(*) AS is_favourite "
                + "FROM FAVOURITE_DETAIL FD "
                + "JOIN FAVOURITE F ON FD.FAV_ID = F.FAV_ID "
                + "WHERE F.USER_NAME = ? AND FD.SHOES_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, shoesId);
            ResultSet rs = ps.executeQuery();
            boolean isFavourite = false;
            if (rs.next()) {
                isFavourite = rs.getInt("is_favourite") > 0;
            }
            return isFavourite;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
