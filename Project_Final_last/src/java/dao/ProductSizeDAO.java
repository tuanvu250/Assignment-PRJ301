 
package dao;

import dto.ProductSizeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

 
public class ProductSizeDAO implements IDAO<ProductSizeDTO, String> {

    @Override
    public boolean create(ProductSizeDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProductSizeDTO> readAll() {
        String sql = "select * from [dbo].[PRODUCT_SIZE]";
        List<ProductSizeDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductSizeDTO line = new ProductSizeDTO(
                        rs.getString("SIZE_ID"),
                        rs.getInt("SIZE_NUM")
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

    public List<ProductSizeDTO> checkSize(String shoesId, String colorId) {
        String sql = "SELECT DISTINCT PS.SIZE_ID, PS.SIZE_NUM"
                + " FROM [dbo].[SHOES_COLOR_SIZE] SCS"
                + " JOIN [dbo].[PRODUCT_SIZE] PS ON SCS.SIZE_ID = PS.SIZE_ID"
                + " WHERE SCS.SHOES_ID = ? and SCS.COLOR_ID = ?"
                + " and SCS.STOCK > 0";
        List<ProductSizeDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shoesId);
            ps.setString(2, colorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductSizeDTO line = new ProductSizeDTO(
                        rs.getString("SIZE_ID"),
                        rs.getInt("SIZE_NUM")
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
    public ProductSizeDTO readById(String id) {
        String sql = "select * from [dbo].[PRODUCT_SIZE] where SIZE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                ProductSizeDTO size = new ProductSizeDTO(
                        rs.getString("SIZE_ID"),
                        rs.getInt("SIZE_NUM")
                );
                return size;
            }                    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(ProductSizeDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
