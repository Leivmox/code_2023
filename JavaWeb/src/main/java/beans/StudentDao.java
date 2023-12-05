package beans;

import conn.Dao;

import javax.swing.plaf.nimbus.State;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Stack;

public class StudentDao {
    public ArrayList queryAllStudents() throws Exception {
        Connection conn = null;
        ArrayList students = new ArrayList();
        try {
            Dao dao = new Dao();
            conn = dao.connection();
            String sql = "SELECT STUNO,STUNAME from T_STUDENT";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                Student student = new Student();
                student.setStuno(rs.getString("STUNO"));
                student.setStuname(rs.getString("STUNAME"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;

                }
            } catch (Exception exception) {
            }
            return students;
        }

    }
}
