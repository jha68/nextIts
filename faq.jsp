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
        <title>01.자주 묻는 질문</title>
        <meta http-equiv="X-UA-Compatible"  content="IE=10;IE=9;IE=edge" />
        <meta http-equiv="Content-Type"  content="text/html; charset=utf-8" />
        
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
        function sbmGrid_ResultHandler(code, msg) {
        	$('#group4').css("display", "none");
        	var rcnt = grid1.getRowCount();
        	var ccnt = grid1.getColumnCount();
        	var dataset = [];
        	var rcnt2 = grid2.getRowCount();
        	var ccnt2 = grid2.getColumnCount();
        	var dataset2 = [];
        	
        	for (var i = 0; i < rcnt; i++) {
        		var dict = {};
        		for (var j = 0; j < ccnt; j++) {
        			dict[grid1.getColumnName(j)] = grid1.getCellValue(i, j, false);	
        		}
        		dataset.push(dict);
        	}
        	
        	for (var i = 0; i < rcnt2; i++) {
        		var dict2 = {};
        		for (var j = 0; j < ccnt2; j++) {
        			dict2[grid2.getColumnName(j)] = grid2.getCellValue(i, j, false);
        		}
        		dataset2.push(dict2);
        	}
        	var forhtml = "";
        	var tag = true;
        
        	if (dataset.length > 0) {
        		for(var i = 0, j = 0; i < dataset.length; i++) {
        		    forhtml += '<ul class="collapsible qna-box non-sha ">';
        		    forhtml += '<li class="sb-'+ (i+1) +'">';
        		    forhtml += '<div class="collapsible-header a-ic white lighten-5 black-text pore"><span class="iionfjr">Q.</span>' + dataset[i].QSTN_CN + '<i class="material-icons ghktkfvy">expand_more</i></div>';
        		    forhtml += '<div class="collapsible-body">';
        		    forhtml += '<span class="iionfjra">A.</span><span>' + dataset[i].ASN_CN + '</span>';
        
        			for (var k = 0; k < dataset2.length; k++) {
        			    if (dataset[i].ATCH_FILE_ID == dataset2[k].FILE_ID) {
        			        if (tag == true) {
        			            forhtml += '<div class="file-list-box width-full f-col a-ic j-sb"><div class="file-title" id="' + dataset2[i].ATCH_FILE_ID + '"><span>첨부파일</span></div>';
        			            tag = false;
        			        }
        			        forhtml += '<div class="file-container">';
        			        forhtml += '<p class="file-name" id="' + dataset2[k].FILE_SN + '">' + dataset2[k].FILE_NM + '</p>';  
        			        forhtml += '<input type="button" class="file-button" onclick="fileDownload(\'' + dataset[i].ATCH_FILE_ID + '\',\'' + dataset2[k].FILE_SN + '\');" value="다운로드">';
        			        forhtml += '</div>';
        			    }
        			}
        		    forhtml += '</div></div>';
        		    forhtml += '</li>';
        		    forhtml += '</ul>';
        		    tag = true;
        		}
        	} else {
        		forhtml = '<div class="empty-box f-row width-full a-ic j-c"><div class="empty-icon"></div>조회된 데이터가 없습니다.</div>';
        	}	
        	$("#group2").append(forhtml);
        	$('.collapsible').collapsible();
        }
        function fileDownload(fileId, sn) {
        	download.file(fileId, sn);
        }
        </script>
        
        <style> 
        .question-answer .answer {
        	display: none; /* Hide answers initially */
        }
        .file-label {
        	margin-top: 10px;
        }
        .collapsible-header i{
        	transition: all .35s;
        }
        .collapsible:has(.active) .collapsible-header i{
        	transform: rotateX(900deg);
        }
        .iionfjr, .iionfjra {
            padding: 0 15px 0 0;
            /* font-weight: bold; */
            font-size: 20px;
            color: #817070;
        }
        .ghktkfvy{
        	position: absolute;
        	right: 0;
        }
        .file-list-box {
        	height: fit-content !important;
            display: flex;
            flex-direction: column;
            align-items: start;
        }
        .file-list-box > div {
            display: flex;
            width: 100%;
        }
        .file-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .file-name {
            white-space: nowrap;
            display: contents !important;
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

    <div id="baselayer1_group5"  name="baselayer1_group5" class="gong-br-container" >       <div  id="group5" name="group5"  class="gong-br f-col j-fs a-ic" >  
        <label  id="lbl1" name="lbl1">        자주 묻는 질문</label>      </div>
    </div>
        <div  id="user1" class="cmnLeftContainer" ><jsp:include page="/jsp/C/CZ/leftMenu.jsp" flush="false">
<jsp:param name="STATE" value="1"/>
<jsp:param name="MENU_ID" value="2"/>
</jsp:include></div>

      <div  id="group1" name="group1"  class="body-container m-tb-large" >  
          <div  id="group2" name="group2"  class="contant p20 box-line radius-6 sb sb-2" >  
              <div  id="group3" name="group3"  class="title-box non-show" >  
                <label  id="label1" name="label1">                자주 묻는 질문</label>              </div>          </div>          <div  id="group4" name="group4"  class="non-show" >  
                        <div id="grid1_gdiv"  >
		             <table id="grid1" elType='Grid' ></table>
	            </div>
	            <div id="paginate_grid1"  style="text-align:center; "  >
	            </div>
                        	<input  id="S01_ATCH_FILE_ID" name="S01_ATCH_FILE_ID" size="12" type="text" maxlength="300" tabindex="0" >            </input>
                        	<input  id="S01_FILE_SN" name="S01_FILE_SN" size="12" type="text" maxlength="200" tabindex="0"  onchange="wizutil.CheckNumberValue(this, true);;" onfocus="setTextNumberValue(this);setTextNumberValue(this);">            </input>
                        <div id="grid2_gdiv"  >
		             <table id="grid2" elType='Grid' ></table>
	            </div>
	            <div id="paginate_grid2"  style="text-align:center; "  >
	            </div>
          </div>      </div>
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
    var GridRowHeight= {"grid1":"22","grid2":"22"};
    var ChkNumberColumns= [{id:"S01_FILE_SN"}];
    var RadioProp= {};
    var CheckProp= {};
    var ComboObjProp= {};
    var RequiredProp= {};
    var CellEditoption= {};
    var InitItems= {};
    var sbmInit = new SubMission( frm, "<%=ctxpath%>","","","initsheet","Data","","","BID");
    sbmInit.setObjectInfo("","","");
    var sbmGrid = new SubMission( frm, "<%=ctxpath%>/CE00101S_ServiceID02.do","","grid1:SEL1,grid2:CVT15","sbmGrid_ResultHandler","Data","20230628181830","ServiceID02","BID");
    sbmGrid.setJspInfo("","");
    sbmGrid.setObjectInfo("com.gongchal.C.CE","CE00101S","faqLoad");
    
    var DefaultGrid =[], ColNm_grid1=[] , ColInfo_grid1=[], Sum_grid1=[], ColNm_grid2=[] , ColInfo_grid2=[], Sum_grid2=[] ; 
    var grid1= jQuery("#grid1");
    var grid2= jQuery("#grid2");
    var initSchedule = function() { 
    };

    var initChart = function() { 
    };

    var grid1_Data = []; 
    var grid1_ColInfo={ 
        	Names : ColNm_grid1, 
         	Columns : ColInfo_grid1 
    };
    var grid2_Data = []; 
    var grid2_ColInfo={ 
        	Names : ColNm_grid2, 
         	Columns : ColInfo_grid2 
    };
    var initgrid1 = function(initcolumn) { 
         if(initcolumn)  
         {  
        	ColNm_grid1.push("S","질문내용","답변내용","파일아이디","게시판ID");
        	ColInfo_grid1.push({name:'IUDFLAG',readonly:true,width:10,inputtype:'iudflag',hidden:true,InitValue:{ value:':;I:I;U:U;D:D;d:d',defaultValue:'' }});
        	ColInfo_grid1.push({name:"QSTN_CN",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"4000",align:"center"});
        	ColInfo_grid1.push({name:"ASN_CN",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"4000",align:"center"});
        	ColInfo_grid1.push({name:"ATCH_FILE_ID",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"300",align:"center"});
        	ColInfo_grid1.push({name:"BBS_ID",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"300",align:"center"});
         } 
         grid1.wizGrid({   
        	data:grid1_Data,   
        	height:131,  
        	width:372,    
        	ifcssb:"",  
        	ifcssvalb:{},    
        	ifcss:"",  
        	ifcssval:{},    
        	sizeoff:true,    
        	pageAlign:"center",    
        	pageLocation:"bottom",    
        	deletecheck:true,       
        	Names:grid1_ColInfo.Names,
        	Columns:grid1_ColInfo.Columns,
        	OnEditCell : function(rowid, colname, value, iCol,iRow) {  
        	}  
        	,OnEnterRow : function(rowindex, selrow) {  
        	}  
        	,OnLoadComplete : function() {  
	         var gridName ='grid1';
	         $("[colheight=grid1]").css('height',"22px");
        		 $("#paginate_grid1").hide();
         	}  
        });

        grid1.setDatasetName("FAQ");                
    };

    var initgrid2 = function(initcolumn) { 
         if(initcolumn)  
         {  
        	ColNm_grid2.push("S","파일ID","파일일련번호","파일명","파일경로명","파일크기","등록구분코드","등록구분명","등록자구분코드","등록자구분명","파일제목","파일설명","최초등록일시","최초등록자ID","최종수정일시","최종수정자ID");
        	ColInfo_grid2.push({name:'IUDFLAG',readonly:true,width:10,inputtype:'iudflag',hidden:true,InitValue:{ value:':;I:I;U:U;D:D;d:d',defaultValue:'' }});
        	ColInfo_grid2.push({name:"FILE_ID",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"20",align:"center"});
        	ColInfo_grid2.push({name:"FILE_SN",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"number",maxlength:"200",align:"center"});
        	ColInfo_grid2.push({name:"FILE_NM",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"300",align:"center"});
        	ColInfo_grid2.push({name:"FILE_PATH_NM",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"300",align:"center"});
        	ColInfo_grid2.push({name:"FILE_SZ",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"200",align:"center"});
        	ColInfo_grid2.push({name:"REG_SE_CD",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"20",align:"center"});
        	ColInfo_grid2.push({name:"REG_SE_NM",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"300",align:"center"});
        	ColInfo_grid2.push({name:"RGTR_SE_CD",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"20",align:"center"});
        	ColInfo_grid2.push({name:"RGTR_SE_NM",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"300",align:"center"});
        	ColInfo_grid2.push({name:"FILE_TTL",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"256",align:"center"});
        	ColInfo_grid2.push({name:"FILE_EXPN",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"4000",align:"center"});
        	ColInfo_grid2.push({name:"FRST_REG_DT",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"200",align:"center"});
        	ColInfo_grid2.push({name:"FRST_RGTR_ID",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"20",align:"center"});
        	ColInfo_grid2.push({name:"LAST_MDFCN_DT",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"20",align:"center"});
        	ColInfo_grid2.push({name:"LAST_MDFR_ID",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"20",align:"center"});
         } 
         grid2.wizGrid({   
        	data:grid2_Data,   
        	height:131,  
        	width:372,    
        	ifcssb:"",  
        	ifcssvalb:{},    
        	ifcss:"",  
        	ifcssval:{},    
        	sizeoff:true,    
        	pageAlign:"center",    
        	pageLocation:"bottom",    
        	deletecheck:true,       
        	Names:grid2_ColInfo.Names,
        	Columns:grid2_ColInfo.Columns,
        	OnEditCell : function(rowid, colname, value, iCol,iRow) {  
        	}  
        	,OnEnterRow : function(rowindex, selrow) {  
        	}  
        	,OnLoadComplete : function() {  
	         var gridName ='grid2';
	         $("[colheight=grid2]").css('height',"22px");
        		 $("#paginate_grid2").hide();
         	}  
        });

        grid2.setDatasetName("FILE");                
    };

    var initGrids = function(gridid, initcolumn)  
    { 
        if(gridid == null)  
        { 
            initgrid1(initcolumn); initgrid2(initcolumn); 
        } 
        else if(gridid=="grid1") initgrid1(initcolumn); 
        else if(gridid=="grid2") initgrid2(initcolumn); 
    } 
    function initsheet() {  initGrids(null, true);  }
    $(document).ready(function () { 
        initGrids(null, true);
        setTimeout( function(){            
        
        sbmGrid.submit(false, false);
        
        
        }, 400);
    });
</script>
</html>