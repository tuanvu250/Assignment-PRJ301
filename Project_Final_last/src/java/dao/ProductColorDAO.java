/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductColorDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ProductColorDAO implements IDAO<ProductColorDTO, String> {

    public String autoCreateID() {
        String sql = "SELECT MAX(color_id) FROM PRODUCT_COLOR WHERE color_id LIKE 'CL%'";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String maxId = rs.getString(1);
                if (maxId != null) {
                    int num = Integer.parseInt(maxId.substring(2)); // Lấy số từ ID
                    return String.format("CL%03d", num + 1);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductColorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "CL001"; 
    }

    @Override
    public boolean create(ProductColorDTO Object) {
        String sql = "INSERT INTO [dbo].[PRODUCT_COLOR] VALUES(?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateID());
            ps.setString(2, Object.getColor_name());
            ps.setString(3, Object.getColor_code());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductColorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductColorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<ProductColorDTO> readAll() {
        String sql = "select * from [dbo].[PRODUCT_COLOR]";
        List<ProductColorDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductColorDTO color = new ProductColorDTO(
                        rs.getString("COLOR_ID"),
                        rs.getString("COLOR_NAME"),
                        rs.getString("COLOR_CODE")
                );
                list.add(color);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductColorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductColorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductColorDTO> searchTerm(String term) {
        String sql = "select * from [dbo].[PRODUCT_COLOR] where COLOR_NAME LIKE ? OR COLOR_CODE LIKE ?";
        List<ProductColorDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            String sterm = "%" + term + "%";
            ps.setString(1, sterm);
            ps.setString(2, sterm);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductColorDTO color = new ProductColorDTO(
                        rs.getString("COLOR_ID"),
                        rs.getString("COLOR_NAME"),
                        rs.getString("COLOR_CODE")
                );
                list.add(color);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public boolean update(ProductColorDTO object) {
        String sql = "UPDATE [dbo].[PRODUCT_COLOR] SET [COLOR_NAME] = ?, [COLOR_CODE] = ? WHERE [COLOR_ID] = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, object.getColor_name());
            ps.setString(2, object.getColor_code());
            ps.setString(3, object.getColor_id());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM [dbo].[PRODUCT_COLOR] WHERE COLOR_ID = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public ProductColorDTO readById(String id) {
        String sql = "select * from [dbo].[PRODUCT_COLOR] where COLOR_ID = ?";
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
                return color;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
