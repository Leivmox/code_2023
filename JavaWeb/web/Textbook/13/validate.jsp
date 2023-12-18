<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/12/12
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.imageio.ImageIO" pageEncoding="UTF-8" %>

<html>

<head>
    <title>validate</title>
</head>
<body>
<%
//    response.setHeader("Content-Type", "text/html;charset=UTF-8")
    response.setHeader("Cache-Control", "no-cache");
    response.setContentType("image/jpeg");
    int width = 60, height = 20;
    BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

    Graphics g = image.getGraphics();

    g.setColor(new Color(200, 200, 200));

    g.fillRect(0, 0, width, height);

    Random rnd = new Random();
    int randNum = rnd.nextInt(8999) + 1000;
    String randStr = String.valueOf(randNum);
    session.setAttribute("randStr", randStr);
    g.setColor(Color.black);
    g.setFont(new Font("", Font.PLAIN, 20));
    g.drawString(randStr,10,17);

    for (int i = 0; i < 100; i++) {
        int x = rnd.nextInt(width);
        int y = rnd.nextInt(height);
        g.drawOval(x, y, 1, 1);
    }

    ImageIO.write(image, "JPEG", response.getOutputStream());
    out.clear();
    out = pageContext.pushBody();
%>
</body>
</html>