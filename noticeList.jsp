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
        <title>01.공지사항 목록</title>
        <meta http-equiv="X-UA-Compatible"  content="IE=10; IE=9; IE=edge" />
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
        // 검색 버튼 클릭시 실행되는 함수입니다. 그리드 제출 메소드를 호출합니다.
        function srch_OnClick(myObj) {
        	$('#SRCH_PAGECNT').val("");
        	sbmGrid.submit(false, false);
        }
        // 생성 버튼 클릭시 실행되는 함수입니다. 특정 페이지(CG00102S)로 이동합니다.
        function crt_OnClick(myObj) {
        	movePage("CG00102S",{});
        }
        // 그리드 제출 결과를 처리하는 함수입니다. 
        function sbmGrid_ResultHandler(code, msg) {
        	$(".g").remove(); 
        	$(".tot-count-box").remove();
        	$("#paging").remove();
        	$(".empty-box").remove();
        	let jData = jDataset.getDataset("SEL4").rows();
        	console.log(jData);
        	var rowCount = jData.length;
        	if (rowCount != 0) {
        		let fortotal = '<div class="tot-count-box f-col">' + $("#CNT_CNT").val() + '<label>searched</label></div>';
        		$("#group8").append(fortotal);
        		for (p in jData) {
        			const BBS_ID = jData[p]?.BBS_ID;
        			const BBS_TTL = jData[p]?.BBS_TTL;
        			const BBS_CN = jData[p]?.BBS_CN;
        			const INQ_CNT = jData[p]?.INQ_CNT;
        			const ATCH_FILE_ID = jData[p]?.ATCH_FILE_ID;
        			const FRST_REG_DT = jData[p]?.FRST_REG_DT;
        			const FIX_YN = jData[p]?.FIX_YN;
        			//파파일일첨첨부부부표표시시
        			const checkmarkHtml = ATCH_FILE_ID ? '<i class="material-icons poab att-ico">attachment️</i>' : '';
        			//중중요요공공지지표표시시
        			const importantLabel = FIX_YN === 'Y' ? '<label class="notice-important">중요</label>' : '';
        			let forhtml = `
        			<div class="g sb-\${p}" onclick="testtestPage('\${BBS_ID}', '\${ATCH_FILE_ID}')">
        				<div style="display: flex; justify-content: flex-start; align-items:center;">
        					\${importantLabel}<label class="rhdwlxkdlxmf" style="font-weight:bold; color:black;">\${BBS_TTL}</label>
        					\${checkmarkHtml}
        				</div>
        				<div style="padding:10px 20px;">
        					<label class="rhdwltkgkdqkrtm" style=" color:#696969;">\${BBS_CN}</label>
        				</div>
        				<div class="f-row a-ic j-fe width-full" style="color: #a1a1a1;">
        					<i class="material-icons">visibility</i><label>\${INQ_CNT}</label>
        					<span style="padding:0 30px;"></span>
        					<i class="material-icons">event</i><label>\${FRST_REG_DT}</label>
        				</div>
        			</div>`;
        			$("#group3").append(forhtml);
        		}
        		//페페이이징징로로직직
        		var pageCnt = Math.ceil($("#CNT_CNT").val() / 10);
        		var pagehtml = "";
        		pagehtml += '<div id="paging" class="f-row width-full a-ic j-c">'
        		pagehtml += '<img src="<%=ctxpath%>/wizware/css/img/pageing/first.png" class="nextpre" onclick="setgoPage(1)">' 
        		pagehtml += '<img src="<%=ctxpath%>/wizware/css/img/pageing/prev.png" class="nextpre" onclick="setgoPagePrev()">' 
        		
        		for(var i = 1; i <= pageCnt; i++){ 
        		    pagehtml += "<a href='javascript:setgoPage(" + i + ");' id='" + i + "' class='pageGrid'>" + i + "</a>" 
        		} 
        		
        		pagehtml += '<img src="<%=ctxpath%>/wizware/css/img/pageing/next.png" class="nextpre" onclick="setgoPageNext()">' 
        		pagehtml += '<img src="<%=ctxpath%>/wizware/css/img/pageing/last.png" class="nextpre" onclick="setgoPage(' + pageCnt + ')"></div>'
        		$("#group3").append(pagehtml);
        		if ($('#SRCH_PAGECNT').val() == "") {
        			$("#1").addClass('highlighted');
        		} else {
        			$("#" + $('#SRCH_PAGECNT').val()).addClass('highlighted');
        		}
        	} else {
        		nodata = '<div class="empty-box f-row width-full a-ic j-c"><div class="empty-icon"></div>조회된 데이터가 없습니다.</div>';
        		$("#group3").append(nodata);
        	}
        	//권권한한관관리리
        	const authrtId = "<%=dobj.getRetObject("G").get("AUTHRT_ID")%>"
        	if (authrtId == "COR" || authrtId == "INS") {
        		$('#crt').css("display", "none");
        	}
        }
        // 클릭시 특정 페이지로 이동하는 함수입니다.
        function testtestPage(bbsID, atchFileID) {
        	$('#NTC_BBS_ID').val(bbsID);
        	sbmView.submit(false, false);
        	movePage("CG00102S",
        				{
        					"BBS_ID" 	:	bbsID                       
        				});
        }
        // 이전 페이지로 이동하는 함수입니다.
        function setgoPage(pageNum) {
            $('#SRCH_PAGECNT').val(pageNum);
            $('.pageGrid').removeClass('highlighted');
            $('#' + pageNum).addClass('highlighted');
            window.scrollTo(0,0);
            sbmGrid.submit(false, false);
        }
        
        // 다음 페이지로 이동하는 함수입니다.
        function setgoPagePrev() {
            var currentPage = parseInt($('#SRCH_PAGECNT').val(), 10);
            if (currentPage > 1) {
                setgoPage(currentPage - 1);
            }
        }
        
        // 다음 페이지로 이동하는 함수입니다.
        function setgoPageNext() {
        	if ($('#SRCH_PAGECNT').val() == "") {
        		var currentPage = 1;
        	} else {
            	var currentPage = parseInt($('#SRCH_PAGECNT').val(), 10);
            }
            var maxPage = Math.floor($("#CNT_CNT").val() / 10 + 1);
            if (currentPage < maxPage) {
                setgoPage(currentPage + 1);
            }
        }
        // 엔터키 입력시 그리드 제출 메소드를 호출하는 함수입니다.
        function SRCH_KEYWORD_OnKeypress(myObj)
        {
            var key = event.which || event.keyCode;
            if (key === 13) {
                srch_OnClick();
            }
        }
        
        // 자동완성 기능을 위한 설정입니다.
        $('#SRCH_KEYWORD').after('<ul id="suggestionBox" class="collection width-full" style="display: none; position: absolute; z-index: 999;"></ul>');
        $('#SRCH_KEYWORD').attr('autocomplete', 'off');
        var position = $('#SRCH_KEYWORD').position();
        var height = $('#SRCH_KEYWORD').outerHeight();
        //박박스스생생성성
        $('#suggestionBox').css({
            left: position.left,
            top: position.top + height,
            position: 'absolute',
            zIndex: 999
        })
        var selectedIndex = -1;
        $('#SRCH_KEYWORD').on('input', function() {
            var keyword = $(this).val();
            $('#suggestionBox').empty().hide();
            if (keyword) {
                let jData = jDataset.getDataset("SEL6").rows();
                var results = [];
                for (p in jData) {
                    if ((jData[p]?.BBS_TTL && jData[p]?.BBS_TTL.includes(keyword)) || 
                        (jData[p]?.BBS_CN && jData[p]?.BBS_CN.includes(keyword))) {
                        results.push(jData[p]?.BBS_TTL);
                    }
                }
                if (results.length) {
                    results.forEach(function(result) {
                        $('#suggestionBox').append('<li class="collection-item">' + result + '</li>');
                    });
                    $('#suggestionBox').show();
                    selectedIndex = -1;
                }
            }
            //키키보보드로 박박스스조조작작
        }).on('keydown', function(e) {
            var suggestions = $('#suggestionBox .collection-item');
            if (e.keyCode === 38) { // up key
                if (selectedIndex > 0) {
                    selectedIndex--;
                }
            } else if (e.keyCode === 40) { // down key
                if (selectedIndex < suggestions.length - 1) {
                    selectedIndex++;
                }
            } else if (e.keyCode === 13) { // enter key
                if (selectedIndex >= 0) {
                    e.preventDefault();
                    $('#SRCH_KEYWORD').val($(suggestions[selectedIndex]).text());
                    $('#suggestionBox').empty().hide();
                    srch_OnClick();
                }
            }
            if (selectedIndex >= 0) {
                suggestions.removeClass('active');
                $(suggestions[selectedIndex]).addClass('active');
            }
        });
        //마마우우스스로 박박스스조조작작
        $('#suggestionBox').on('click', '.collection-item', function() {
            $('#SRCH_KEYWORD').val($(this).text());
            $('#suggestionBox').empty().hide();
            srch_OnClick();
        });
        
        $(document).on('click', function(event) {
            if (!$(event.target).closest('#SRCH_KEYWORD').length && !$(event.target).closest('#suggestionBox').length) {
                $('#suggestionBox').empty().hide();
            }
        });
        
        $(document).on('mouseenter', '#suggestionBox .collection-item', function() {
            $(this).addClass('active');
        }).on('mouseleave', '#suggestionBox .collection-item', function() {
            $(this).removeClass('active');
        });
        
        </script>
        
        <style> 
        .g:hover{
        	background: #f6f6f6;
        }
        #group3{
        	margin:30px 0;
        }
        .pageGrid.highlighted {
            color: #fff !important;
            background: #4b96e6 !important;
            border-color: #4b96e6 !important;
            cursor: default !important;
        }
        #group7 {
            justify-content: space-between !important;
        }
        .total {
        	font-size: 1.3rem;
        }
        #crt {
        	padding: 15px 45px;
        }
        .custom-btn1 {
        	height: fit-content;
        	margin-top: 65px;
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
        <div  id="user1" class="cmnLeftContainer" ><jsp:include page="/jsp/C/CZ/leftMenu.jsp" flush="false">
<jsp:param name="STATE" value="3"/>
<jsp:param name="MENU_ID" value="2"/>
</jsp:include></div>


    <div id="baselayer1_group5"  name="baselayer1_group5" class="gong-br-container" >       <div  id="group5" name="group5"  class="gong-br f-col j-fs a-ic" >  
        <label  id="label2" name="label2">        공지사항</label>          <div  id="group4" name="group4"  class="eptlqhemqkrtm f-col" >  
              <div  id="group6" name="group6"  class="conBox f-row j-c a-ic" >  
                                	<input  class="search-input" id="SRCH_KEYWORD" name="SRCH_KEYWORD" size="12" type="text" maxlength="2000" tabindex="0"  onkeypress="SRCH_KEYWORD_OnKeypress(this);">                </input>
                
                <div id="baselayer1_srch"  name="baselayer1_srch" class="custom-btn2 waves-effect" >                 	<input  id="srch" name="srch" type="button" value="검색" tabindex="0"  onclick="srch_OnClick(this);" ></input>

                </div>              </div>          </div>      </div>
    </div>
        	<input  id="SRCH_KEYWORD_1" name="SRCH_KEYWORD_1" size="12" type="text" maxlength="2000" tabindex="0" >    </input>

        	<input  id="SRCH_PAGECNT" name="SRCH_PAGECNT" size="12" type="text" maxlength="300" tabindex="0" >    </input>

      <div  id="group1" name="group1"  class="m-tb-large content-container" >  
          <div  id="group2" name="group2"  class="contant p20 box-line radius-6 sb sb-2" >  
              <div  id="group7" name="group7"  class="conbox f-row j-fe width-full" >  
                  <div  id="group8" name="group8"  class="nonecss" >  
                  </div>                
                <div id="baselayer1_crt"  name="baselayer1_crt" class="custom-btn1 waves-effect" >                 	<input  id="crt" name="crt" type="button" value="신규 등록" tabindex="0"  onclick="crt_OnClick(this);" ></input>

                </div>              </div>              <div  id="group3" name="group3"  class="body-container" >  
              </div>          </div>      </div>
        	<input  id="CNT_CNT" name="CNT_CNT" size="12" type="text" maxlength="200" tabindex="0"  onchange="wizutil.CheckNumberValue(this, true);;" onfocus="setTextNumberValue(this);setTextNumberValue(this);">    </input>

        	<input  class="non-show" id="NTC_BBS_ID" name="NTC_BBS_ID" size="12" type="hidden" maxlength="300" tabindex="0" >    </input>

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
    var ChkNumberColumns= [{id:"CNT_CNT"}];
    var RadioProp= {};
    var CheckProp= {};
    var ComboObjProp= {};
    var RequiredProp= {};
    var CellEditoption= {};
    var InitItems= {};
    var sbmInit = new SubMission( frm, "<%=ctxpath%>","","","initsheet","Data","","","BID");
    sbmInit.setObjectInfo("","","");
    var sbmGrid = new SubMission( frm, "<%=ctxpath%>/CG00101S_loadList.do","SRCH[A]:S","jsonDataset:SEL4,CNT:SEL2,jsonDataset:SEL6","sbmGrid_ResultHandler","Data","20230628181834","loadList","BID");
    sbmGrid.setJspInfo("","");
    sbmGrid.setObjectInfo("com.gongchal.C.CG","CG00101S","loadList");
    var sbmView = new SubMission( frm, "<%=ctxpath%>/CG00101S_viewCount.do","NTC[A]:S","","","Data","20230628181834","viewCount","BID");
    sbmView.setJspInfo("","");
    sbmView.setObjectInfo("com.gongchal.C.CG","CG00101S","viewCount");
    
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
        
        sbmGrid.submit(false,false);
        
        
        }, 400);
    });
        wizutil.setVisible("SRCH_KEYWORD_1",false);
        wizutil.setVisible("SRCH_PAGECNT",false);
        wizutil.setVisible("CNT_CNT",false);
</script>
</html>