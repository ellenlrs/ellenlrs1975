<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
   <title>Google Books Embedded Viewer API Example</title>
    	<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="../assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
		
		 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("books", "0");

      function initialize() {
        var viewer = new google.books.DefaultViewer(document.getElementById('viewerCanvas'));
        
        <%
        if(null!=request.getParameter("isbn")){
      %>
      viewer.load('ISBN:<%=request.getParameter("isbn") %>');
      <%
        }else{
      %>
        viewer.load('ISBN:0738531367');
        <%} %>
      }

      google.setOnLoadCallback(initialize);
    </script>
  </head>
<body id="top">

	<div id="viewerCanvas" style="width: 600px; height: 500px"></div>

<!-- Footer -->
			<footer id="footer">
				<p class="copyright">&copy;  <a href="/">ellenlrs1975</a></p>
			</footer>
		<!-- Scripts -->
	</body>
</html>
