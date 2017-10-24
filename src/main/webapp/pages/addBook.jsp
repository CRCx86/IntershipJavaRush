<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Добавить новую книгу</title>
</head>
<body>
<center>
<form:form modelAttribute="book" action="/books" method="post">
    <table>
        <tbody>
        <tr>
            <td>Title</td>
            <td><form:input path="title"/></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><form:input path="description"/></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><form:input path="author"/></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><form:input path="isbn"/></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><form:input path="printYear"/></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><form:input path="readAlready"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit"/></td>
        </tr>
        </tbody>
    </table>

</form:form>
</center>

</body>
</html>