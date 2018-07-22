<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改机房信息</title>
</head>
<body>
	<form action="updateRoom.html">
		机房名称：${room.roomName}<br/>
		机房容量：<input name="roomSeat" value="${room.roomSeat}"/><br/>
		机房状态：<select size="1" name="roomStatus">
					<option value="1">机房正常</option>
					<option value="2">机房不可用</option>
			   </select>
			   <input type="hidden" name="id" value="${room.id}"/><br/>
		<input type="submit" value="更改"/>
	</form>
</body>
</html>