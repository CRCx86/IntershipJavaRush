<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }
        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }
        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }
        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>

<br/>
<br/>

<center>
<h1>Books List</h1>

    <form action="searchBook">
        <div class="row">
            <div class="col-md-2">Search book by title:</div>
            <div class="col-md-2"><input type="text" name="searchName" id="searchName"
                                         placeholder="type title here.."></div>
            <div class="col-md-2"><input class="btn btn-xs" type='submit' value='Search'/></div>
        </div>
    </form>

    <table class="tg">
    <tr><td><a href="/books/create" title="Добавить новую книгу">Add book</a></td></tr>

    <tr>
    <th width="80">id</th>
    <th width="120">title</th>
    <th width="120">description</th>
    <th width="120">author</th>
    <th width="120">isbn</th>
    <th width="120">print year</th>
    <th width="120">read already</th>
    <th width="60">delete</th>
    <th width="60">edit</th>
    </tr>

    <c:forEach items="${listBooks}" var="book">

        <tr>

            <td><c:out value="${book.id}" /></td>
            <td><c:out value="${book.title}" /></td>
            <td><c:out value="${book.description}" /></td>
            <td><c:out value="${book.author}" /></td>
            <td><c:out value="${book.isbn}" /></td>
            <td><c:out value="${book.printYear}" /></td>
            <td><c:out value="${book.readAlready}" /></td>

            <td><form action="/books" method="post">
                <input type="hidden" name="id" value="<c:out value="${book.id}" />"/>
                <input type="hidden" name="_method" value="delete">
                <a href="#" title="delete book" onclick="this.parentNode.submit();"> Delete</a>
            </form></td>

            <td><form action="/books" method="post">
                <a href="/books/<c:out value="${book.id}"/>" title="change book"> Edit</a>
            </form></td>
        </tr>

    </c:forEach>
    </table>

    <c:url value="/books" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>

    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/books" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:url value="/books" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>

    <c:url value="/books" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>

    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>

</center>
</body>
</html>