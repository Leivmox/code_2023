package conn;

import java.sql.*;

public class Dao {
    String serverIp = "localhost";//主机名，一般默认localhost
    String databaseName = "myweb";//数据库的名字
    String userName = "root";
    String pwd = "123456";//数据库密码
    String jdbcUrl = "jdbc:mysql://" + serverIp + ":3306/" + databaseName + "?serverTimezone=Asia/Shanghai&useSSL=false&characterEncoding=UTF-8";
    Connection con = null;

    public Connection connection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //链接数据库
            con = DriverManager.getConnection(jdbcUrl, userName, pwd);
            this.con = con;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;//返回Connection对象
    }
}
