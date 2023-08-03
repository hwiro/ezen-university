<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- closeWindow.jsp -->

<script type="text/javascript">
	alert("${msg}")
	opener.location.href='login_main.do'; 
	self.close()
</script> 