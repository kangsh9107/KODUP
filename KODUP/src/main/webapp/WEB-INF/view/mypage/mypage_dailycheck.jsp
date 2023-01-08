<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>daily check</title>
</head>
<body>
		<svg width='600' height='200'>
  		<filter id='money'>
		    <feMorphology in='SourceGraphic' operator='dilate' radius='2' result='expand'/>
		
		    <feOffset in='expand' dx='1' dy='1' result='shadow_1'/>
		    <feOffset in='expand' dx='2' dy='2' result='shadow_2'/>
		    <feOffset in='expand' dx='3' dy='3' result='shadow_3'/>
		    <feOffset in='expand' dx='4' dy='4' result='shadow_4'/>
		    <feOffset in='expand' dx='5' dy='5' result='shadow_5'/>
		    <feOffset in='expand' dx='6' dy='6' result='shadow_6'/>
		    <feOffset in='expand' dx='7' dy='7' result='shadow_7'/>
		
		    <feMerge result='shadow'>
		      <feMergeNode in='expand'/>
		      <feMergeNode in='shadow_1'/>
		      <feMergeNode in='shadow_2'/>
		      <feMergeNode in='shadow_3'/>
		      <feMergeNode in='shadow_4'/>
		      <feMergeNode in='shadow_5'/>
		      <feMergeNode in='shadow_6'/>
		      <feMergeNode in='shadow_7'/>
		    </feMerge>
		
		    <feFlood flood-color='#ebe7e0'/>
		    <feComposite in2='shadow' operator='in' result='shadow'/>
		
		    <feMorphology in='shadow' operator='dilate' radius='1' result='border'/>
		    <feFlood flood-color='#35322a' result='border_color'/>
		    <feComposite in2='border' operator='in' result='border'/>
		
		    <feOffset in='border' dx='1' dy='1' result='secondShadow_1'/>
		    <feOffset in='border' dx='2' dy='2' result='secondShadow_2'/>
		    <feOffset in='border' dx='3' dy='3' result='secondShadow_3'/>
		    <feOffset in='border' dx='4' dy='4' result='secondShadow_4'/>
		    <feOffset in='border' dx='5' dy='5' result='secondShadow_5'/>
		    <feOffset in='border' dx='6' dy='6' result='secondShadow_6'/>
		    <feOffset in='border' dx='7' dy='7' result='secondShadow_7'/>
		    <feOffset in='border' dx='8' dy='8' result='secondShadow_8'/>
		    <feOffset in='border' dx='9' dy='9' result='secondShadow_9'/>
		    <feOffset in='border' dx='10' dy='10' result='secondShadow_10'/>
		    <feOffset in='border' dx='11' dy='11' result='secondShadow_11'/>
		
		    <feMerge result='secondShadow'>
		      <feMergeNode in='border'/>
		      <feMergeNode in='secondShadow_1'/>
		      <feMergeNode in='secondShadow_2'/>
		      <feMergeNode in='secondShadow_3'/>
		      <feMergeNode in='secondShadow_4'/>
		      <feMergeNode in='secondShadow_5'/>
		      <feMergeNode in='secondShadow_6'/>
		      <feMergeNode in='secondShadow_7'/>
		      <feMergeNode in='secondShadow_8'/>
		      <feMergeNode in='secondShadow_9'/>
		      <feMergeNode in='secondShadow_10'/>
		      <feMergeNode in='secondShadow_11'/>
		    </feMerge>
		
		    <feImage x='0' y='0' width='600' height='200' xlink:href='https://s3-us-west-2.amazonaws.com/s.cdpn.io/78779/stripes.svg'/>
		    <feComposite in2='secondShadow' operator='in' result='secondShadow'/>
		
		    <feMerge>
		      <feMergeNode in='secondShadow'/>
		      <feMergeNode in='border'/>
		      <feMergeNode in='shadow'/>
		      <feMergeNode in='SourceGraphic'/>
		    </feMerge>
		  </filter>
		
		  <text dominant-baseline='middle' text-anchor='middle' x='50%' y='50%'>
		    출석체크
		  </text> 
		  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTExMTZfMzcg%2FMDAxNTczOTE0MDQ3OTk1.XKe08Icy9DiojVEMOvWnEmRae25qqvbTQ8qlZz8FHKYg.pl7DTzo3Ni7R5RxLq0w1ug9DDvH7ceHRHWyGQbgvq90g.PNG.mentorkh%2F%25C3%25E2%25BC%25AE%25C3%25BC%25C5%25A9_2.png&type=sc960_832">
		</svg>
		
		
		
		
</body>
</html>