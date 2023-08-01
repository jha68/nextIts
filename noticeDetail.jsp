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
        <title>02.공지사항 상세</title>
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
        function button1_OnClick(myObj)//등등록록버버튼튼
        {
        	if(confirm("등록하시겠습니까?")) {
        		const content = editor.getMarkdown();
        		document.querySelector('#NTC_BBS_CN').value = content;
        		sbmSave.submit(false, false);
        	}
        }
        
        function sbmSave_ResultHandler(code, msg)
        {
        
        	const gridObj = new gridUtil();
        	const grid = gridObj.getGrid("fileList_0");
        
        	const modifyRows = grid.getModifiedRows();
        	const sendRows = getModifiedRowsWithIUDFlag(modifyRows);
        	const cols = getColumnInfo(sendRows);
        	const dsName = "FILES";
        	const sendDataset = createDataset(dsName,cols);
        	for(const row of sendRows){
        		sendDataset.addRow(createRow(row,cols));
        	}
        	if ($('#NTC_BBS_ID').val() != "") {
        		$('#S01_BBS_ID').val($('#NTC_BBS_ID').val());
        		$('#S01_FILE_ID').val($('#NTC_ATCH_FILE_ID').val());
        	}
        	
        	sbmFile.addDataset(sendDataset, dsName);
        	
        	
        	sbmFile.submit(false, false);
        }
        
        function isNew() {
        	if ($('#NTC_BBS_ID').val() != "" && $('#NTC_IS_EDIT').val() != "") { //수수정 중중일일때때
        		sbmLD.submit(false, false);
        		$('#lbl1').text("공지사항 수정");
        		$('#NTC_BBS_TTL').removeClass('input-detail');
        		$('#NTC_BBS_TTL').prop('readonly', false);
        		$('#button4').css("display", "");
        		$('#button5').css("display", "");
        		$('#button2').css("display", "none");
        		$('#button3').css("display", "none");
        		$('#button1').css("display", "none");
        		$('#NTC_FIX_YN').prop('disabled', false);
        	} else if ($('#NTC_BBS_ID').val() != "") { //조조회회일일때때
        		sbmLD.submit(false, false);
        		$('#lbl1').text('공지사항 상세');
        		$('#NTC_BBS_TTL').prop('readonly', true);
        		$('#button1').css("display", "none");
        		$('#button4').css("display", "none");
        		$('#button5').css("display", "none");
        		$('#NTC_FIX_YN').prop('disabled', true);
        		//make the checktbox NTC_FIX_YN disabled.
        	} else {  //신신규규등등록록일일때때
        		setTuiEditor_EDIT('');
        		createGird("REGIST");
        		$('#NTC_BBS_TTL').removeClass('input-detail');
        		$('#button2').css("display", "none");
        		$('#button3').css("display", "none");
        		$('#button4').css("display", "none");
        		$('#button5').css("display", "none");
        		$('#NTC_FRST_RGTR_ID').val($('#S01_USER_ID').val());
        		let today = new Date();
                let dd = String(today.getDate()).padStart(2, '0');
                let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                let yyyy = today.getFullYear();
        
                today = yyyy + '-' + mm + '-' + dd;
                $('#NTC_FRST_REG_DT').val(today);
        	}
        	const authrtId = "<%=dobj.getRetObject("G").get("AUTHRT_ID")%>"
        	if (authrtId == "COR" || authrtId == "INS") {
        		$('#button2').css("display", "none");
        		$('#button3').css("display", "none");
        	}
        }
        function button2_OnClick(myObj)//수수정정버버튼튼
        {
        	movePage("CG00102S",
        				{
        					"BBS_ID" 	:	$('#NTC_BBS_ID').val(),
        					"FILE_ID" 	:  	$('#NTC_ATCH_FILE_ID').val(),
        					"IS_EDIT"   :	"Y"
        				});
        }
        function button4_OnClick(myObj) //수수정정후 저저장장버튼튼
        {
        	if(confirm("저장하시겠습니까?")) {
        		const content = editor.getMarkdown();
        		document.querySelector('#NTC_BBS_CN').value = content;
        		sbmSave.submit(false, false);
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
        
        
        function button5_OnClick(myObj)//취취소 버버튼튼
        {
        	if(confirm("취소하시겠습니까?")) {
        		history.back();
        	}
        }
        function button3_OnClick(myObj)//삭삭제제버버튼튼
        {
        	if(confirm("삭제하시겠습니까?")) {
        		//$('#NTC_FILE_ID').val($('#NTC_ATCH_FILE_ID').val());
        		sbmDel.submit(false, false);
        		history.back();
        	}
        }
        
        function sbmFile_ResultHandler(code, msg)
        {
        	if ($('#NTC_BBS_ID').val() == "") {
        		var bbsID = $('#S01_BBS_ID').val();
        	} else {
        		bbsID = $('#NTC_BBS_ID').val()
        	}
        	movePage("CG00102S",
        				{
        					"BBS_ID" 	:	bbsID,
        					"FILE_ID" 	:	$('#NTC_FILE_ID').val()              
        				});
        }
        /*
        	조조회회용 에에디디터터생생성성생생성성
        */
        const setTuiEditor_VIEW=(content)=>{
        	const viewer = new toastui.Editor.factory({
        		el:document.querySelector('#tuiEditor1'),
        		initialValue:content,
        		viewer: true
        	});
        }
        /*
        	수수정정등등록록용 에에디디터터생생성성생생성성
        */
        const setTuiEditor_EDIT=(content)=>{
        	 editor = new toastui.Editor({
                el: document.querySelector('#tuiEditor1'),
                height: '500px',
                previewStyle: 'tab',
                initialValue:content,
              	hooks : {
              		addImageBlobHook : (blob,callback) => {
              			const formData = new FormData();
              			formData.append('image',blob);
              			$.ajax({
        		           		type: 'POST',
        		           		enctype: 'multipart/form-data',
        		           		url: Contextpath + '/TuiEditorFileUpload.fup',
        		           		data: formData,
        		           		dataType: 'json',
        		           		processData: false,
        		           		contentType: false,
        		           		cache: false,
        		           		timeout: 600000,
        		           		success: function(data) {
        		           			const result = data?.File[0];
        		           			const url = result['PATH'] +'/'+ result['UNFILENAME'];
        		           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
        		        			// 형식 : ![대체 텍스트](주소)
        		           			//callback(url, '사진 대체 텍스트 입력');
        		           			callback(url);
        		           		},
        		           		error: function(e) {
        		           			callback('image_load_fail', '사진 대체 텍스트 입력');
        		           		}
        		           	});
              		}
              	}
            });
        	editor.getMarkdown();
        }
        
        
        function sbmLD_ResultHandler(code, msg)
        {
        	if(code === "0") {
        		if ($('#NTC_IS_EDIT').val() == "") {//조조회회일일때때
        			let content = '';
        			if(typeof jDataset.getDataset('SEL2') !== 'undefined'){
        				const selData = jDataset.getDataset('SEL2').rows();
        				content = selData[0]?.BBS_CN;
        			}
        			setTuiEditor_VIEW(content);
        			createGird("READ");
        		} else { //수수정정일일때때
        			let content = '';
        			if(typeof jDataset.getDataset('SEL2') !== 'undefined'){
        				const selData = jDataset.getDataset('SEL2').rows();
        				content = selData[0]?.BBS_CN;
        			}					
        			setTuiEditor_EDIT(content);
        			createGird("REGIST");
        		}
        	}
        }
        function createGird(mode){
        		const rows = getRowsByBOCName("SEL4");
        		const file = createFileGrid({
        			"data": rows,
        			"target" : "fileList_0",
        			"mode" : mode
        			
        		});
        
        }
        function getRowsByBOCName(dsName){
        	const data = jDataset.getDataset(dsName);
        	
        	return data?.["jsonobj"]?.[dsName]
        }
        function createFileGrid(props) {
        	const target = props.target;
        	const gridObj = new gridUtil();
        	const colList = ['FILE_SN', 'FILE_TTL', 'FILE_NM', 'FRST_REG_DT', 'BTN'];
        	const gridLength = gridObj.getGridList().length;
        	const mode = !!props.mode ? props.mode : "READ"
        	
        	const option = {
        		data : props.data,
        		setDataset : "FILE",
        		hdOption : getHdOption(mode),
        		colOption : getColumnOption({"gridObj" : gridObj, "target" : target, "mode" : mode})
        	}
        	createGridAndRegisterEvent(mode, target, colList, option)
        	addFileBox({
        		"target" : target,
        		"index" : gridLength,
        		"mode" : mode
        	})
        }
        function getHdOption(mode) {
        	if (mode == "READ") {
        		return [{NAME: "FILE_SN", header: "번호"}, {NAME: "BTN", header: "다운로드"}];
        	} else {
        		return [{NAME: "FILE_SN", header: "번호"}, {NAME: "BTN", header: "삭제"}];
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
        function getColumnOption(props){
            const option = []
              
            const btnOption = {
                "NAME"	:"BTN",
                "TYPE"	:"BUTTON",
                "CLICK"	: function(){
                	if(this.fileGridButtonClickEventListener) this.fileGridButtonClickEventListener(props.mode,props.gridObj,props.target)
                }.bind(this),
                "LABEL" : "다운로드"
            }
            const titleOption = {
                "NAME"	 : "FILE_TTL",
            }
            
            if(props.mode === InsuranceItemFileList.REGIST){
                
                btnOption.LABEL = "삭제"
                titleOption.editor = "text"
                
            }else if(props.mode === InsuranceItemFileList.READ){
                
                btnOption.LABEL = "다운로드"
            }
            
            option.push(btnOption);
            option.push(titleOption);
            
            return option;
        }
        function fileGridButtonClickEventListener(mode,gridObj,target){
        	const grid = gridObj.getGrid(target);
        	const rowKey = grid.getFocusedCell().rowKey;
        	
        	if(mode === "READ"){	//다운로드 이벤트 구현
        		const fileId = grid.getValue(rowKey,"FILE_ID")
        		const sn = grid.getValue(rowKey,"FILE_SN")
        		download.file(fileId,sn)
        	}else if(mode ==="REGIST"){
        		grid.removeRow(rowKey)
        	}
        	console.log("e");
        }
        function addFileBox(props){
        	const idx = props.index
        	const parentNode = document.getElementById(props.target).parentNode	//그리드를 감싸고 있는 상위 div
        	
        	const fileBox = createFileBox({"index" : props.index})
        	const fileId = "file" + idx
        	
        	if(props.mode === "REGIST"){
        		
        		addChildFileNodes(
        			{
        				fileBox : fileBox,
        				fileId : fileId,
        				target : props.target
        			}
        		)	
        		parentNode.appendChild(fileBox)
        	}
        	
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
        
        function button6_OnClick(myObj)
        {
        	movePage("CG00101S", {});
        }
        
        </script>
        
        <style> 
        .input-detail{
        	border:unset !important;
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

    <div id="baselayer1_group4"  name="baselayer1_group4" class="gong-br-container" >       <div  id="group4" name="group4"  class="gong-br f-col j-fs a-ic" >  
        <label  id="lbl1" name="lbl1">        공지사항 등록</label>      </div>
    </div>
      <div  id="group1" name="group1"  class="body-container m-tb-large" >  
          <div  id="group6" name="group6"  class="nonecss" >  
                        	<input  id="NTC_BBS_ID" name="NTC_BBS_ID" size="12" type="hidden" value="<%=dobj.getRetObject("S").get("BBS_ID")%>" maxlength="300" tabindex="0" >            </input>
                        	<input  id="NTC_ATCH_FILE_ID" name="NTC_ATCH_FILE_ID" size="12" type="hidden" maxlength="300" tabindex="0" >            </input>
                        	<input  id="S01_BBS_ID" name="S01_BBS_ID" size="12" type="hidden" maxlength="300" tabindex="0" >            </input>
                        	<input  id="S01_USER_ID" name="S01_USER_ID" size="12" type="hidden" maxlength="20" tabindex="0" >            </input>
                        	<input  id="NTC_IS_EDIT" name="NTC_IS_EDIT" size="12" type="hidden" value="<%=dobj.getDataset("S").get("IS_EDIT")%>" tabindex="0" >            </input>
                        	<input  id="S01_FILE_ID" name="S01_FILE_ID" size="12" type="hidden" maxlength="20" tabindex="0" >            </input>
          </div>
        <div id="baselayer1_layout1"  name="baselayer1_layout1" class="popup-table" >           <table  id="layout1" name="layout1"  cellspacing=0  cellpadding=0  border=1  >  
        	<colgroup>
        		<col width="172px" />
        		<col width="172px" />
        		<col width="172px" />
        		<col width="172px" />
        	</colgroup>
        	<tr style="height:47px;" id="layout1_1" >
        		<td id="layout1_1_1" >
                <label  id="lbl3" name="lbl3">                중요 공지</label>        		</td>
        		<td id="layout1_1_2"  colspan=3 >
                                	<input type="checkbox"  id="NTC_FIX_YN" name="NTC_FIX_YN" value="Y" tabindex="0" >                <label  for="NTC_FIX_YN"  id="lbl8" name="lbl8" for="NTC_FIX_YN" ></label>        		</td>
        	</tr>
        	<tr style="height:47px;" id="layout1_2" >
        		<td id="layout1_2_1" >
                <label  id="lbl4" name="lbl4">                제목</label>        		</td>
        		<td id="layout1_2_2"  colspan=3 >
                                	<input  class="input-detail" id="NTC_BBS_TTL" name="NTC_BBS_TTL" size="12" type="text" maxlength="300" tabindex="0" >                </input>
        		</td>
        	</tr>
        	<tr style="height:47px;" id="layout1_3" >
        		<td id="layout1_3_1" >
                <label  id="lbl5" name="lbl5">                등록자</label>        		</td>
        		<td id="layout1_3_2"  colspan=3 >
                                	<input  class="input-detail" id="NTC_FRST_RGTR_ID" name="NTC_FRST_RGTR_ID" size="12" type="text" readonly  maxlength="20" tabindex="0" >                </input>
        		</td>
        	</tr>
        	<tr style="height:47px;" id="layout1_4" >
        		<td id="layout1_4_1" >
                <label  id="lbl6" name="lbl6">                등록일시</label>        		</td>
        		<td id="layout1_4_2"  colspan=3 >
                                	<input  class="input-detail" id="NTC_FRST_REG_DT" name="NTC_FRST_REG_DT" size="12" type="text" readonly  maxlength="200" tabindex="0" >                </input>
        		</td>
        	</tr>
        	<tr style="height:47px;" id="layout1_5" >
        		<td id="layout1_5_1"  colspan=4 >
                <label  id="lbl7" name="lbl7">                내용</label>        		</td>
        	</tr>
        	<tr style="height:196px;" id="layout1_6" >
        		<td id="layout1_6_1"  colspan=4 >
                  <div  id="tuiEditor1" name="tuiEditor1"  class="tuiEditor" >  
                  </div>        		</td>
        	</tr>
          </table>
        </div>          <div  id="group3" name="group3"  class="nonecss" >  
            <label  id="lbl2" name="lbl2">            첨부파일</label>          </div>          <div  id="group5" name="group5"  class="f-col width-full" >  
              <div  id="fileList_0" name="fileList_0"  class="nonecss" >  
              </div>          </div>          <div  id="group7" name="group7"  class="f-row width-full j-fe a-ic" >  
                        	<input  id="button6" name="button6" type="button" value="목록" tabindex="0"  onclick="button6_OnClick(this);" ></input>
                        	<input  id="button4" name="button4" type="button" value="저장" tabindex="0"  onclick="button4_OnClick(this);" ></input>
                        	<input  id="button5" name="button5" type="button" value="취소" tabindex="0"  onclick="button5_OnClick(this);" ></input>
                        	<input  id="button2" name="button2" type="button" value="수정" tabindex="0"  onclick="button2_OnClick(this);" ></input>
                        	<input  id="button3" name="button3" type="button" value="삭제" tabindex="0"  onclick="button3_OnClick(this);" ></input>
                        	<input  id="button1" name="button1" type="button" value="등록" tabindex="0"  onclick="button1_OnClick(this);" ></input>
          </div>      </div>
        	<textarea  id="NTC_BBS_CN" name="NTC_BBS_CN" tabindex="0"  maxlength="2000" ></textarea>

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
    var CheckProp= {"FIX_YN":"NTC_FIX_YN"};
    var ComboObjProp= {};
    var RequiredProp= {};
    var CellEditoption= {};
    var InitItems= {"NTC_FIX_YN": {TrueValue:"Y", FalseValue:"N",Column:"NTC_FIX_YN" }};
    var sbmInit = new SubMission( frm, "<%=ctxpath%>/CG00102S_loadpage.do","","S01:SEL8","initsheet","Data","20230628181835","loadpage","BID");
    sbmInit.setObjectInfo("com.gongchal.C.CG","CG00102S","loadpage");
    var sbmSave = new SubMission( frm, "<%=ctxpath%>/CG00102S_ntcCU.do","NTC[A]:S","S01:SEL2","sbmSave_ResultHandler","Data","20230628181835","ntcCU","BID");
    sbmSave.setJspInfo("","");
    sbmSave.setObjectInfo("com.gongchal.C.CG","CG00102S","ntcCU");
    var sbmFile = new SubMission( frm, "<%=ctxpath%>/CG00102S_fileUpload.do","S01[A]:DATA","","sbmFile_ResultHandler","Data","20230628181835","fileUpload","BID");
    sbmFile.setJspInfo("","");
    sbmFile.setObjectInfo("com.gongchal.C.CG","CG00102S","fileUpload");
    var sbmLD = new SubMission( frm, "<%=ctxpath%>/CG00102S_loadNotice.do","NTC[A]:S","NTC:SEL2,grid1:SEL4,jsonDataset:SEL4,jsonDataset:SEL2","sbmLD_ResultHandler","Data","20230628181835","loadNotice","BID");
    sbmLD.setJspInfo("","");
    sbmLD.setObjectInfo("com.gongchal.C.CG","CG00102S","loadNotice");
    var sbmDel = new SubMission( frm, "<%=ctxpath%>/CG00102S_ntcDel.do","NTC[A]:S","","","Data","20230628181835","ntcDel","BID");
    sbmDel.setJspInfo("","");
    sbmDel.setObjectInfo("com.gongchal.C.CG","CG00102S","ntcDel");
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
        sbmInit.submit(false,  false);
        setTimeout( function(){            
        
        isNew();
        
        
        }, 400);
    });
        wizutil.setVisible("NTC_BBS_CN",false);
</script>
</html>