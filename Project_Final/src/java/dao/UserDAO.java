package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

public class UserDAO implements IDAO<UserDTO, String> {

    public String autoCreateID() {
        String sql = "SELECT * FROM [dbo].[Users] ";
        int count = 1;
        String usID = "USR";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usID + String.format("%03d", count);
    }

    public boolean createAdmin(UserDTO Object) {
        String sql = "INSERT INTO [dbo].[Users] ([userId], [usname], [password], [fullname], [email], [phone], [role]) VALUES (?, ?, ?, ?, ?, ?, ?))";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateID());
            ps.setString(2, Object.getUserName());
            ps.setString(3, Object.getPassword());
            ps.setString(4, Object.getFullName());
            ps.setString(5, Object.getEmail());
            ps.setInt(6, Object.getPhone_number());
            ps.setString(7, Object.getRole());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     public boolean createUser(UserDTO Object) {
        String sql = "INSERT INTO [dbo].[Users] ([userId], [usname], [password], [fullname], [email], [phone], [role]) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, autoCreateID());
            ps.setString(2, Object.getUserName());
            ps.setString(3, Object.getPassword());
            ps.setString(4, Object.getFullName());
            ps.setString(5, Object.getEmail());
            ps.setInt(6, Object.getPhone_number());
            ps.setString(7, "user");
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UserDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public UserDTO readByUSName(String usName) {
        String sql = "SELECT * FROM [dbo].[Users] WHERE [usname] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, usName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO us = new UserDTO(rs.getString("userId"),
                        rs.getString("usname"),
                        rs.getString("password"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getInt("phone"),
                        rs.getString("role"));
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean create(UserDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
