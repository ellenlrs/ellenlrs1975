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
									<input type="text" name="q" id="q" value="" placeholder="Book Name" /><BR>
									<ul class="actions vertical small">
										<li><input type="submit" value="Submit"  class="button special small fit"/></li>
									</ul>
								</div>
				      
				      </form>
						<h4>Results:</h4>
							 <div id="content"></div>
							 <div id="isbn"></div>
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
				      $.getJSON( "https://www.googleapis.com/books/v1/volumes?q=<%=request.getParameter("q") %>", {
				  	    format: "json"
				  	  })
				  	    .done(function( response ) {
				  	    	//console.log(response)
				  	      $.each( response.items, function( i, item ) {
				  	    	  $.each(item , function(applier, a_val){
				  	                // $('#isbn').append('key:'+applier+' , value:'+a_val+'<br/>');
				  	                 if(applier=='volumeInfo'){
				  	                 	$.each(a_val , function(applier2, b_val){
				  	                		if(applier2=='title'){
				  	                			$('#content').append('<h5>Book Title:'+b_val+'</h5><br/>');
				  	                		}
				  	                		if(applier2=='description'){
				  	                			$('#content').append('<blockquote>Description:'+b_val+'</blockquote><br/>');
				  	                		}
				  	                		 if(applier2=='industryIdentifiers'){
					  	     	                 	$.each(b_val , function(applier3, c_val){
					  	     	                		if(applier3=='0'){
					  	    	     	                 	$.each(c_val , function(applier4, isbn){
					  	    	     	                		 if(applier4=='identifier'){
					  	    	     	                			 $('#content').append('<ul class=actions><li><a href=/googlebook/embedviewer.jsp?isbn='+isbn+' class=button icon fa-chevron-down scrolly>View Content</a></li></ul><br/>');
					  	    	     	                		 }
					  	    	     	                 	});
					  	    	     	                 	
					  	    	     	                 }
					  	     	                 	});
					  	     	                 }
				  	                		
				  	                 	});
				  	                 }
				  	             });
				  	      });
				  	    });
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
