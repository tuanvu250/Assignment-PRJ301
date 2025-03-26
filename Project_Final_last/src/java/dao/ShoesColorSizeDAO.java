package dao;

import dto.ShoesColorSizeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

public class ShoesColorSizeDAO {

    public List<ShoesColorSizeDTO> readAllByShoesID(String shoesid) {
        String sql = "SELECT DISTINCT SHOES_ID, COLOR_ID FROM [dbo].[SHOES_COLOR_SIZE] WHERE SHOES_ID = ?";
        List<ShoesColorSizeDTO> list = new ArrayList<>();

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shoesid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ShoesColorSizeDTO shoes = new ShoesColorSizeDTO(
                        rs.getString("SHOES_ID"),
                        rs.getString("COLOR_ID"),
                        null,
                        0
                );
                list.add(shoes);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public boolean existsShoesColor(String shoesId, String colorId) {
        String sql = "SELECT COUNT(*) FROM [dbo].[SHOES_COLOR_SIZE] WHERE SHOES_ID = ? AND COLOR_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shoesId);
            ps.setString(2, colorId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insertShoesColor(String shoesId, String colorId, String sizeId, int stock) {
        String sql = "INSERT INTO [dbo].[SHOES_COLOR_SIZE] VALUES (?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shoesId);
            ps.setString(2, colorId);
            ps.setString(3, sizeId);
            ps.setInt(4, stock);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateSizeStock(String shoesId, String colorId, String sizeId, int stock) {
        String sql = "UPDATE [dbo].[SHOES_COLOR_SIZE] SET STOCK = ? WHERE SHOES_ID = ? AND COLOR_ID = ? AND SIZE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setString(2, shoesId);
            ps.setString(3, colorId);
            ps.setString(4, sizeId);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int getStock(String shoesId, String colorId, String sizeId) {
        String sql = "SELECT STOCK FROM [dbo].[SHOES_COLOR_SIZE] WHERE SHOES_ID = ? AND COLOR_ID = ? AND SIZE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shoesId);
            ps.setString(2, colorId);
            ps.setString(3, sizeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ShoesColorSizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean delete(String shoesid, String colorId) {
        String sql = "DELETE FROM SHOES_COLOR_SIZE WHERE SHOES_ID = ? AND COLOR_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shoesid);
            ps.setString(2, colorId);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
