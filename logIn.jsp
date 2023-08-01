<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="egov.wizware.com.*"%>
<%@ page import="java.util.*"%>
<% String ctxpath = request.getContextPath(); 
   if(ctxpath.trim().equals("") || ctxpath.trim().equals("/"))  ctxpath ="";  else if(ctxpath.charAt(0) != '/') ctxpath = '/' + ctxpath; %> 
<% DOBJ dobj = new DOBJ();                               
   if(request.getAttribute("retobj") != null){         
       dobj = (DOBJ)request.getAttribute("retobj");    
   }           
   else {      
       HttpSession sesn = request.getSession(true);      
       if ( sesn != null && sesn.getAttribute("G") != null )  {  
           VOBJ gvobj = (VOBJ)sesn.getAttribute("G") ;   
           dobj.setRetObject("G", gvobj);                 
       }   
   }       
%>         
<!DOCTYPE html>
<html>
<head>
        <title>01.로그인</title>
        <meta http-equiv="X-UA-Compatible"  content="IE=10;IE=9;IE=edge" />
        <meta http-equiv="Content-Type"  content="text/html; charset=utf-8" />
        <meta name="viewport"  content="width=device-width, initial-scale=1" />
        
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/wizware/css/zTreeStyle.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/wizware/css/UI.WizGrid.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/wizware/css/PBUIDefalut.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/wizware/css/fullcalendar.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/wizware/css/jquery-ui.min.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/toastui-editor.min.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/toastui-chart.min.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/toast.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/swiper-bundle.min.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/defalt.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/commonStyle.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/pic.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/materialize.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/powerMdd.css"  />
        <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/grid/latest/tui-grid.css"  />
        <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/bidding.css"  />
        <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/css/top.css"  />
        <script src="<%=ctxpath%>/wizware/js/jquery-1.11.0.min.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/grid.locale-en.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/jquery-ui.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/jquery.form.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/jquery.ztree.core.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/message.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/calendar/moment.min.js" ></script>
        <script src="<%=ctxpath%>/js/biddingJs/swiper-bundle.min.js" async></script>
        <script src="<%=ctxpath%>/js/biddingJs/utils.js" defer></script>
        <script src="<%=ctxpath%>/js/biddingJs/pic.js" defer></script>
        <script src="<%=ctxpath%>/js/biddingJs/materialize.min.js" defer></script>
        <script src="<%=ctxpath%>/js/biddingJs/bidding.js" defer></script>
        <script  src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js" ></script>
        <script src="<%=ctxpath%>/js/login/loginCommon.js" ></script>
        <script src="<%=ctxpath%>/js/common/crypto/sha256.min.js" ></script>
        <script src="<%=ctxpath%>/js/biddingJs/format/format.js" defer></script>
        <script src="<%=ctxpath%>/js/biddingJs/pageCommon.js" ></script>
        <script src="<%=ctxpath%>/js/biddingJs/viewLoad.js" ></script>
        <script src="<%=ctxpath%>/js/biddingJs/popUtil.js" ></script>
        <script src="<%=ctxpath%>/js/biddingJs/toastui-editor-all.min.js" defer></script>
        <script src="<%=ctxpath%>/wizware/js/calendar/fullcalendar.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/calendar/locale-all.js" ></script>
        <script  src="https://uicdn.toast.com/grid/latest/tui-grid.js" ></script>
        <script src="<%=ctxpath%>/js/biddingJs/wtGrid.js" ></script>
        <script src="<%=ctxpath%>/js/biddingJs/gridHeaderString.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/toastGridUtils.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/insuranceItemFileList.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/additionalFileList.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/attendanceProvider.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/bidEstimate.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/bidComparisonTable.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/aditionalPersonCharge.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/commonUtils.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/contractRequiredFilelist.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/contractAdditionalFilelist.jsp.js" ></script>
        <script src="<%=ctxpath%>/jsp/C/CZ/awardedEstimateTable.jsp.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/wizware-common-A-1.2.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/wizware-common-B-1.2.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/wizware-common-C-1.2.js" ></script>
        <script src="<%=ctxpath%>/wizware/js/wizware-common-D-1.1.js" ></script>
        <script> 
        /*<%
        	VOBJ temp = (VOBJ)session.getAttribute("TEMP");
        	String code = "";
        	String msg = "";
        	String userId = "";
        	if(temp != null)
            {
        		code = temp.get("CODE");
        		userId = temp.get("USER_ID");
        	}
        %>
        
        */
        function init(){
        //	document.getElementById("temppw").value = "Jeonju4$";
        
        	getSavedId(); //쿠키 불러오기
        }
        
        
        
        /********************************************************로그인 시작********************************************************/
        /**
        *	로그인을 요청한다. 로그인 버튼 눌렀을 때 콜 
        *
        */
        function doLoginRequest(myObj) 
        {
        	login(sbmLogin, "SEL14", false, true); 
        }
        /**
        *	암호화해서 sbmLogin 콜 
        */
        function login(sbmLogin,dsName,isDebug=false,isRequired=false){
        	sbmLogin.setIsLogin(dsName);
        	var encId = $("#LOGIN_USER_ID").val();
        	var encPw = sha256($("#LOGIN_PSWD").val());
        	$("#CRYPTED_NEWID").val(encId);
        	$("#CRYPTED_NEWPW").val(encPw);
        
        	sbmLogin.submit(isDebug,isRequired);
        	sbmLogin.setIsLogin(false);
        }
        /*
        *  쿠키 세팅후 ID, PW 유효성 검사 
        */
        function sbmLogin_ResultHandler(code, msg)
        {
        	if(document.getElementById("saveId").checked){
        		setCookii("saveid",$("#LOGIN_USER_ID").val(),30);
        	}
        	if (code == 0) {
        		if (msg == "3") {
        		    $("#LOGIN_USER_ID").css("border","1px solid #ff0000").focus();
        		    $("#errMsg").text("존재하지 않는 아이디입니다.");
        		    M.toast({html: $("#errMsg").text(),classes : 'waves-yellow red lighten-2'});
        		} else if (msg == "2") {
        		    $("#LOGIN_PSWD").css("border","1px solid #ff0000").focus();
        		    $("#errMsg").text("등록되지 않은 아이디 또는 잘못된 비밀번호입니다.");
        		    M.toast({html: $("#errMsg").text(),classes : 'waves-yellow red lighten-2'});
        		}else if(msg == "1"){
        			top.location.href = "<%=ctxpath%>/index.do"	//고민해보기
        			//top.location.replace("<%=ctxpath%>/index.do");
        		}
        		return
        	} else {
        		alert("정상적으로 로그인하지 못했습니다. 다시 시도해주세요.");
        	}
        	
        	
        	//sendLoadPage("/lgn/_login.sa",{id : encId , password: userPw },"hmsn.cmn.lgn","Lgn","login");
        	
        	/*
        	
        	var encId = $("#CRYPTED_NEWID").val();
        	var encPw = $("#CRYPTED_NEWPW").val();
        	var jsondd = {"id":encId,"password":encPw};
        	setParam.jsonData(jsondd);
        	
        	frm.method = "post";
        	frm.action = "<%=ctxpath%>/lgn/_login.sa";
        	frm.target = "_top";
        	frm.submit();
        	*/
        }
        /*
        function doLoginRequest(myObj)
        {
        	
        	var userId = $("#tempid").val();	//사용자입력 ID
        	var userPw = $("#temppw").val();	//사용자입력 PW
        
        	if(userId == ""){
        		$("#tempid").css("border","1px solid #ff0000").focus();
        		$("#errMsg").text("아이디를 입력해 주세요.");
        		M.toast({html: $("#errMsg").text(),classes : 'waves-yellow teal lighten-3'});
        		return;
        	}else{
        		$("#tempid").css("border","1px solid #e0e0ea");
        		$("#errMsg").text("");
        	}
        	if(userPw == ""){
        		$("#temppw").css("border","1px solid #ff0000").focus();
        		$("#errMsg").text("등록되지 않은 아이디 이거나 아이디 또는 비밀번호를 잘못 입력했습니다.");
        		M.toast({html: $("#errMsg").text(),classes : 'waves-yellow teal lighten-3'});
        		return;
        	}else{
        		$("#temppw").css("border","1px solid #e0e0ea");
        		$("#errMsg").text("");
        	}
          	
        	var encId = userId;
        	var encPw = userPw;
        	//var encPw = CryptoJS.AES.encrypt(userPw, passphrase); 
        	//var encPw = CryptoJS.SHA256(userPw);
        	
        	//$("#tempid").val("");
        	//$("#temppw").val("");
        	$("#loginid").val(encId);
        	$("#loginpassword").val(encPw);
        	
        	
        	//sendLoadPage("/lgn/_login.sa",{id : encId , password: userPw },"hmsn.cmn.lgn","Lgn","login");
        	var jsondd = {"id":encId,"password":encPw};
        	setParam.jsonData(jsondd);
        	
        	frm.method = "post";
        	frm.action = "<%=ctxpath%>/lgn/_login.sa";
        	frm.target = "_top";
        	frm.submit();
        
        }
        
        
        /********************************************************로그인  끝********************************************************/
        //엔터시 로그인
        function loginKeypress(myObj)
        {
        	if(event.keyCode === 13) {
        		doLoginRequest(myObj);
        	}
        }
        
        document.write('<link rel="shortcut icon" type="image/x-icon" href="/BIDDING/img/logo/fabi.ico">');
        
        /**
        *	회원가입 url load
        */
        function signup(myObj)
        {
        	frm.method = "post";
        	frm.action = "<%=ctxpath%>/index.do";
        	frm.target = "_top";
        	const signUpInput = document.createElement("input");
        	signUpInput.id = "SIGN_YN";
        	signUpInput.name = "SIGN_YN";
        	signUpInput.value = "Y";
        	frm.append(signUpInput);
        	frm.submit();
        	
        }
        /**
        *	아이디 찾기 url load
        */
        function findId(myObj)
        {
        	frm.method = "post";
        	frm.action = "<%=ctxpath%>/findId.sa";
        	frm.target = "_top";
        	frm.submit();
        }
        /**
        *	비밀번호 찾기 url load
        */
        function findPswd(myObj)
        {
        	frm.method = "post";
        	frm.action = "<%=ctxpath%>/findPswd.sa";
        	frm.target = "_top";
        	frm.submit();
        }
        
        
        /**
        *	checkbox click시 쿠키에 입력된 id 저장
        */
        function saveId_OnClick(myObj)
        {
        	let expDate = new Date();
        	if(myObj.checked){
        		expDate.setTime(expDate.getTime() + 1000 * 3600 * 24 * 30);
        	}else{
        		expDate.setTime(expDate.getTime() - 1);
        	}
        	setCookii("saveid",$("#tempid").val(),expDate);
        }
        
        /**
        *	client의 쿠키에 저장된 id를 불러와 화면에 세팅한다.
        */
        function getSavedId(){
        	let id = getCookie('saveid');
        	if(id != ''){
        		$("#LOGIN_USER_ID").val(id);
        		$("#saveId").prop("checked",true);
        	}
        }
        
        
        
        
        /********************************************************유틸 시작********************************************************/
        /**
        *	json object를 wizData로 변환한다.
        */
        const setParam = { 
        	jsonData : function(json){ 
        		let data = ''; 
        		
        		if(json != undefined){ 
        			data = '{'; 
        			data += '"paramwizware" : {"S":[' + JSON.stringify(json)+ ']}'; 
        			data += '}'; 
        		} 
        		document.getElementById('InWizExcelDown').value = ''; 
                document.getElementById('InWIzJsonParma').value = data; 
        	} 
        	,excelData : function(gridid ,hidden ,filenm){ 
        		let data = ''; 
        			data = '{'; 
        			data += '"paramwizware" : ' + wizutil.DatasetExcelString(gridid,'S1000',filenm,new Array(),false,false); 
        			//data += '}'; 
        		document.getElementById('InWizExcelDown').value = data; 
        		document.getElementById('InWIzJsonParma').value = ''; 
        	} 
        	,resetData : function(){ 
        		document.getElementById('InWizExcelDown').value = ''; 
        		document.getElementById('InWIzJsonParma').value = ''; 
        	} 
        }
        
        /**
        *	쿠키를 세팅한다.
        *	@param name		세팅할 쿠키명
        *	@param value 	세팅할 값
        *	@param expires 	만료기간
        */
        function setCookii(name, value, expires) {
          var exdate = new Date();
          exdate.setDate(exdate.getDate() + expires);
        
          var expirationString = formatDate(exdate);
        
          document.cookie = name + '=' + escape(value) + '; path=/; expires=' + expirationString;
        }
        /*
        * toGMTString() 지원 종료로 toUTCString()으로 변환
        */
        function formatDate(date) {
          if (date.toUTCString) {
            // Use toUTCString() for browsers supporting it
            return date.toUTCString();
          } else {
            // Fallback to manual formatting for older browsers
           	const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            
            const day = days[date.getUTCDay()];
            const dayOfMonth = date.getUTCDate();
            const month = months[date.getUTCMonth()];
            const year = date.getUTCFullYear();
            const hours = date.getUTCHours();
            const minutes = date.getUTCMinutes();
            const seconds = date.getUTCSeconds();
        
            return day + ', ' + padZero(dayOfMonth) + ' ' + month + ' ' + year + ' ' + padZero(hours) + ':' + padZero(minutes) + ':' + padZero(seconds) + ' GMT';
          }
        }
        //위 리턴값에서 쓰이는 function
        function padZero(num) {
          return (num < 10 ? '0' : '') + num;
        }
        /**
        *	쿠키명으로 쿠키 값 가져오기
        */
        function getCookie(name){
        	let search = `\${name}=`;
        	if(document.cookie.length > 0){
        		let offset = document.cookie.indexOf(search);
        		let end = ``;
        		if(offset > -1){
        			offset += search.length;
        			end = document.cookie.indexOf(";",offset);
        			if(end == -1){
        				end = document.cookie.length;
        			}
        			return unescape(document.cookie.substring(offset, end));
        		}
        	}
        	return "";
        }
        
        
        /********************************************************유틸  끝********************************************************/
        
        function button1_OnClick(myObj)
        {
        	console.log(loginCommon.regex);
        }
        
        </script>
        
        <style> 
        .body-Container{
        	padding: 0 !important;
        }
        .login-banner {
        	width: 100%;
        	/*height: 500px;*/
        	height : 100vh;
        	background:url("/BIDDING/img/bidding/CK_cm08353833_l.jpg") no-repeat;
            background-position: center;
            background-size: cover;
            overflow: hidden;
        }
        .login-container {
            display: flex;
            flex-direction: column;
            padding: 60px 20px;
            backdrop-filter: brightness(0.5);
            background: #4e4e4e6e;
            z-index: 99;
            backdrop-filter: saturate(230%) blur(20px) !important;
            border-radius: unset;
            height: 100%;
        }
        .login-btn {
            background: #2d61ca;
            color: whitesmoke;
            height: 100px;
            width: 100px;
            box-sizing: border-box;
            cursor: pointer;
            margin-left: 2px;
            font-weight: bold;
            font-size: 17px;
            display: flex;
            align-items: center;
            justify-content: center;
        	white-space: nowrap;
        }
        .login-input-box {
        	/*height: 50px;*/
        	margin: 3px;
            box-sizing: border-box;
            position: relative;
            display: flex;
            width:300px;
        }
        .login-input-box > input {
            border: 1px solid gainsboro;
            border-radius: unset;
            height:45px;
        	padding: 0px 20px;
        }
        .login-input-box > input:focus::before{
        	content:"⭐";
        }
        .login-content-box {
            display: flex;
            /*padding: 30px 0;*/
        }
        .login-title-1 {
            font-size: 27px;
            font-weight: bold;
            color: #a9c6ff;
            text-shadow: 0px 6px 3px #00000057;
            font-weight: 900;
            /* -webkit-text-stroke: 0.1px #fff; */
        }
        .login-title-2{
            font-size: 22px;
        }
        .login-title-3{
            color: gray;
        }
        #group6{
        	display : flex; 
        }
        .login-title-3 {
            text-align: center;
            margin-top: 10px;
        }
        #lbl4,#lbl5,#lbl6{
        	text-decoration: underline;
        	cursor:pointer;
        }
        div#group12 {
            margin: 30px 0 10px 0;
        	flex-wrap: wrap;
        }
        .margin-0{
        	margin: 0 !important;
        }
        </style>
