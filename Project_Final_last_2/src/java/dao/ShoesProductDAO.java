/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ShoesProductDTO;
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
public class ShoesProductDAO implements IDAO<ShoesProductDTO, String> {

    @Override
    public boolean create(ShoesProductDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ShoesProductDTO> readAll() {
        return null;
    }

    public List<ShoesProductDTO> searchShoes(String gender, String status, String style, String productLine, String priceMin, String priceMax, String material, String color) {
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
        System.out.println(sql);
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
                        rs.getInt("PRICE"),
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
    public UserDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(ShoesProductDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
