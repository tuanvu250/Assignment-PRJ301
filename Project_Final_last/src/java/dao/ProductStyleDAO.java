/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductStyleDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;
 
public class ProductStyleDAO implements IDAO<ProductStyleDTO, String> {

    public String autoCreateID() {
        List<ProductStyleDTO> list = readAll();
        if (list.isEmpty()) {
            return "S001";
        }
        int maxId = 0;
        for (ProductStyleDTO item : list) {
            String id = item.getStyle_id();
            if (id.matches("S\\d{3}")) {
                int num = Integer.parseInt(id.substring(1));
                if (num > maxId) {
                    maxId = num;
                }
            }
        }

        return String.format("S%03d", maxId + 1);
    }

    @Override
    public boolean create(ProductStyleDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean add(String stylename) {
        String sql = "INSERT INTO [dbo].[STYLE_PRODUCT] VALUES(?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateID());
            ps.setString(2, stylename);
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
    public List<ProductStyleDTO> readAll() {
        String sql = "select * from [dbo].[STYLE_PRODUCT]";
        List<ProductStyleDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductStyleDTO sty = new ProductStyleDTO(
                        rs.getString("STYLE_ID"),
                        rs.getString("STYLE_NAME")
                );
                list.add(sty);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductStyleDTO> searchTerm(String term) {
        String sql = "select * from [dbo].[STYLE_PRODUCT] where STYLE_NAME LIKE ?";
        List<ProductStyleDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + term + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductStyleDTO style = new ProductStyleDTO(
                        rs.getString("STYLE_ID"),
                        rs.getString("STYLE_NAME")
                );
                list.add(style);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public boolean update(ProductStyleDTO object) {
        String sql = "update [dbo].[STYLE_PRODUCT] set [STYLE_NAME] = ? where STYLE_ID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, object.getStyle_id());
            ps.setString(2, object.getStyle_name());
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
        String sql = "DELETE FROM [dbo].[STYLE_PRODUCT] WHERE STYLE_ID = ? ";
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
    public ProductStyleDTO readById(String id) {
        String sql = "select * from [dbo].[STYLE_PRODUCT] where STYLE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductStyleDTO style = new ProductStyleDTO(
                        rs.getString("STYLE_ID"),
                        rs.getString("STYLE_NAME")
                );
                return style;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
