package conn;

import beans.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDao {
    public boolean login(Customer customer) throws SQLException {
        // 连接数据库
        Dao dao = new Dao();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = dao.connection();
            ps = conn.prepareStatement("SELECT * FROM customer WHERE studentId = ? AND password = ?");
            ps.setString(1, customer.getStudentId());
            ps.setString(2, customer.getPassword());
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            conn.close();

        }
        return false;
    }
}
