<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery.getJSON demo</title>
  <style>
  img {
    height: 100px;
    float: left;
  }
  </style>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
 
<div id="images"></div>
<div id="infos"></div>
<script>
(function() {
  var flickerAPI = "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?";
  //var flickerAPI = "https://www.googleapis.com/books/v1/volumes?q=java&callback=";
  $.getJSON( flickerAPI, {
    tags: "mount rainier",
    tagmode: "any",
    format: "json"
  })
    .done(function( data ) {
      $.each( data.items, function( i, item ) {
       // $( "<img>" ).attr( "src", item.media.m ).appendTo( "#images" );
        if ( i === 3 ) {
          return false;
        }
      });
    });
  
  
  $.ajax({
	  url: 'https://www.googleapis.com/books/v1/volumes?q=java',
	})
	.done(function(data) {
		//alert(data.items.length);
		$.each( data.items, function( i, item ) {
		 //alert(item.volumeInfo);
         // $('#infos').append('volumeInfo: ' + item.volumeInfo.title+ '<br/>');
		});
		
			
		
	})
	.fail(function() {
	  alert("Ajax failed to fetch data")
	})
	
	
	$.ajax({ 
	    type: 'GET', 
	    url: 'https://www.googleapis.com/books/v1/volumes?q=java', 
	    data: { get_param: 'value' }, 
	    dataType: 'json',
	    success: function (data) { 
	    	//console.log(data)
	        $.each(data, function(index, element) {
	        	//$('#infos').append('volumeInfo: ' + element.id+ '<br/>');
	          //  $('body').append($('<div>', {
	            //    text: element.name
	            //}));
	        });
	    }
	});
  
  
  	$.getJSON( "https://www.googleapis.com/books/v1/volumes?q=java", {
	    format: "json"
	  })
	    .done(function( data ) {
	    	console.log(data)
	      $.each( data.items, function( i, item ) {
	             $.each(item , function(applier, a_val){
	                 $('#infos').append('key:'+applier+' , value:'+a_val+'<br/>');
	                 if(applier=='volumeInfo'){
	                 	$.each(a_val , function(applier2, b_val){
	                		 $('#infos').append('volumeinfo:'+applier2+' , value:'+b_val+'<br/>');
	                		 if(applier2=='industryIdentifiers'){
	     	                 	$.each(b_val , function(applier3, c_val){
	     	                		 $('#infos').append('type:'+applier3+' , value:'+c_val+'<br/>');
	     	                		if(applier3=='0'){
	    	     	                 	$.each(c_val , function(applier4, d_val){
	    	     	                		 $('#infos').append('isbn:'+applier4+' , value:'+d_val+'<br/>');
	    	     	                		 if(applier4=='identifier'){
	    	     	                			 $('#infos').append('ISBN10:'+applier4+' , value:'+d_val+'<br/>');
	    	     	                			$('#infos').append('ISBN10---------------------------------------------<br/>');
	    	     	                		 }
	    	     	                 	});
	    	     	                 	
	    	     	                 }
	     	                 	});
	     	                 }
	                 	});
	                 }
	             });
	             $('#infos').append('---------------------------------------------<br/>');
	      });
	    });
})();
</script>
 
</body>
</html>