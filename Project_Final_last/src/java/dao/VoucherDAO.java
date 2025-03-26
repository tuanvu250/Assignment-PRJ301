/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.VoucherDTO;
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
public class VoucherDAO implements IDAO<VoucherDTO, String> {

    @Override
    public boolean create(VoucherDTO voucher) {
        String sql = "INSERT INTO [dbo].[VOUCHER] (ID, CODE, DISCOUNT, QUANTITY, START_DATE, END_DATE, STATUS) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucher.getId());
            ps.setString(2, voucher.getCode());
            ps.setDouble(3, voucher.getDiscount());
            ps.setInt(4, voucher.getQuantity());
            ps.setDate(5, voucher.getStart_date());
            ps.setDate(6, voucher.getEnd_date());
            ps.setString(7, voucher.getStatus());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    @Override
    public List<VoucherDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public VoucherDTO readById(String id) {
        String sql = "SELECT * FROM [dbo].[VOUCHER] WHERE ID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new VoucherDTO(
                        rs.getString("ID"),
                        rs.getString("CODE"),
                        rs.getDouble("DISCOUNT"),
                        rs.getInt("QUANTITY"),
                        rs.getDate("START_DATE"),
                        rs.getDate("END_DATE"),
                        rs.getString("STATUS")
                );
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    @Override
    public boolean update(VoucherDTO voucher) {
        String sql = "UPDATE [dbo].[VOUCHER] "
                + "SET CODE = ?, DISCOUNT = ?, QUANTITY = ?, START_DATE = ?, END_DATE = ?, STATUS = ? "
                + "WHERE ID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucher.getCode());
            ps.setDouble(2, voucher.getDiscount());
            ps.setInt(3, voucher.getQuantity());
            ps.setDate(4, voucher.getStart_date());
            ps.setDate(5, voucher.getEnd_date());
            ps.setString(6, voucher.getStatus());
            ps.setString(7, voucher.getId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM [dbo].[VOUCHER] WHERE ID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0; // Trả về true nếu xóa thành công
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public String autoCreateID() {
        String sql = "SELECT MAX(ID) FROM [dbo].[VOUCHER] WHERE ID LIKE 'V%'";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String maxId = rs.getString(1);
                if (maxId != null) {
                    int num = Integer.parseInt(maxId.substring(1));
                    return String.format("V%03d", num + 1);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "V001";
    }

    public boolean checkVoucher(String code) {
        String sql = "SELECT QUANTITY, STATUS "
                + " FROM [dbo].[VOUCHER] WHERE CODE = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt("QUANTITY") == 0) {
                    return false;
                }
                if (rs.getString("STATUS").equals("EXPIRED")) {
                    return false;
                }
                return true;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public double getDiscount(String code) {
        String sql = "SELECT DISCOUNT "
                + " FROM [dbo].[VOUCHER] WHERE CODE = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble("DISCOUNT");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean applyVoucher(String code) {
        String sql = "UPDATE [dbo].[VOUCHER] SET QUANTITY = QUANTITY - 1 "
                + " WHERE CODE = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<VoucherDTO> searchByCode(String keyword) {
        String sql = "SELECT * FROM [dbo].[VOUCHER] WHERE CODE LIKE ?";
        List<VoucherDTO> vouchers = new ArrayList<>();

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%"); // Tìm kiếm mờ theo keyword
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                VoucherDTO voucher = new VoucherDTO(
                        rs.getString("ID"),
                        rs.getString("CODE"),
                        rs.getDouble("DISCOUNT"),
                        rs.getInt("QUANTITY"),
                        rs.getDate("START_DATE"),
                        rs.getDate("END_DATE"),
                        rs.getString("STATUS")
                );
                vouchers.add(voucher);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vouchers;
    }
    
    public int getTotalVoucher(){
        String sql = "SELECT COUNT(*) FROM [dbo].[VOUCHER]";
        int total = 0;

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ShoesProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return total;
    }
}
