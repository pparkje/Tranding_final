<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Hello JSP</title>
	<style type="text/css">

    	* {
	    	margin:0;
	    	padding:0;
	    	text-decoration: none;
	    	list-style: none;
    	}
    	
    	 /** body 태그에 기본적으로 적용된 padding, margin을 off시킨다.*/
  	  body {
        padding: 0;
        margin: 0;
    	}

    /** 부모를 기준으로 크기를 갖기 때문에, body와 html에게도 크기 설정 */
	    html,
	    body {
	        width: 100%;
	        height: 100%;
	    }

    	.main {
    		min-height: 800px;
    		width: 1440px;
    		margin: auto;
    		
    	}
    	.btn_login button {
    	width: 560px;
    	height: 40px;
    	background-color: #000;
    	color: #fff;
		margin-top: 20px;
		text-align: center;
		display:block;
	
		}
	    .leftDiv {
	    font-size: 18px;
	    width: 650px;
	    height: 500px;
	    margin: 80px 20px;
	    float: left;
	    border-right: 1px solid #BDBDBD;
	    }
	    .leftDiv h2 {
	    margin: 20px 0 ;
	    }
	   
	    .leftDiv input {
	 	width: 400px;
	 	height: 40px;
	  	margin-left: 10px;
	  	border: 0px solid #fff;
	  	border-bottom: 1px solid #BDBDBD;
	    }
	    .leftDiv input:nth-child(21),
	    .leftDiv input:nth-child(22) {
	    width: 20px;
	    height: 20px;
	    margin: 20px 10px 20px 73px;
	    }
	    
	     .leftDiv input:nth-child(19),
	    .leftDiv input:nth-child(20) {
	    width: 20px;
	    height: 20px;
	    margin: 20px 10px 20px 80px;
	    }

	    .rightDiv {
	   	font-size: 18px;
	    width: 650px;
	    height: 500px;
	    margin: 80px 20px;
	    float: left;
	    }
	      .rightDiv h2 {
	    margin: 20px 0 ;
	    }
	     .rightDiv input {
	 	width: 400px;
	 	height: 40px;
	  	margin-left: 10px;
	  	border: 0px solid #fff;
	  	border-bottom: 1px solid #BDBDBD;
	    }
	    .rightDiv a {
	    margin: 10px 0px 0px 435px;
	    display: block;
	    font-size: 0.8em;
	    }
	   
    </style>
</head>

<body>


    <div class="main wrap"> 
    <div class="leftDiv">
    <h2>회원가입하기</h2>
    <form method="post" action="${pageContext.request.contextPath}/pjh/members/members_add_ok.do">
    아이디<input type="text" placeholder="아이디" style="margin-left: 100px;" name="m_id" id="m_id" />
    <br/>
    비밀번호<input type="password" placeholder="비밀번호" style="margin-left: 84px;" name="m_pwA" id="m_pwA" />
    <br/>
    비밀번호 확인<input type="password" placeholder="비밀번호 확인"  style="margin-left: 40px;" name="m_pwB" id="m_pwB" />
    <br/>
    이메일<input type="email" placeholder="이메일 주소" style="margin-left: 100px;" name="m_email" id="m_email" />
    <br/>
    닉네임<input type="text" placeholder="닉네임을 입력해주세요" style="margin-left: 100px;" name="m_username" id="m_username" />
    <br/>
    이름<input type="text" placeholder="이름을 입력해주세요" style="margin-left: 120px;" name="m_name" id="m_name" />
    <br/>
    연락처 <input type="text" placeholder="연락처를 입력해주세요." style="margin-left: 95px;" name="m_phone" id="m_phone" />
    <br/>
    주소 <input type="text" placeholder="주소를 입력해주세요." style="margin-left: 110px;" name="m_address" id="m_address" />
    <br/>
    생년월일 <input type="date" style="margin-left: 73px;" name="m_birthday" id="m_birthday" />
    <br/>
    성별 <input type="radio" style="margin-left: 110px;" name="gender" value="F" />여성
    	 <input type="radio" class="chk" name="gender" value="M" />남성
    <br/>
    수신동의  
    <input class="chk" type="checkbox" value="Y" name="m_email_agree" id="m_email_agree" />마케팅 이메일
    <p> 가입하시면 트렌딩의 이용약관과 개인정보 수집에 동의하게 됩니다.  
    <span class="btn_login">
    	<button type="submit">회원가입 하기</button>
    </span>
    </form>
    

	</div>
	
	<div class="rightDiv">
	<h2>로그인</h2>
	<form method="post" action="${pageContext.request.contextPath}/pjh/jsp/fav_login_ok.do">
		아이디 <input type="text" placeholder="아이디" name="m_id" id="m_id" style="margin-left: 100px;" />
	 	<br/>
		비밀번호 <input type="password" placeholder="비밀번호" name="m_pw" id="m_pw" style="margin-left: 83px;" />
		<br/>
		<a href=""> 비밀번호 재설정 </a>
		<a href=""> 관리자 로그인 </a>
		<div class="btn_login">
			<button type="submit">로그인 하기</button>
		</div>
	</form>
	
	</div>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>