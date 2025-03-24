/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductMaterialDTO;
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
public class ProductMaterialDAO implements IDAO<ProductMaterialDTO, String> {

    public String autoCreateID() {
        List<ProductMaterialDTO> list = readAll();
        if (list.isEmpty()) {
            return "L001";
        }
        int maxId = 0;
        for (ProductMaterialDTO item : list) {
            String id = item.getMat_id();
            if (id.matches("M\\d{3}")) {
                int num = Integer.parseInt(id.substring(1));
                if (num > maxId) {
                    maxId = num;
                }
            }
        }

        return String.format("M%03d", maxId + 1);
    }

    @Override
    public boolean create(ProductMaterialDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean add(String matname) {
        String sql = "INSERT INTO [dbo].[MATERIAL] VALUES(?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateID());
            ps.setString(2, matname);
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
    public List<ProductMaterialDTO> readAll() {
        String sql = "select * from [dbo].[MATERIAL]";
        List<ProductMaterialDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductMaterialDTO ma = new ProductMaterialDTO(
                        rs.getString("MAT_ID"),
                        rs.getString("MAT_NAME")
                );
                list.add(ma);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductMaterialDTO> searchTerm(String term) {
        String sql = "select * from [dbo].[MATERIAL] where MAT_NAME LIKE ?";
        List<ProductMaterialDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + term + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 ProductMaterialDTO mate = new ProductMaterialDTO(
                        rs.getString("MAT_ID"),
                        rs.getString("MAT_NAME")
                );
                list.add(mate);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public boolean update(ProductMaterialDTO object) {
        String sql = "update [dbo].[MATERIAL] set [MAT_NAME] = ? where MAT_ID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, object.getMat_id());
            ps.setString(2, object.getMat_name());
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
        String sql = "DELETE FROM [dbo].[MATERIAL] WHERE MAT_ID = ? ";
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
    public ProductMaterialDTO readById(String id) {
        String sql = "select * from [dbo].[MATERIAL] where MAT_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductMaterialDTO mate = new ProductMaterialDTO(
                        rs.getString("MAT_ID"),
                        rs.getString("MAT_NAME")
                );
                return mate;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
