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

    @Override
    public boolean create(ProductMaterialDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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


    @Override
    public boolean update(ProductMaterialDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ProductMaterialDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
