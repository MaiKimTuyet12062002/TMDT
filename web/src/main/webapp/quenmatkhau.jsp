<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ntt Store</title>
    <link rel="stylesheet" href="css/QuenMK.css">
</head>
<body>
<c:set var="erro" value="${requestScope.erro}"/>
<div class="logreg-forms">
    <h4>Nhập email của bạn</h4>
    <label style="color: red;margin-left: 5%;font: bolder 20px "Helvetica Neue", Helvetica, Arial, sans-serif;">${erro}</label>
    <form action="forget" method="post">
        <input type="email"  name="email" class="form-control" placeholder="Nhập email" ><br>
        <input type="submit" class="btn" value="Gửi">
<%--        <button class="btn">Gửi </button>--%>
    </form>
</div>

</body>
</html>