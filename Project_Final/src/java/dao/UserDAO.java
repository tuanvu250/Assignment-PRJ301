/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
 * @author Dell
 */
public class UserDAO implements IDAO<UserDTO, String> {

    public String autoCreateUserID() {
        List<UserDTO> list = readAll();
        if (list.isEmpty()) {
            return "US001";
        }
        int maxID = 0;
        for (UserDTO user : list) {
            String currentID = user.getUser_id();
            int numPart = Integer.parseInt(currentID.substring(2));
            if (numPart > maxID) {
                maxID = numPart;
            }
        }
        return String.format("US%03d", maxID + 1);
    }

    @Override
    public boolean create(UserDTO Object) {
        String sql = "INSERT INTO [dbo].[USERS] (USER_ID, FULLNAME, USER_NAME, PASSWORD, EMAIL, PHONE, ROLE_ID)"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateUserID());
            ps.setString(2, Object.getFull_name());
            ps.setString(3, Object.getUser_name());
            ps.setString(4, Object.getPassword());
            ps.setString(5, Object.getEmail());
            ps.setString(6, Object.getPhone_number());
            ps.setInt(7, Object.getRole_id());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<UserDTO> readAll() {
        String sql = "SELECT * FROM [dbo].[USERS]";
        List<UserDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO us = new UserDTO(rs.getString("USER_ID"),
                        rs.getString("FULLNAME"),
                        rs.getString("USER_NAME"),
                        rs.getString("PASSWORD"),
                        rs.getString("EMAIL"),
                        rs.getString("PHONE"),
                        rs.getInt("ROLE_ID"));
                list.add(us);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public UserDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public UserDTO readByUsName(String usName) {
        String sql = "SELECT * FROM [dbo].[USERS] WHERE [USER_NAME] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, usName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO us = new UserDTO(rs.getString("USER_ID"),
                        rs.getString("FULLNAME"),
                        rs.getString("USER_NAME"),
                        rs.getString("PASSWORD"),
                        rs.getString("EMAIL"),
                        rs.getString("PHONE"),
                        rs.getInt("ROLE_ID"));
                return us;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(UserDTO object) {
        String sql = "UPDATE [dbo].[USERS] "
                + "SET [FULLNAME] = ?, [USER_NAME] = ?, [PASSWORD] = ?, [EMAIL] = ?, [PHONE] = ?, [ROLE_ID] = ? "
                + "WHERE [USER_ID] = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, object.getFull_name());
            ps.setString(2, object.getUser_name());
            ps.setString(3, object.getPassword());
            ps.setString(4, object.getEmail());
            ps.setString(5, object.getPhone_number());
            ps.setInt(6, object.getRole_id());
            ps.setString(7, object.getUser_id());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
