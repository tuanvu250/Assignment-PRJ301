package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

public class ShoesImageDAO {
    public static boolean insertImage(String shoesId, String imageUrl, int imageOrder) {
        String sql = "INSERT INTO SHOES_IMAGE (SHOES_ID, IMAGE_URL, IMAGE_ORDER) VALUES (?, ?, ?)";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, shoesId);
            ps.setString(2, imageUrl);
            ps.setInt(3, imageOrder);
            ps.executeUpdate();

            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
