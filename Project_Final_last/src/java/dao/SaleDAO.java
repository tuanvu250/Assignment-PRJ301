/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class SaleDAO {
    public double saleNum(String id) {
        String sql = "SELECT SALE_NUM FROM [dbo].[PRODUCT_SALE]"
                + " WHERE SALE_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getDouble("SALE_NUM");
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
