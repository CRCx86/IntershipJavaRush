
<%--
  Created by IntelliJ IDEA.
  User: a.zinov
  Date: 23.10.2017
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change book's data</title>
</head>
<body>
<center>
<form:form modelAttribute="book" action="/books" method="put">
    <form:hidden path="id"/>
    <table>
        <tbody>
        <tr>
            <td>Title</td>
            <td><form:input path="title" value = "${userObject.title}"/></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><form:input path="description" value = "${userObject.description}"/></td>
        </tr>
        <tr>
            <td>Author</td>
            <td><form:input path="author" value = "${userObject.author}"/></td>
        </tr>
        <tr>
            <td>ISBN</td>
            <td><form:input path="isbn" value = "${userObject.isbn}"/></td>
        </tr>
        <tr>
            <td>Print year</td>
            <td><form:input path="printYear" value = "${userObject.printYear}" onchange="return showChangeYear();"/></td>
        </tr>
        <tr>
            <td>Read already</td>
            <td><form:input path="readAlready" value = "${userObject.readAlready}" onclick="return sumbitEditForm();"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit"/></td>
        </tr>
        </tbody>
    </table>
</form:form>
</center>

<script type="text/javascript">
    function showChangeYear() {
        alert($('#title').val().trim());
    }

    function sumbitEditForm() {
        alert($('#description').val().trim());
    }
</script>

</body>
</html>
