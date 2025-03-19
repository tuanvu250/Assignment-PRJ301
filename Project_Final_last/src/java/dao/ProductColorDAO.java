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
public class ProductColorDAO implements IDAO<ProductColorDTO, String>{

    @Override
    public boolean create(ProductColorDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProductColorDTO> readAll() {
        String sql = "select * from [dbo].[PRODUCT_COLOR]";
        List<ProductColorDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ProductColorDTO color = new  ProductColorDTO(
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


    @Override
    public boolean update(ProductColorDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ProductColorDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
