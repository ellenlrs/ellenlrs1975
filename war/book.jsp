<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
    <title>Books API Example</title>
  </head>
  <body>
    <div id="content"></div>
     <div id="content2"></div>
    <script>
      function handleResponse(response) {
      for (var i = 0; i < response.items.length; i++) {
        var item = response.items[i];
        // in production code, item.text should have the HTML entities escaped.
        document.getElementById("content").innerHTML += "<br>" + item.volumeInfo.title;
        document.getElementById("content").innerHTML += "<br>" + item.volumeInfo.description+"<br><HR>";
      }
    }
      function handleResponse2(response) {
    	 // alert(response.length);
        //  for (var i = 0; i < response.length; i++) {
        //    var item = response[i];
            // in production code, item.text should have the HTML entities escaped.
            document.getElementById("content2").innerHTML += "<br>" + response.id;
            document.getElementById("content2").innerHTML += "<br>" + response.selfLink+"<br><HR>";
        //  }
        }
    </script>
    <script src="https://www.googleapis.com/books/v1/volumes?q=harry+potter&callback=handleResponse"></script>
    <script src="https://www.googleapis.com/books/v1/users/105012179748179149683/bookshelves/1001?callback=handleResponse2"></script>
  </body>
</html>
