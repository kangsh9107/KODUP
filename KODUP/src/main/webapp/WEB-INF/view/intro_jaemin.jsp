<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link href="css/intro.css" rel="stylesheet">
<!-- JS -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<title>코드레벨업 - 코덥!</title>
</head>
<body>
	<div class="first">
		<div class="jb-box">
			<video muted autoplay loop>
				<!-- <source src="images/인트로영상.mp4" type="video/mp4"> -->
			</video>
			<img id="video" src="images/인트로영상2.gif">
			<div id="wrapper">
				<div id="wrapper-inner">
					<div id="scroll-down">
						<span class="arrow-down"><!-- css generated icon --></span>
						<span id="scroll-title">Scroll down</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 수형 -->
	<div class="intro intro1 container1">
		<div></div>
		<div class="intro1_1" data-aos="fade-up">
			
		</div>
		<div class="intro1_2" data-aos="fade-up" data-aos-delay="300">
			
		</div>
		<div class="intro1_3" data-aos="fade-up" data-aos-delay="600">
			
		</div>
		<div class="intro1_4" data-aos="fade-up" data-aos-delay="900">
			
		</div>
		<div></div>
	</div>
	<div class="intro intro2 container2">
		<div class="intro2_1" data-aos="flip-left"></div>
	</div>
	
	<!-- 요한 -->
	<div class="intro intro3"></div>
	<div class="intro intro4"></div>
	
	<!-- 성호 -->
	<div class="intro intro5"></div>
	<div class="intro intro6"></div>
	
	<!-- 한나 -->
	<div class="intro intro7"></div>
	<div class="intro intro8"></div>
	
	<!-- 세형 -->
	<div class="intro intro9"></div>
	<div class="intro intro10"></div>
	
	<!-- 재민 -->
	<div class="intro intro11"></div>
	<div class="intro12"></div>
	
	<div style="display: none;"></div>
	
	<!-- 
	<section class="section section--code" style="margin-top: 1000px;">
		<div class="container">
			<h2 class="section-title">Fade</h2>
			<div class="code code--small code--left" data-aos="fade-up">
				<video src="images/코딩하조.mp4" width="600px" height="400px" autoplay muted loop></video>
				<pre><code class="html">&lt;div data-aos="fade-up">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="fade-down">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-down">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="fade-right">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-right">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="fade-left">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-left">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="fade-up-right">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up-right">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="fade-up-left">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up-left">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="fade-down-right">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-down-right">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="fade-down-left">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-down-left">&lt;/div></code></pre>
			</div>
		</div>
	</section>
	
	<section class="section section--code">
		<div class="container">
			<h2 class="section-title">Flip</h2>
			<div class="code code--small code--left" data-aos="flip-left">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="flip-left">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="flip-right">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="flip-right">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="flip-up">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="flip-up">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="flip-down">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="flip-down">&lt;/div></code></pre>
			</div>
		</div>
	</section>
	
	<section class="section section--code">
		<div class="container">
			<h2 class="section-title">Zoom</h2>
			<div class="code code--small code--left" data-aos="zoom-in">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-in">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="zoom-in-up">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-in-up">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="zoom-in-down">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-in-down">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="zoom-in-left">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-in-left">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="zoom-in-right">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-in-right">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="zoom-out">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-out">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="zoom-out-up">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-out-up">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="zoom-out-down">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-out-down">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--left" data-aos="zoom-out-right">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-out-right">&lt;/div></code></pre>
			</div>
			<div class="code code--small code--right" data-aos="zoom-out-left">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="zoom-out-left">&lt;/div></code></pre>
			</div>
		</div>
	</section>
	
	<section class="section section--code">
		<div class="container">
			<h2 class="section-title">Different settings examples</h2>
			<div class="code code--left" data-aos="fade-up" data-aos-duration="3000">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="3000">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--right" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="1500">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-down"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="linear"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="1500">&#13;&lt;/div></code></pre>
			</div>
			<div id="example-anchor" class="code code--left" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-right"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-offset="300"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="ease-in-sine">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--right" data-aos="fade-left" data-aos-anchor="#example-anchor" data-aos-offset="500" data-aos-duration="500">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-left"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor="#example-anchor"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-offset="500"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="500">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--left" data-aos="fade-zoom-in" data-aos-easing="ease-in-back" data-aos-delay="300" data-aos-offset="0">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-zoom-in"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="ease-in-back"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-delay="300"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-offset="0">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--right" data-aos="flip-left" data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="flip-left"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="ease-out-cubic"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="2000">&#13;&lt;/div></code></pre>
			</div>
		</div>
	</section>
	
	<section class="section section--code">
		<div class="container">
			<h2 class="section-title">Anchor placement</h2>
			<div class="code code--wider code--left" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="top-bottom">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--wider code--right" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="center-bottom">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--wider code--left" data-aos="fade-up" data-aos-anchor-placement="bottom-bottom">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="bottom-bottom">&#13;&lt;/div></code></pre>
			</div>
	
			<div class="code code--wider code--right" data-aos="fade-up" data-aos-anchor-placement="top-center">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="top-center">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--wider code--left" data-aos="fade-up" data-aos-anchor-placement="center-center">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="center-center">&#13;&lt;/div></code></pre>
			</div>
			<div class="code code--wider code--right" data-aos="fade-up" data-aos-anchor-placement="bottom-center">
				<img src="images/devil_profile.png">
				<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="bottom-center">&#13;&lt;/div></code></pre>
			</div>
		</div>
	</section>
	-->
	
	<script> 
		AOS.init(); //자바스크립트로 init()을 해야 동작한다.
	</script>
</body>
</html>