</head>
<body >
    <div id="pbview"  style="height:100vh;width:100vw;max-width:100%;" >
<form id='frm' name='frm' style="height:100%; width:100%"  >
    <div id="hiddenvariable" style="display:none">
        <input style="display:none" id="out_message" name="out_message"  value="" ></input>
        <input style="display:none" id="out_code" name="out_code"  value="" ></input>
    </div>
        <input type='hidden'  id="InWIzJsonParma" name="InWIzJsonParma"  value="" ></input>
        <input type='hidden'  id="InWizExcelDown" name="InWizExcelDown"  value="" ></input>
    <div id="baselayer1"  class="main-container"  >
      <div  id="group1" name="group1"  class="body-Container f-row width-full a-ic" >  
          <div  id="group2" name="group2"  class="login-banner f-row j-fe a-ic" >  
              <div  id="group3" name="group3"  class="login-container j-c a-fe" >  
                  <div  id="group4" name="group4"  class="f-col width-full a-ic" >  
                    <label  class="login-title-1" id="lbl2" name="lbl2">                    공찰시스템 로그인</label>                    <label  class="login-title-3 white-text" id="label1" name="label1">                    보험 </label>                  </div>                  <div  id="group5" name="group5"  class="f-col f-s" >  
                      <div  id="group12" name="group12"  class="f-row a-ic j-c" >  
                          <div  id="group11" name="group11"  class="f-col login-content-box" >  
                            
                            <div id="baselayer1_LOGIN_USER_ID"  name="baselayer1_LOGIN_USER_ID" class="login-input-box" >                             	<input  class="width-full margin-0 white-text" id="LOGIN_USER_ID" name="LOGIN_USER_ID" size="12" type="text" placeholder="아이디" tabindex="0"  onkeypress="loginKeypress(this);">                            </input>

                            </div>                                                        	<input  class="non-show" id="CRYPTED_NEWID" name="CRYPTED_NEWID" size="12" type="text" placeholder="아이디" tabindex="0"  onkeypress="loginKeypress(this);">                            </input>
                            
                            <div id="baselayer1_LOGIN_PSWD"  name="baselayer1_LOGIN_PSWD" class="login-input-box" >                             	<input type="password"  class="width-full margin-0 white-text" id="LOGIN_PSWD" name="LOGIN_PSWD" size="15"  maxlength="30" tabindex="0"  placeholder='패스워드'  onkeypress="loginKeypress(this);" ></input>

                            </div>                                                        	<input  class="non-show" id="CRYPTED_NEWPW" name="CRYPTED_NEWPW" size="12" type="text" placeholder="아이디" tabindex="0"  onkeypress="loginKeypress(this);">                            </input>
                          </div>                        <label  class="login-btn btn-default waves-effect waves-light btn white-text" id="lbl1" name="lbl1" onclick="doLoginRequest(this);">                        로그인</label>                      </div>                      <div  id="group8" name="group8"  class="f-row j-sb width-full mob-col" >  
                          <div  id="group9" name="group9"  >  
                                                        	<input type="checkbox"  id="saveId" name="saveId" value="Y" tabindex="0"  onclick="saveId_OnClick(this);">                            <label  for="saveId"  class="white-text" id="lbl3" name="lbl3" for="saveId" >                            아이디 저장</label>                          </div>                          <div  id="group10" name="group10"  >  
                            <label  class="white-text" id="lbl4" name="lbl4" onclick="signup(this);">                            회원가입</label>                            <label  class="white-text " id="lbl5" name="lbl5" onclick="findId(this);">                            아이디 찾기</label>                            <label  class="white-text" id="lbl6" name="lbl6" onclick="findPswd(this);">                            비밀번호 찾기</label>                          </div>                      </div>                  </div>                  <div  id="group7" name="group7"  class="a-ic" >  
                      <div  id="group6" name="group6"  class="a-ic j-c" >  
                        <label  class="a-ic" id="errMsg" name="errMsg"></label>                      </div>                  </div>              </div>          </div>      </div>
        	<textarea  class="non-show" id="area1" name="area1" tabindex="0"  >현재 로그인 아이디 패스워드 임시로 박아둠
