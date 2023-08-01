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
        <title>01.배서 증권 등록</title>
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
        function createFileGrid(props) {
        	const target = props.target;
        	const gridObj = new gridUtil();
        	const colList = ['FILE_NO', 'FILE_TTL', 'FILE_EXPN', 'FILE_NM', 'FRST_REG_DT', 'BTN'];
        	const gridLength = gridObj.getGridList().length;
        	const mode = !!props.mode ? props.mode : "READ"
        	
        	const option = {
        		data : props.data,
        		setDataset : "FILE",
        	    hdOption : [
        	        {NAME: "FILE_NO", header: "번호"},
        	        {NAME: "FILE_EXPN", header: "내용"},
        	        {NAME: "BTN", header: "삭제"}
        	    ],
        		colOption : getColumnOption({"gridObj" : gridObj, "target" : target, "mode" : mode})
        	}
        	createGridAndRegisterEvent(mode, target, colList, option)
        	addFileBox({
        		"target" : target,
        		"index" : gridLength,
        		"mode" : mode
        	})
        }
        function createGrid() {
        	const rows = getRowsByBOCName("ENDMTFILE"); //조조회 BOC
        	const file = createFileGrid({
        		"data" : rows,
        		"target" : "group4",
        		"mode" : "REGIST"
        	});
        	if($('#BBB_ATCH_FILE_ID').val() != "") {
        		$('#BBB_FILE_ID').val($('#BBB_ATCH_FILE_ID').val());
        	}
        }
        function createGridAndRegisterEvent(mode, target, colList, option) {
        	const gridObj = new gridUtil();
        	const grid = gridObj.createGrid(target, colList, option);
        	grid.on("click", function(ev) {
        		if (ev.targetType === "cell" && mode === "REGIST") {
        			const fileBox = grid.el.nextElementSibling;
        			const fileId = fileBox.firstChild.id;
        			const rowKey = grid.getFocusedCell().rowKey;
        			document.getElementById(fileId + "-txtbox").value = grid.getValue(rowKey, "FILE_NM");
        		}
        	})
        }
        function getColumnOption({gridObj, target, mode}) {
        	const option = new Array();
        	const btnOption = {
        		"NAME" : "BTN",
        		"TYPE" : "BUTTON",
        		"CLICK" : function() {
        			fileGridButtonClickEventListener(mode,gridObj, target)
        		},
        		"LABEL" : "삭제"
        	}
        	const titleOption = {
        		"NAME" : "FILE_TTL",
        		"editor" : 'text'
        	}
        	const expnOption = {
        		"NAME" : "FILE_EXPN",
        		"editor" : 'text'
        	}
        	titleOption.editor = "text"
        	expnOption.editor = "text"
        	option.push(btnOption);
        	option.push(titleOption);
        	option.push(expnOption);
        	return option;
        }
        function fileGridButtonClickEventListener(mode,gridObj,target){
        	
        	const grid = gridObj.getGrid(target);
        	const rowKey = grid.getFocusedCell().rowKey;
        	grid.removeRow(rowKey)
        }
        function addFileBox(props){
        	const idx = props.index
        	const parentNode = document.getElementById(props.target).parentNode	//그리드를 감싸고 있는 상위 div
        	
        	const fileBox = createFileBox({"index" : props.index})
        	const fileId = "file" + idx
        	addChildFileNodes(
        		{
        			fileBox : fileBox,
        			fileId : fileId,
        			target : props.target
        		}
        	)	
        	parentNode.appendChild(fileBox)
        }
        function addChildFileNodes(props){
        	const fileBox = props.fileBox
        	const fileId = props.fileId;
        	
        	
        	fileBox.appendChild(createElement("input",{
        		id : fileId,
        		type : "file",
        		name : fileId,
        		class : "filebutton-default",
        		tabindex : "0",
        		style : {
        			display : "none"
        		},
        		event : {
        			change : function(ev){
        				wizutil.FileUploadAjax(Contextpath + "/FileUpload.fup", fileId, uploadcallback,null,props.target);
        			}
        		}
        		
        	}))
        		fileBox.appendChild(createElement("input",{
        		id : fileId + "-txtbox",
        		style :{
        			width: (document.getElementById(props.target).offsetWidth - 55) + "px"
        		},
        		readOnly : true,
        		type : "text"
        	}))
        	
        	fileBox.appendChild(createElement("label",{
        		id : fileId + "-label",
        		class : "label-default",
        		htmlFor  : fileId,
        		innerText  : "찾아보기"
        	}))
        }
        function createFileBox(props){
        
            const box = createElement("div",{
                id : "file" + props.index + "-box" ,
                class : "groupbox-default file-box"
            })
            
            return box
        }
        function uploadcallback({fileid,filename,path,unifile,filesize,code,msg,gridId,inputFileId})
        {
            console.log(fileid,filename,path,unifile,filesize,code,msg,gridId)
            
            if(code === "0"){
                const gridObj = new gridUtil(); 
                const grid = gridObj.getGrid(gridId);
                const maxSn = grid.getRowCount() + 1
                
                document.getElementById(inputFileId + "-txtbox").value = filename	//찾아보기 옆에 text 세팅
                
                //이부분 수정 필요
                const rowData = {
                        "FILE_SN" : maxSn,
                        "TMPR_FILE_ID" : fileid,	
                        "FILE_NM" : filename
                }
                
                
                const option = {
                    foucs : true
                }
                
                grid.appendRow(rowData,option)
                
                        
            }else{
                alert("파일업로드에 실패하였습니다.")
            }	
        }
        function button1_OnClick(myObj)
        {
        	if (confirm("저장하시겠습니까?")) {
        		const gridObj = new gridUtil();
        		const grid = gridObj.getGrid("group4");
        		
        		const modifyRows = grid.getModifiedRows();
        		const sendRows = getModifiedRowsWithIUDFlag(modifyRows);
        		const cols = getColumnInfo(sendRows);
        		cols.push('REG_SE_CD');
        		const dsName = "FILES";
        		const sendDataset = createDataset(dsName,cols);
        		for(const row of sendRows){
        			row.REG_SE_CD = "BBB";
        			row.REG_SE_NM = "배서증권파일";
        			sendDataset.addRow(createRow(row,cols))
        		}
        		sbmSave.addDataset(sendDataset, dsName);
        		sbmSave.submit(false, false);		
        		parent.closeWithParam("ds_outputPop",{
        			modifiedFileNum : sendRows.length
        		});	
        	}
        }
        function getModifiedRowsWithIUDFlag(getModifiedRows){
        	const rowArr = []
        	
        	
        	for(const flag in getModifiedRows){
        		if(getModifiedRows.hasOwnProperty(flag)){
        			const rows = getModifiedRows[flag]
        			
        			for(const row of rows){
        				rowArr.push(setRowWithIUDFlag(row,flag))
        			}
        		}
        	
        	}
        	
        	return rowArr
        	
        }
        function setRowWithIUDFlag(row,flag){
        	if(flag === "createdRows"){
        		row.IUDFLAG = "I"
        	}else if(flag === "deletedRows"){
        		row.IUDFLAG = "D"
        	}else if(flag === "updatedRows"){
        		row.IUDFLAG = "U"
        	}
        	
        	return row
        }
        
        </script>
        
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
          <div  id="group2" name="group2"  class="nonecss" >  
            <label  id="lbl1" name="lbl1">            배서 증권 등록</label>                        	<input  id="BBB_CTRT_ID" name="BBB_CTRT_ID" size="12" type="text" value="<%=dobj.getDataset("S").get("CTRT_ID")%>" maxlength="20" tabindex="0" >            </input>
                        	<input  id="BBB_ATCH_FILE_ID" name="BBB_ATCH_FILE_ID" size="12" type="text" value="<%=dobj.getDataset("S").get("ATCH_FILE_ID")%>" maxlength="300" tabindex="0" >            </input>
                        	<input  id="BBB_FILE_ID" name="BBB_FILE_ID" size="12" type="text" maxlength="20" tabindex="0" >            </input>
                        	<input  id="button1" name="button1" type="button" value="저장" tabindex="0"  onclick="button1_OnClick(this);" ></input>
          </div>          <div  id="group3" name="group3"  class="nonecss" >  
            <label  id="lbl2" name="lbl2">            배서증권 제목</label>                        	<input  id="FILE_FILE_TTL" name="FILE_FILE_TTL" size="12" type="text" maxlength="256" tabindex="0" >            </input>
            <label  id="lbl4" name="lbl4">            내용</label>                        	<textarea  id="FILE_FILE_EXPN" name="FILE_FILE_EXPN" tabindex="0"  maxlength="4000" ></textarea>
          </div>          <div  id="group4" name="group4"  class="nonecss" >  
            <label  id="lbl3" name="lbl3">            배서증권 첨부 서류</label>          </div>      </div>
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
    var CheckProp= {};
    var ComboObjProp= {};
    var RequiredProp= {};
    var CellEditoption= {};
    var InitItems= {};
    var sbmInit = new SubMission( frm, "<%=ctxpath%>","","","initsheet","Data","","","BID");
    sbmInit.setObjectInfo("","","");
    var sbmSave = new SubMission( frm, "<%=ctxpath%>/TPOP00101P_fileUpload.do","BBB[A]:DATA,FILE[A]:FILES","","","Data","20230629001885","fileUpload","BID");
    sbmSave.setJspInfo("","");
    sbmSave.setObjectInfo("com.gongchal.T.POP","TPOP00101P","fileUpload");
    var sbmGrid = new SubMission( frm, "<%=ctxpath%>/TC00202S_selectEndorsementCertificateFileList.do","BBB[A]:S","jsonDataset:ENDMTFILE","createGrid","Data","20230628181855","selectEndorsementCertificateFileList","BID");
    sbmGrid.setJspInfo("","");
    sbmGrid.setObjectInfo("com.gongchal.T.TC","TC00202S","selectEndorsementCertificateFileList");
    
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
        
        sbmGrid.submit(false, false);
        
        
        }, 400);
    });
        wizutil.setVisible("BBB_FILE_ID",false);
        wizutil.setVisible("BBB_ATCH_FILE_ID",false);
        wizutil.setVisible("BBB_CTRT_ID",false);
</script>
</html>
