<%-- THẻ này để bật EL trong JSP --%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="Personal Profile Template">
  <meta name="keywords" content="Profile, Portfolio, Personal, HTML">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Personal Profile | Template</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
  <link rel="icon" href="/assets/img/logo.webp">
  <!-- Css Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/style.css" type="text/css">

  <style>
    .profile-section {
      margin-top: 50px;
    }

    .profile-card {
      box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      padding: 20px;
    }

    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      cursor: pointer;
    }

    .edit-profile-btn {
      float: right;
      margin-top: -30px;
    }

    .form-control {
      margin-bottom: 15px;
      color: #0b0b0b !important;
    }

    .profile-info {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .profile-info h3 {
      margin-bottom: 0;
    }

    .edit-form {
      display: none;
    }

    /* Popup Modal */
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.5);
      padding-top: 60px;
    }

    .modal-content {
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 40%;
      border-radius: 10px;
    }

    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
    .profile-info-data {
      text-align: left;
      margin-top: 20px;
    }

  </style>
</head>

<body>
<!-- Header Section Begin -->
<%@ include file="header.jsp" %>
<!-- Header End -->

<!-- Profile Section Begin -->
<section class="profile-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2">
        <div class="profile-card text-center">
<%--            Description--%>
            <h2>Delete Account</h2>
            <p>Are you sure you want to delete your account? This action cannot be undone.</p>
            <div>

                <form action="/delete-account" method="post">
                <div class="form-group">
                    <label for="password">Enter Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-danger">Delete Account</button>
                </form>
            </div>


        </div>
      </div>
    </div>
  </div>
</section>
<!-- Profile Section End -->

<!-- Avatar Change Modal -->
<div id="avatarModal" class="modal">
  <div class="modal-content">
    <span class="close" id="closeModal">&times;</span>
    <h4>Change Avatar</h4>
    <form method="post" action="/change-avatar" enctype="multipart/form-data">
      <div class="form-group">
        <label for="avatarUpload">Upload New Avatar</label>
        <input type="file" class="form-control-file" id="avatarUpload" name="avatarFile">
      </div>
      <button type="submit" class="btn btn-primary">Upload</button>
    </form>
  </div>
</div>

<%@ include file="footer.jsp" %>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>


</body>

</html>
