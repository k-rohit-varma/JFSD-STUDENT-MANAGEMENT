<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Attendance</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f9f9f9;
    }
    h1 {
        color: #333;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ccc;
        text-align: center;
    }
    th {
        background-color: #007BFF;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<h1>Students list for  <c:out value="${ename}"></c:out></h1>
	
<c:if test="${not empty studentList}">
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${studentList}" var="studentId">
                <tr>
                    <td><c:out value="${studentId}"></c:out></td>
                    <td>
                            <input type="hidden" name="eventId" value="<c:out value='${ename}'/>">
                            <input type="hidden" name="studentId" value="<c:out value='${studentId}'/>">
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
<c:if test="${empty studentList}">
    <p>No students are registered for this event.</p>
</c:if>

</body>
</html>
