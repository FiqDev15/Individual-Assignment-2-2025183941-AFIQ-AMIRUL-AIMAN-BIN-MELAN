<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>All Student Profiles</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f7;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #0066cc;
            margin-bottom: 30px;
        }

        .add-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 25px;
            background-color: #0066cc;
            color: #fff;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .add-btn:hover {
            background-color: #002041;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #0066cc;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 14px;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #e1f0ff;
        }

        .delete-btn {
            padding: 6px 12px;
            background-color: #cc0000;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-size: 13px;
            transition: 0.3s;
        }

        .delete-btn:hover {
            background-color: #800000;
        }
    </style>
</head>
<body>

<h2>All Student Profiles</h2>

<a class="add-btn" href="profile_form.html">Add New Profile</a>

<table>
    <tr>
        <th>Name</th>
        <th>Student ID</th>
        <th>Program</th>
        <th>Email</th>
        <th>Hobbies</th>
        <th>Introduction</th>
        <th>Action</th>
    </tr>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/student_profiles","app","app");
    String sql = "SELECT * FROM PROFILE";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("studentId") %></td>
        <td><%= rs.getString("program") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("hobbies") %></td>
        <td><%= rs.getString("intro") %></td>
        <td>
            <a class="delete-btn" href="DeleteProfileServlet?id=<%= rs.getInt("id") %>"
               onclick="return confirm('Delete this profile?');">Delete</a>
        </td>
    </tr>
<%
    }
    rs.close(); ps.close(); con.close();
%>
</table>

</body>
</html>
