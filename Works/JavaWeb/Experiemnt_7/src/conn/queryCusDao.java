package conn;

import beans.Student2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class queryCusDao {
    public List<Student2> query(Student2 student) throws SQLException {
        // 连接数据库
        Dao dao = new Dao();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Student2> students = new ArrayList<>();
        try {
            conn = dao.connection();
            ps = conn.prepareStatement("SELECT * FROM student WHERE name LIKE ?");
            ps.setString(1, "%" + student.getName() + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Student2 student1 = new Student2();
                student1.setId(rs.getInt("id"));
                student1.setName(rs.getString("name"));
                student1.setAge(rs.getInt("age"));
                students.add(student1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            rs.close();
        }
        return students;
    }
}
