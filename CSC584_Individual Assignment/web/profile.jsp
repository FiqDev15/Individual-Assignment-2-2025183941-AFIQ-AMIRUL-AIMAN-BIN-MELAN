<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="student.bean.ProfileBean" %>

<%
    ProfileBean p = (ProfileBean) session.getAttribute("profile");
    if (p == null) {
        response.sendRedirect("profile_form.html");
        return;
    }
    session.removeAttribute("profile"); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Saved</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f7;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #0066cc;
            margin-bottom: 30px;
        }
        .field {
            background: #f8f9fa;
            padding: 20px;
            margin-bottom: 15px;
            border-left: 5px solid #0066cc;
            border-radius: 8px;
        }
        .label {
            font-weight: bold;
            color: #0066cc;
            display: block;
            text-transform: uppercase;
            font-size: 12px;
            margin-bottom: 5px;
            letter-spacing: 0.5px;
        }
        .value {
            color: #333;
            font-size: 15px;
        }
        .button-bar {
            text-align: center;
            margin-top: 30px;
        }
        .button-bar a {
            display: inline-block;
            margin: 0 10px;
            padding: 12px 30px;
            border-radius: 50px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            background-color: #0066cc;
            transition: 0.3s;
        }
        .button-bar a:hover {
            background-color: #002041;
        }
        .button-add {
            background-color: #28a745; 
        }
        .button-add:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Profile Saved Successfully</h2>

        <div class="field">
            <span class="label">Full Name</span>
            <span class="value"><%= p.getName() %></span>
        </div>
        <div class="field">
            <span class="label">Student ID</span>
            <span class="value"><%= p.getStudentId() %></span>
        </div>
        <div class="field">
            <span class="label">Program</span>
            <span class="value"><%= p.getProgram() %></span>
        </div>
        <div class="field">
            <span class="label">Email</span>
            <span class="value"><%= p.getEmail() %></span>
        </div>
        <div class="field">
            <span class="label">Hobbies</span>
            <span class="value"><%= p.getHobbies() %></span>
        </div>
        <div class="field">
            <span class="label">Introduction</span>
            <span class="value"><%= p.getIntro() %></span>
        </div>

        <div class="button-bar">
            <a class="button-add" href="profile_form.html">Add New Profile</a>
            <a href="viewProfiles.jsp">View All Profiles</a>
        </div>
    </div>
</body>
</html>
