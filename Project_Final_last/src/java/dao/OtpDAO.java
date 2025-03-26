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
public class OtpDAO {

    // Kiểm tra OTP có hợp lệ không (chưa hết hạn)
    public boolean verifyOTP(String username, String otp) {
        try (Connection conn = DBUtils.getConnection()) {
            // Chỉ lấy OTP hợp lệ trong 5 phút
            String sql = "SELECT TOP 1 CREATED_AT FROM OTP_CODES "
                    + "WHERE USER_NAME = ? AND OTP = ? "
                    + "AND DATEDIFF(MINUTE, CREATED_AT, GETDATE()) <= 5 "
                    + "ORDER BY CREATED_AT DESC";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, otp);
            ResultSet rs = stmt.executeQuery();

            return rs.next(); // Nếu có kết quả thì OTP hợp lệ
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void deleteOTP(String username) {
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "DELETE FROM OTP_CODES WHERE USER_NAME = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String autoCreateID() {
        String sql = "SELECT MAX(ID) FROM [dbo].[OTP_CODES] WHERE ID LIKE 'O%'";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String maxId = rs.getString(1);
                if (maxId != null) {
                    int num = Integer.parseInt(maxId.substring(1));
                    return String.format("O%03d", num + 1);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(OtpDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "O001";
    }

    public void saveOTP(String username, String otp) {
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "INSERT INTO OTP_CODES (ID, USER_NAME, OTP, CREATED_AT) VALUES (?, ?, ?, GETDATE())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            String id = autoCreateID();
            stmt.setString(1, id);
            stmt.setString(2, username);
            stmt.setString(3, otp);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
