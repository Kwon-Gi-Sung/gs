<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script>
	// 	$(function() {
	// 		$.ajax("http://localhost:8082/wsws").done(
	// 				function(msg) {

	// 					var userList = msg.userList;
	// 					var text = "";
	// 					for (var i = 0; i < userList.length; i++) {
	// 						text += "아이디 : " + userList[i].userId + ", 이름 : "
	// 								+ userList[i].userName + "<br>";
	// 					}
	// 					alert("success!!!");
	// 					$("#corsText").html(text);
	// 				}
	// 				).fail(function() {
	// 			alert("fail...");
	// 		});
	// 	});
	var socket = new SockJS("http://localhost:8082/ws");
	$(function(){
		init();
	});
	
	function init() {
		socket.onmessage = function(message) {
			console.log(message);
			$chatOutput.append(message.data + "\n");
		};

		socket.onclose = function(event) {
			$chatOutput.append("연결 끊김");
		};
	}
</script>

<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
</body>
</html>
