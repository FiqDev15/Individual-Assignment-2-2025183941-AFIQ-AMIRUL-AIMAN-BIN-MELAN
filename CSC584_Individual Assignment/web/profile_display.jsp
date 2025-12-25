<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="student.bean.ProfileBean" %>
<html>
<head>
    <title>Personal Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .header {
            background-color: #007bff;
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h2 {
            margin: 0;
            font-size: 28px;
            letter-spacing: 1px;
        }

        .content {
            padding: 30px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
            gap: 20px;
        }

        .field {
            flex: 1;
            min-width: 200px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            border-left: 5px solid #007bff;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .field:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.2);
        }

        .field.full {
            flex: 100%;
        }

        .label {
            font-weight: bold;
            font-size: 13px;
            color: #007bff;
            margin-bottom: 8px;
            display: block;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .value {
            font-size: 15px;
            color: #333;
        }

        .back-btn {
            display: block;
            width: fit-content;
            margin: 30px auto;
            padding: 12px 30px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            text-align: center;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.3s;
        }

        .back-btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
%>
<div class="container">
    <div class="header">
        <h2>Personal Profile</h2>
    </div>
    <div class="content">
<%
    if (profile != null) {
%>
        <div class="row">
            <div class="field">
                <span class="label">Full Name</span>
                <span class="value"><%= profile.getName() %></span>
            </div>
            <div class="field">
                <span class="label">Student ID</span>
                <span class="value"><%= profile.getStudentId() %></span>
            </div>
        </div>
        <div class="row">
            <div class="field">
                <span class="label">Program</span>
                <span class="value"><%= profile.getProgram() %></span>
            </div>
            <div class="field">
                <span class="label">Email</span>
                <span class="value"><%= profile.getEmail() %></span>
            </div>
        </div>
        <div class="row">
            <div class="field full">
                <span class="label">Hobbies</span>
                <span class="value"><%= profile.getHobbies() %></span>
            </div>
        </div>
        <div class="row">
            <div class="field full">
                <span class="label">Introduction</span>
                <span class="value"><%= profile.getIntro() %></span>
            </div>
        </div>
<%
    } else {
%>
        <p style="text-align:center; color:#555;">No profile data found.</p>
<%
    }
%>
        <a class="back-btn" href="profile_form.html">Back to Form</a>
    </div>
</div>
</body>
</html>
