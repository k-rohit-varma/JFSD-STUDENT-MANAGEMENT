<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Organizer</title>
<style>
    /* General Reset */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fa;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* Header Styling */
    h1 {
        text-align: center;
        color: #007bff;
        margin-bottom: 30px;
        font-size: 2em;
    }

    /* Form Styling */
    form {
        background-color: #fff;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 500px;
        text-align: left;
    }

    /* Form Group Styling */
    label {
        font-size: 14px;
        font-weight: bold;
        color: #555;
        display: block;
        margin-bottom: 8px;
    }

    input[type="text"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        background-color: #f7f9fc;
    }

    input[type="text"]:focus {
        outline: none;
        border-color: #007bff;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 6px;
        padding: 12px 20px;
        font-size: 16px;
        cursor: pointer;
        width: 100%;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    /* Optional Responsive Design */
    @media (max-width: 480px) {
        form {
            padding: 20px;
            max-width: 90%;
        }

        h1 {
            font-size: 1.8em;
        }
    }
</style>
</head>
<body>
   
    <form method="post" action="updateOrganizerData">
        <input type="hidden" value="${organizer.id}" name="id">

        <div>
            <label>Update Name:</label>
            <input type="text" value="${organizer.name}" name="name">
        </div>

        <div>
            <label>Update Password:</label>
            <input type="text" value="${organizer.password}" name="pass">
        </div>

        <div>
            <label>Update Email:</label>
            <input type="text" value="${organizer.email}" name="email">
        </div>

        <div>
            <label>Update Phone Number:</label>
            <input type="text" value="${organizer.phNumber}" name="phno">
        </div>

        <div>
            <label>Update Gender:</label>
            <input type="text" value="${organizer.gender}" name="gender">
        </div>

        <div>
            <input type="submit" value="Save">
        </div>
    </form>
</body>
</html>
