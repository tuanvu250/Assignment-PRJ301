package dao;

import dto.RoleDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

public class RoleDAO implements IDAO<RoleDTO, Integer> {

    @Override
    public boolean create(RoleDTO Object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<RoleDTO> readAll() {
        String sql = "SELECT * FROM [dbo].[USER_ROLE]";
        List<RoleDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                 RoleDTO rdto = new RoleDTO(rs.getInt("ROLE_ID"),
                        rs.getString("ROLE_NAME"));
                 list.add(rdto);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public RoleDTO readById(Integer id) {
        String sql = "SELECT * FROM [dbo].[USER_ROLE] WHERE [ROLE_ID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RoleDTO rdto = new RoleDTO(rs.getInt("ROLE_ID"),
                        rs.getString("ROLE_NAME"));
                return rdto;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public RoleDTO readByRoleName(String roleName) {
        String sql = "SELECT * FROM [dbo].[USER_ROLE] WHERE [ROLE_NAME] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, roleName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RoleDTO rdto = new RoleDTO(rs.getInt("ROLE_ID"),
                        rs.getString("ROLE_NAME"));
                return rdto;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(RoleDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
