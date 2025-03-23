/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductLineDTO;
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
public class ProductLineDAO implements IDAO<ProductLineDTO, String> {

    public String autoCreateID() {
        List<ProductLineDTO> list = readAll();
        if (list.isEmpty()) {
            return "L001";
        }
        int maxId = 0;
        for (ProductLineDTO item : list) {
            String id = item.getLine_id();
            if (id.matches("L\\d{3}")) {
                int num = Integer.parseInt(id.substring(1));
                if (num > maxId) {
                    maxId = num;
                }
            }
        }

        return String.format("L%03d", maxId + 1);
    }

    @Override
    public boolean create(ProductLineDTO Object) {
        String sql = "INSERT INTO [dbo].[PRODUCT_LINE] VALUES(?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateID());
            ps.setString(2, Object.getLine_name());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean add(String lineName) {
        String sql = "INSERT INTO [dbo].[PRODUCT_LINE] VALUES(?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateID());
            ps.setString(2, lineName);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<ProductLineDTO> searchTerm(String term) {
        String sql = "select * from [dbo].[PRODUCT_LINE] where LINE_NAME LIKE ?";
        List<ProductLineDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + term + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductLineDTO line = new ProductLineDTO(
                        rs.getString("LINE_ID"),
                        rs.getString("LINE_NAME")
                );
                list.add(line);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public List<ProductLineDTO> readAll() {
        String sql = "select * from [dbo].[PRODUCT_LINE]";
        List<ProductLineDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductLineDTO line = new ProductLineDTO(
                        rs.getString("LINE_ID"),
                        rs.getString("LINE_NAME")
                );
                list.add(line);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public boolean update(ProductLineDTO object) {
        String sql = "update [dbo].[PRODUCT_LINE] set [LINE_NAME] = ? where LINE_ID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, object.getLine_name());
            ps.setString(2, object.getLine_id());
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
        String sql = "DELETE FROM [dbo].[PRODUCT_LINE] WHERE LINE_ID = ? ";
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
    public ProductLineDTO readById(String id) {
        String sql = "select * from [dbo].[PRODUCT_LINE] where LINE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductLineDTO line = new ProductLineDTO(
                        rs.getString("LINE_ID"),
                        rs.getString("LINE_NAME")
                );
                return line;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
