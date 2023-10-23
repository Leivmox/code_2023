package conntest;
import conn.Dao;//包含Dao类
import java.sql.*;
public class DaoTests {
    public static void main(String args[]){
        Dao dao = new Dao();//创建Dao对象
        Connection con = dao.connection();//获得连接对象
        String tableName = "test";//数据库中的一个表的表名
        if (con != null)
            System.out.println("数据库连接成功！");
        else
            System.out.print("数据库连接失败");
        try {
            Statement statement = con.createStatement();
            String sql = "SELECT * FROM test";//定义一个查询语句
            ResultSet rs = statement.executeQuery(sql);//执行查询语句
            while (rs.next()){
                System.out.print(" ID："+rs.getString("id"));
                System.out.print(" 姓名："+rs.getString("name"));
                System.out.print(" 年龄："+rs.getString("age"));
                System.out.println();
            }
        }catch (Exception e){
            System.out.print("异常："+e);
        }
    }
}
