<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Random rand = new Random();
    int red = (int) (255 * rand.nextFloat());
    int green = (int) (255 * rand.nextFloat());
    int blue = (int) (255 * rand.nextFloat());
%>
<H1 style="color:rgb(<%= red %>, <%= green %>, <%= blue %>)">random color</H1>
</body>
</html>