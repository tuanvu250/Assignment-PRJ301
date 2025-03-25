/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CartDTO;
import dto.OrderDTO;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
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
public class OrderDAO implements IDAO<OrderDTO, String>{

    public String autoCreateID() {
        String sql = "SELECT MAX(ORDER_ID) FROM [dbo].[ORDERS] WHERE ORDER_ID LIKE 'OR%'";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String maxId = rs.getString(1);
                if (maxId != null) {
                    int num = Integer.parseInt(maxId.substring(2)); // Lấy số từ ID
                    return String.format("OR%03d", num + 1);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductColorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "OR001"; 
    }
    
    public boolean createOD(String orderId, CartDTO cart) {
        String sql = "INSERT INTO [dbo].[ORDERS_DETAIL] "
                + "(ORDER_ID, SHOES_ID, COLOR_ID, SIZE_ID, QUANTITY, PRICE) "
                        + " VALUES (?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, orderId);
            ps.setString(2, cart.getShoes_id());
            ps.setString(3, cart.getColor_id());
            ps.setString(4, cart.getSize_id());
            ps.setInt(5, cart.getQuantity());
            ps.setBigDecimal(6, cart.getPrice());
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    @Override
    public boolean create(OrderDTO order) {
        String sql = "INSERT INTO [dbo].[ORDERS] "
                + " ([ORDER_ID], [FULLNAME], "
                + "[PHONE], [EMAIL], [DATE_ORDERED], "
                + "[STATUS], [ADDRESS], [METHOD_PAY], "
                + "[SUBTOTAL], [DISCOUNT],[TOTAL_PRICE]) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, order.getOrder_id());
            ps.setString(2, order.getFullName());
            ps.setString(3, order.getPhone());
            ps.setString(4, order.getEmail());
            ps.setDate(5, order.getDate_ordered());
            ps.setString(6, order.getStatus());
            ps.setString(7, order.getAddress());
            ps.setString(8, order.getMethod_pay());
            ps.setBigDecimal(9, order.getSubtotal());
            ps.setBigDecimal(10, order.getDiscount());
            ps.setBigDecimal(11, order.getTotal_price());
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<OrderDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public OrderDTO readById(String id) {
        String sql = "SELECT * FROM [dbo].[ORDERS] WHERE ORDER_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                OrderDTO order = new OrderDTO(
                        rs.getString("ORDER_ID"),
                        rs.getString("FULLNAME"),
                        rs.getString("PHONE"),
                        rs.getString("EMAIL"),
                        rs.getDate("DATE_ORDERED"),
                        rs.getString("STATUS"),
                        rs.getString("ADDRESS"),
                        rs.getString("METHOD_PAY"),
                        rs.getBigDecimal("SUBTOTAL"),
                        rs.getBigDecimal("DISCOUNT"),
                        rs.getBigDecimal("TOTAL_PRICE")
                );
                return order;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(OrderDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<CartDTO> readAllOderDetail(String orderId) {
        String sql = "SELECT CD.ORDER_ID, SHOES_ID, COLOR_ID, SIZE_ID, QUANTITY, PRICE"
                + " FROM [dbo].[ORDERS_DETAIL] CD JOIN [dbo].[ORDERS] C "
                + " ON CD.ORDER_ID = C.ORDER_ID"
                + " WHERE C.ORDER_ID = ?";
        List<CartDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDTO cart = new CartDTO(
                        rs.getString("ORDER_ID"),
                        rs.getString("SHOES_ID"),
                        rs.getString("COLOR_ID"),
                        rs.getString("SIZE_ID"),
                        rs.getInt("QUANTITY"),
                        rs.getBigDecimal("PRICE")
                );
                list.add(cart);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
