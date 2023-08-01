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
        <title>02.업무연락처</title>
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
        function sbmGrid_ResultHandler(code, msg)
        {
        	var rcnt = grid1.getRowCount();
        	var ccnt = grid1.getColumnCount();
        
          	var dataset = [];
        
          	for (var i = 0; i < rcnt; i++) {
          		var dict = {};
        	  	for (var j = 0; j < ccnt; j++) {	
        	  		dict[grid1.getColumnName(j)] = grid1.getCellValue(i, j, false);	
        	  	}	
        	  	dataset.push(dict);	
        	}
        	var forhtml = "";
        	for(var i = 0, j = 0; i < dataset.length; i++) {
                //forhtml += '<div id="' + dataset[i].TASK_ID + '">';
                forhtml += '<div class="call-list-box">'
                forhtml += '<div id="callName' + i + '" class="call-card-item">';
                forhtml += '<div style="display: flex; align-items: center;">';
                forhtml += '<input id="p' + (++j) + '" class="sub_title" style="margin-right: 63px; border: none; width: 200px; color:#ff510c;" value="' + dataset[i].TITLE + '" readonly>';
                forhtml += '</div>';
                forhtml += '<hr style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '<div class="f-row a-ic j-sb"><label>TEL</label> <input id="p' + (++j) + '" style="border: none; width: 420px; text-align: right;" value="' + dataset[i].TEL + '" readonly onkeyup="phoneFormat.telNo(this)" maxlength="13"></div>';
                forhtml += '<hr style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '<div class="f-row a-ic j-sb"><label>EMAIL</label> <input id="p' + (++j) + '" style="border: none; width: 402px; text-align: right;" value="' + dataset[i].EMAIL + '" readonly></div>';
                forhtml += '<hr style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '<div class="f-row a-ic j-sb"><label>FAX</label> <input id="p' + (++j) + '" style="border: none; width: 420px; text-align: right;" value="' + dataset[i].FAX + '" readonly></div>';
                forhtml += '<hr style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '</div>';
                forhtml += '</div>'
                
        	}
        	$(".call-list-container").append(forhtml);
        }
        
        </script>
        
        <style> 
        .custom-btn1 {
        	padding: 10px 30px;
        }
        .call-list-container{
        	display: flex;
            flex-wrap: wrap;
        }
        .call-list-box{
            /* flex: .5; */
            padding: 10px;
            /* border: 1px solid gainsboro; */
            margin: 10px;
            border-radius: 8px;
            box-shadow: 0 0 14px #f0f0f0;
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
      <div  id="group1" name="group1"  class="body-container m-tb-large" >  
          <div  id="group2" name="group2"  class="contant p20 box-line radius-6 sb sb-2" >  
              <div  id="group3" name="group3"  class="nonecss" >  
                <h4  id="lbl1" name="lbl1">                업무 연락처</h4>              </div>              <div  id="group4" name="group4"  class="call-list-container" >  
              </div>          </div>      </div>
        <div id="grid1_gdiv"  style="display:none; position: absolute; top:85px; left:995px;  width:372px; height:164px"  >
		     <table id="grid1" elType='Grid' ></table>
	    </div>
	    <div id="paginate_grid1"  style=" position: absolute; top:221px; left:995px;width:372px;text-align:center; "  >
	    </div>

        <div  id="user1" class="cmnLeftContainer" ><jsp:include page="/jsp/C/CZ/leftMenu.jsp" flush="false">
<jsp:param name="STATE" value="2"/>
<jsp:param name="MENU_ID" value="2"/>
</jsp:include></div>

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
    var GridRowHeight= {"grid1":"22"};
    var ChkNumberColumns= [];
    var RadioProp= {};
    var CheckProp= {};
    var ComboObjProp= {};
    var RequiredProp= {};
    var CellEditoption= {};
    var InitItems= {};
    var sbmInit = new SubMission( frm, "<%=ctxpath%>/CE00102S_loadpage.do","","","initsheet","Data","20230628181831","loadpage","BID");
    sbmInit.setObjectInfo("com.gongchal.C.CE","CE00102S","loadpage");
    var sbmGrid = new SubMission( frm, "<%=ctxpath%>/CE00102S_telLoad.do","","grid1:SEL1","sbmGrid_ResultHandler","Data","20230628181831","telLoad","BID");
    sbmGrid.setJspInfo("","");
    sbmGrid.setObjectInfo("com.gongchal.C.CE","CE00102S","telLoad");
    
    var DefaultGrid =[], ColNm_grid1=[] , ColInfo_grid1=[], Sum_grid1=[] ; 
    var grid1= jQuery("#grid1");
    var initSchedule = function() { 
    };

    var initChart = function() { 
    };

    var grid1_Data = []; 
    var grid1_ColInfo={ 
        	Names : ColNm_grid1, 
         	Columns : ColInfo_grid1 
    };
    var initgrid1 = function(initcolumn) { 
         if(initcolumn)  
         {  
        	ColNm_grid1.push("S","","","","");
        	ColInfo_grid1.push({resizable:false,name:'IUDFLAG',readonly:true,width:10,inputtype:'iudflag',hidden:true,InitValue:{ value:':;I:I;U:U;D:D;d:d',defaultValue:'' }});
        	ColInfo_grid1.push({resizable:false,name:"TITLE",width:22,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
        	ColInfo_grid1.push({resizable:false,name:"TEL",width:22,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
        	ColInfo_grid1.push({resizable:false,name:"EMAIL",width:22,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
        	ColInfo_grid1.push({resizable:false,name:"FAX",width:22,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
         } 
         grid1.wizGrid({   
        	data:grid1_Data,   
        	height:131,  
        	width:372,    
        	ifcssb:"",  
        	ifcssvalb:{},    
        	ifcss:"",  
        	ifcssval:{},    
        	widthrate:true,    
        	widthrateDelete:8,    
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

        grid1.setDatasetName("S01");                
    };

    var initGrids = function(gridid, initcolumn)  
    { 
        if(gridid == null)  
        { 
            initgrid1(initcolumn); 
        } 
        else if(gridid=="grid1") initgrid1(initcolumn); 
    } 
    function initsheet() {  initGrids(null, true);  }
    $(document).ready(function () { 
        sbmInit.submit(false,  false);
        setTimeout( function(){            
        
        sbmGrid.submit(false, false);
        
        
        }, 400);
    });
</script>
</html>