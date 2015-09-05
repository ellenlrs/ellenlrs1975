<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
    <title>Books API Example</title>
    	<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="../assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
  </head>
<body id="top">
    <!--
    <script src="https://www.googleapis.com/books/v1/users/105012179748179149683/bookshelves/1001?callback=handleResponse2"></script>
  -->

  <section id="four" class="wrapper">
				<div class="inner">
					<header class="major">
						<h2>Google Book Search</h2>
					</header>
					<section>
					 <form action="/googlebook/bookapi.jsp" method="GET">
				       <h4>Book Search:</h4> 
				       <div class="6u 12u$(xsmall)">
									<input type="text" name="q" id="q" value="" placeholder="Book Name" />
									<ul class="actions small">
									<li><input type="submit" value="Submit"  class="button special small"/></li>
								</ul>
								</div>
				      
				      </form>
						<h4>Results:</h4>
							 <div id="content"></div>
					</section>
				</div>
			</section>
		<!-- Footer -->
			<footer id="footer">
				<p class="copyright">&copy;  <a href="/">ellenlrs1975</a></p>
			</footer>
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="../assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>
			
			 <script>
      function handleResponse(response) {
      for (var i = 0; i < response.items.length; i++) {
        var item = response.items[i];
        // in production code, item.text should have the HTML entities escaped.
       // document.getElementById("content").innerHTML += "<br>" + item.volumeInfo.title;
        //document.getElementById("content").innerHTML += "<br>" + item.volumeInfo.description+"<br><HR>";
         //document.getElementById("content").innerHTML += "<a href='"+item.imageLinks.smallThumbnail+"'>Image</a><br>";
        document.getElementById("content").innerHTML += "<h5>" + item.volumeInfo.title + "<br></h5>";
          document.getElementById("content").innerHTML += "<blockquote>"  + item.volumeInfo.description+"<br></blockquote>";
         
         
      }
    }
    </script>
    <%
      if(null!=request.getParameter("q")){
    %>
    <script src="https://www.googleapis.com/books/v1/volumes?q=<%=request.getParameter("q") %>&callback=handleResponse"></script>
    <%
      }
    %>

	</body>
</html>
