<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add New Size - SB Admin 2</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
</head>

<body id="page-top">
<div id="wrapper">
    <%@ include file="navbar.jsp" %>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
            </nav>

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <h1 class="h3 mb-4 text-gray-800">Chat Manager</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Chat</h6>
                    </div>
                    <div class="card-body">
                        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                                <h1 class="h2">Chat with Users</h1>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="list-group" id="userList">
                                        <c:forEach items="${chatRoomList}" var="chatRoom">
                                            <a href="#" class="list-group-item list-group-item-action user-link" data-token="${chatRoom.token}" data-userid="${chatRoom.user.userID}">
                                                <img src="${chatRoom.user.avatar}" class="rounded-circle mr-2" alt="${chatRoom.user.name}" width="30" height="30">
                                                    ${chatRoom.user.name}
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 id="chatWith">Chat with User</h5>
                                        </div>
                                        <div class="card-body chat-box" id="chatBox">
                                            <!-- Chat messages will be loaded here -->
                                        </div>
                                        <div class="card-footer">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Type a message" id="chatInput">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="button" id="sendBtn"><i class="fas fa-paper-plane"></i> Send</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->

        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copywright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages -->
<script src="js/sb-admin-2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>

<script>
    $(document).ready(function(){
        let userID;
        let token;
        <%
            if (session.getAttribute("user") != null) {
        %>
        userID = ${sessionScope.user.userID};
        token = "${sessionScope.token}";

        <%
            } else {
        %>
        userID = null;
        <%
            }
        %>
        let chatRoomID = null;
        let websocket = null;
        function connect(token){
            websocket = new WebSocket("ws://localhost:8080/chat/" + token + "/" + userID);

            websocket.onopen = function(message) {processOpen(message);};
            websocket.onmessage = function(message) {processMessage(message);};
            websocket.onclose = function(message) {processClose(message);};
            websocket.onerror = function(message) {processError(message);};

            function processOpen(message) {
                console.log("Server connect... \n");
            }
            function processMessage(message) {
                const data = JSON.parse(message.data);
                const timestamp = new Date(data.timestamp).toLocaleTimeString();
                if (data.sender.userID !== ${sessionScope.user.userID}) {
                    $('#chatBox').append(
                        '<div class="chat-message left"> <strong>Client' +  '' + '</strong>' + '<span class="timestamp">(' + timestamp + '): </span>' +
                        data.content +
                        '</div>'
                    );
                }
                $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
            }
            function processClose(message) {
                console.log("Server disconnect... \n");
            }
            function processError(message) {
                console.log(message);
                console.log("Error... \n");
            }
        }

        function disconnect(){
            if(websocket !== null){
                websocket.close();
            }
        }

        $('.user-link').on('click', function(e){
            e.preventDefault();
            let receiverID = $(this).data('userid');
            token = $(this).data('token');
            $('#chatWith').text('Chat with ' + $(this).text());
            disconnect();
            connect(token);

            loadChat(receiverID);
        });

        $('#chatInput').on('keypress', function(e){
            if(e.which === 13){
                $('#sendBtn').click();
            }
        });

        $('#sendBtn').on('click', function(){
            var message = $('#chatInput').val();
            if(message.trim() !== ''){
                sendMessage(message, chatRoomID);
                $('#chatInput').val('');
            }
        });

        function loadChat(userId){
            fetch('/getMessageAdmin?id=' + userId)
                .then(response => response.json())
                .then(chatMessages => {
                    $('#chatBox').html('');
                    console.log(chatMessages);

                    chatMessages.forEach(message => {
                        const timestamp = new Date(message.timestamp).toLocaleTimeString();
                        if (message.user.userID === ${sessionScope.user.userID}) {
                            $('#chatBox').append(
                                '<div class="chat-message right"><strong>Admin</strong>' + '<span class="timestamp">(' + timestamp + ')</span>: '
                                + message.content +
                                '</div>'
                            )

                        } else {

                            $('#chatBox').append(
                                '<div class="chat-message right"><strong>Client' + '' + '</strong>' + '<span class="timestamp">(' + timestamp + ')</span>: '
                                + message.content +
                                '</div>'
                            )
                        }
                    });
                    $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
                });
        }

        function sendMessage(message){
            websocket.send(message);
            const timestamp = new Date().toLocaleTimeString();
            $('#chatBox').append(
                '<div class="chat-message right"><strong>Admin</strong>' + '<span class="timestamp">(' + timestamp + ')</span>: '
                + message +
                '</div>'
            );
            $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
        }
    });
</script>
</body>

</html>
