<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f8fb;
        color: #333;
    }

    h1 {
        text-align: center;
        margin-top: 20px;
        font-size: 28px;
        color: #34495e;
        font-weight: bold;
    }

    .profile-container {
        max-width: 500px;
        margin: 40px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border: 1px solid #dfe6ed;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #2c3e50;
    }

    .profile-data {
        margin-bottom: 15px;
        font-size: 16px;
        color: #555;
    }

    button {
        padding: 10px 20px;
        background-color: #3498db;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }

    button:hover {
        background-color: #2c82c9;
    }

    a {
        text-decoration: none;
    }

    a button {
        display: block;
        margin: 20px auto;
    }
</style>
</head>
<body>
    <h1>Student Profile</h1>
    <div class="profile-container">
        <div class="profile-data">
            Name : <c:out value="${stu.name}" />
        </div>
        <div class="profile-data">
           Email :<c:out value="${stu.email}" />
        </div>
        <div class="profile-data">
            Phone Number : <c:out value="${stu.phNumber}"/>
        </div>
        <div class="profile-data">
            Gender : <c:out value="${stu.gender}" />
        </div>
        <div class="profile-data">
            Points :<c:out value="${stu.points}" />
        </div>
        <a href="editProfile?id=${stu.id}">
            <button>Edit</button>
        </a>
    </div>
</body>
</html>