스크립트 init()에 패스워드 박혀있음</textarea>

</div>
    <div id='div_layerPage' name='div_layerPage' style='display:none;background-color:white;'>
      <iframe id='layerPage' name='layerPage'  scrolling='auto' >	</iframe>
    </div>
    <div id='layerPopup' name='layerPopup' style='display:none;background-color:white;'  scrolling='no'>
    <iframe id='iframePopup' name='iframePopup' style='width:600px;height:400px;' scrolling='no'>
    </iframe>
    </div>
    <div id='layerPopup1' name='layerPopup1' style='display:none;background-color:white;'  scrolling='no'>
    <iframe id='iframePopup1' name='iframePopup1' style='width:600px;height:400px;' scrolling='no'>
    </iframe>
    </div>
    <div id='layerPopup2' name='layerPopup2' style='display:none;background-color:white;'  scrolling='no'>
    <iframe id='iframePopup2' name='iframePopup2' style='width:600px;height:400px;' scrolling='no'>
    </iframe>
    </div>
</form>
    </div>
<div id="debug"  title="Data Trace Dialog">
  <p id="debugmsg" style="font-size:9px"></p><p id="debugin" style="font-size:9px"></p><p id="debugout" style="font-size:9px"></p>
</div> 
</body>
<script type="text/javascript" >
    var GridRowHeight= {};
    var ChkNumberColumns= [];
    var RadioProp= {};
    var CheckProp= {"":"saveId"};
    var ComboObjProp= {};
    var RequiredProp= {};
    var CellEditoption= {};
    var InitItems= {"saveId": {TrueValue:"Y", FalseValue:"N",Column:"_" }};
    var sbmInit = new SubMission( frm, "<%=ctxpath%>","","","initsheet","Data","","","BID");
    sbmInit.setObjectInfo("","","");
    var sbmLogin = new SubMission( frm, "<%=ctxpath%>/CC00101S_Login.do","CRYPTED[A]:S","","sbmLogin_ResultHandler","Data","20230615111111","Login","BID");
    sbmLogin.setJspInfo("","");
    sbmLogin.setObjectInfo("com.gongchal.C.CC","CC00101S","Login");
    
    var DefaultGrid =[] ; 
    var initSchedule = function() { 
    };

    var initChart = function() { 
    };

    var initGrids = function(gridid, initcolumn)  
    { 
        if(gridid == null)  
        { 
            
        } 
    } 
    function initsheet() {  initGrids(null, true);  }
    $(document).ready(function () { 
        initGrids(null, true);
        setTimeout( function(){            
        
        init();
        if("<%=code%>" == "9"){
        
        	const data = createPopInputData("S",{USER_ID : "<%=userId%>"});
        	openLayerPopup("PopupPswdChgCView",data,800,350,"chgPswdClose");
        	
        	<%
        		session.removeAttribute("TEMP");
        	%>
        }
        
        
        }, 400);
    });
        wizutil.setVisible("area1",false);
        wizutil.setVisible("CRYPTED_NEWID",false);
        wizutil.setVisible("CRYPTED_NEWPW",false);
</script>
</html>