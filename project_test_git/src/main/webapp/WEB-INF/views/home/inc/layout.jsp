<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>
		<tiles:getAsString name="title"/>
	</title>
	
	<!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    <!-- CSS
  ================================================== -->
    <link rel="shortcut icon" href="resources/img/favicon.ico"/>
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <!-- Elegant icon font -->
     <link rel="stylesheet" href="resources/css/line-icons.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="resources/css/animate.css">
    <!-- Prettyphoto -->
    <link rel="stylesheet" href="resources/css/prettyPhoto.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="resources/css/owl.carousel.css">
    <link rel="stylesheet" href="resources/css/owl.theme.css">
    <!-- Scrolling nav css -->
    <link rel="stylesheet" href="resources/css/scrolling-nav.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="resources/css/index.css">
    <!-- Responsive styles-->
	<link rel="stylesheet" href="resources/css/responsive.css">
		
</head>
<body data-spy="scroll" data-target=".navbar-fixed-top" >
	<!-- Header  영역  -->
	<tiles:insertAttribute name="header" />
	<!-- Main 영역 -->
	<div id="main">
		<div class="top-wrapper clear">
			<tiles:insertAttribute name="content" />
		</div>	
	</div>
	<!-- Footer  영역  -->
	<tiles:insertAttribute name="footer" />
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- initialize jQuery Library -->
    <script type="text/javascript" src="resources/js/jquery.js"></script>
    <!-- Owl Carousel -->
    <script type="text/javascript" src="resources/js/owl.carousel.js"></script>
    <!-- PrettyPhoto -->
    <script type="text/javascript" src="resources/js/jquery.prettyPhoto.js"></script>
    <!-- Wow Animation -->
    <script type="text/javascript" src="resources/js/wow.min.js"></script>
    <!-- SmoothScroll -->
    <script type="text/javascript" src="resources/js/smooth-scroll.js"></script>
    <!-- Eeasing -->
    <script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
    <!-- Counter -->
    <script type="text/javascript" src="resources/js/jquery.counterup.min.js"></script>
    <!-- Waypoints -->
    <script type="text/javascript" src="resources/js/jquery.waypoints.min.js"></script>
    <!-- Scrolling navigation -->
    <script type="text/javascript" src="resources/js/scrolling-nav.js"></script>
    <script type="text/javascript" src="resources/js/jquery.backstretch.min.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="resources/js/custom.js"></script>
	<script>
		new WOW().init();
	</script>
    <script>
          $.backstretch([
          "resources/img/bg/bg1.jpg",
          "resources/img/bg/bg2.jpg",
          "resources/img/bg/bg3.jpg"
        ], {
            fade: 950,
            duration: 5000
        }); 
          
          

    </script>
    <script>
        
   $('.counter').counterUp({
            delay: 100,
            time: 2000
        });
    </script>
    
    <script>
    $(window).load(function() { // makes sure the whole site is loaded
    	  "use strict";

    	  /* ==============================================
    	      Menu toggle
    	    =============================================== */ 
    	    $(window).bind('scroll', function() {
    	        var navHeight = $(window).height() - 200;
    	        if ($(window).scrollTop() > navHeight) {
    	            $('.navbar-default').addClass('on');
    	        } else {
    	            $('.navbar-default').removeClass('on');
    	        }
    	    });

    	 

    	});
    </script>
</body>
</html>