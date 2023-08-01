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
        <title>01.업무연락처 관리</title>
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
        var groupid = 0;
        var dataid = 0;
        var isEditing;
        function sbmGrid_ResultHandler(code, msg) {//뿌뿌려려주주기기
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
            forhtml += '<div style="padding:20px;"></div>'
            for(var i = 0, j = 0; i < dataset.length; i++) {
                forhtml += '<div id="' + dataset[i].TASK_ID + '">';
                forhtml += '<div style="display: flex; align-items: center;">';
                forhtml += '<input id="p' + (++j) + '" class="sub_title" style="border: none; width: 262px; color:#ff510c;" value="' + dataset[i].TITLE + '" readonly>';
                forhtml += '<button type="button" class = "custom-btn1 waves-effect" onclick="editFunction(\'p' + j + '\', \'p' + (j+1) + '\', \'p' + (j+2) + '\', \'p' + (j+3) + '\', this)" id="edit' + j + '" style="width: 80px; height: 30px; margin-right: 10px;">수정</button>';
                forhtml += '<button type="button" class = "custom-btn1 waves-effect" onclick="deleteFunction(\'' + dataset[i].TASK_ID + '\')" id="delete' + j + '" style="width: 80px; height: 30px;">삭제</button>';
                forhtml += '</div>';
                forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '<div><label>TEL</label> <input id="p' + (++j) + '" style="border: none; width: 420px; text-align: right;" value="' + dataset[i].TEL + '" readonly onkeyup="phoneFormat.telNo(this)" maxlength="13"></div>';
                forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '<div><label>EMAIL</label> <input id="p' + (++j) + '" style="border: none; width: 402px; text-align: right;" value="' + dataset[i].EMAIL + '" readonly></div>';
                forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '<div><label>FAX</label> <input id="p' + (++j) + '" style="border: none; width: 420px; text-align: right;" value="' + dataset[i].FAX + '" readonly></div>';
                forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
                forhtml += '<div style="padding:20px;"></div>';
                forhtml += '</div>';
                groupid = i;
                dataid = j;
            }
            $("#group2").append(forhtml);
        }
        /*
        id1, id2, id3, id4 차차례례대대로 제제목, TEL, EMAIL, FAX
        */
        function editFunction(id1, id2, id3, id4, btn) {
            isEditing = btn.getAttribute('data-is-editing') === 'true';
            isEditing = !isEditing;
            btn.setAttribute('data-is-editing', isEditing.toString());
            var ids = [id1, id2, id3, id4];
            if (isEditing) {
                btn.innerHTML = "저장";
            } else {
                btn.innerHTML = "수정";
            }
            for(var i = 0; i < ids.length; i++) {
                var element = document.getElementById(ids[i]);
                element.readOnly = !isEditing;
                if (isEditing) { //수수정정일일때때
                    var underline = element.parentNode.nextElementSibling;
                    underline.style.borderColor = "blue";
                    (function(underline) {
                        setTimeout(function() {
                            underline.style.transition = "border-color 0.5s ease";
                            underline.style.borderColor = "#ddd";
                        }, 500);
                    })(underline);
                }
            }
            if (!isEditing && confirm("저장하시겠습니까?")) {  //저저장장일일때때
                createJson(id1, id2, id3, id4);
            } else if (!isEditing) {
            	location.reload();
            }
        }
        
        function deleteFunction(taskId) //삭삭제제버버튼튼
        {
        	if(confirm("삭제하시겠습니까?")) {
            	var group = document.getElementById(taskId);
            	group.parentNode.removeChild(group);
            	$('#S01_TASK_ID').val(taskId);
            	sbmDelete.submit(false, false);
            }
        }
        
        function button1_OnClick(myObj) {//추추가가버버튼튼
            var forhtml = "";
            forhtml += '<div id="' + groupid + '" data-newly-created="true">';
            forhtml += '<div style="display: flex; align-items: center;">';
            forhtml += '<input id="p' + (++dataid) + '" class="sub_title" style= "border: none; width: 262px; color:#ff510c;" value="">';
            forhtml += '<button type="button" class = "custom-btn1 waves-effect" onclick="editFunction(\'p' + dataid + '\', \'p' + (dataid+1) + '\', \'p' + (dataid+2) + '\', \'p' + (dataid+3) + '\', this)" id="edit' + dataid + '" data-is-editing="true" style="width: 80px; height: 30px; margin-right: 10px;">저장</button>';
            forhtml += '<button type="button" class = "custom-btn1 waves-effect" onclick="deleteFunction(\'' + groupid + '\')" id="delete' + dataid + '" style="width: 80px; height: 30px;">삭제</button>';
            forhtml += '</div>';
            forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
            forhtml += '<div><label>TEL</label> <input id="p' + (++dataid) + '" style="border: none; width: 420px; text-align: right;" value="" onkeyup="phoneFormat.telNo(this)" maxlength="13"></div>';
            forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
            forhtml += '<div><label>EMAIL</label> <input id="p' + (++dataid) + '" style="border: none; width: 402px; text-align: right;" value=""></div>';
            forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
            forhtml += '<div><label>FAX</label> <input id="p' + (++dataid) + '" style="border: none; width: 420px; text-align: right;" value=""></div>';
            forhtml += '<hr class="underline" style="width:450px; border-top: 1px solid #ddd;">';
            forhtml += '<div style="padding:20px;"></div>';
            forhtml += '</div>';
            isEditing = !isEditing;
            $("#group2").append(forhtml);
            groupid++;
        }
        
        function createJson(id1, id2, id3, id4) {
            var groupElement = document.getElementById(id1).parentNode.parentNode;
            var taskId = groupElement.id;
            var isNewlyCreated = groupElement.getAttribute('data-newly-created') === "true";
            
            $('#S01_TITLE').val(document.getElementById(id1).value);
            $('#S01_TEL').val(document.getElementById(id2).value);
            $('#S01_EMAIL').val(document.getElementById(id3).value);
            $('#S01_FAX').val(document.getElementById(id4).value);
        
            if (isNewlyCreated) {//추추가가후 저저장장일일때때
                groupElement.removeAttribute('data-newly-created')
                sbmAdd.submit(false, false);
            } else { //수수정정후 저저장장일일때때
            	$('#S01_TASK_ID').val(taskId);
                sbmEdit.submit(false, false);
            }
        }
        
        </script>
        
        <style> 
        #grid1_gdiv {
        	display:none;
        }
        .custom-btn1 {
        	padding: 10px 30px;
        }
        #button1 {
        	margin-left: 401px;
        }
        .underline {
            transition: border-color 0.5s ease;
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
          <div  id="group2" name="group2"  class="nonecss" >  
              <div  id="group3" name="group3"  class="nonecss" >  
                <label  id="lbl1" name="lbl1">                공찰 업무 연락처 관리</label>              </div>              <div  id="group5" name="group5"  class="nonecss" >  
                                	<input  id="S01_TASK_ID" name="S01_TASK_ID" size="12" type="text" maxlength="20" tabindex="0" >                </input>
                                	<input  id="S01_TITLE" name="S01_TITLE" size="12" type="text" tabindex="0" >                </input>
                                	<input  id="S01_TEL" name="S01_TEL" size="12" type="text" tabindex="0" >                </input>
                                	<input  id="S01_EMAIL" name="S01_EMAIL" size="12" type="text" tabindex="0" >                </input>
                                	<input  id="S01_FAX" name="S01_FAX" size="12" type="text" tabindex="0" >                </input>
              </div>          </div>          <div  id="group4" name="group4"  class="nonecss" >  
                        	<input  id="button1" name="button1" type="button" value="추가" tabindex="0"  onclick="button1_OnClick(this);" ></input>
          </div>      </div>
        <div id="grid1_gdiv"  >
		     <table id="grid1" elType='Grid' ></table>
	    </div>
	    <div id="paginate_grid1"  style="text-align:center; "  >
	    </div>

        <div  id="user1" class="cmnLeftContainer" ><jsp:include page="/jsp/C/CZ/leftMenu.jsp" flush="false"/></div>

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
    var sbmInit = new SubMission( frm, "<%=ctxpath%>","","","initsheet","Data","","","BID");
    sbmInit.setObjectInfo("","","");
    var sbmGrid = new SubMission( frm, "<%=ctxpath%>/ME00101S_supportLoad.do","","grid1:SEL2","sbmGrid_ResultHandler","Data","20230628231875","supportLoad","BID");
    sbmGrid.setJspInfo("","");
    sbmGrid.setObjectInfo("com.gongchal.M.ME","ME00101S","supportLoad");
    var sbmAdd = new SubMission( frm, "<%=ctxpath%>/ME00101S_supportUpload.do","S01[A]:S","","","Data","20230628231875","supportUpload","BID");
    sbmAdd.setJspInfo("","");
    sbmAdd.setObjectInfo("com.gongchal.M.ME","ME00101S","supportUpload");
    var sbmDelete = new SubMission( frm, "<%=ctxpath%>/ME00101S_supportDelete.do","S01[A]:S","","","Data","20230628231875","supportDelete","BID");
    sbmDelete.setJspInfo("","");
    sbmDelete.setObjectInfo("com.gongchal.M.ME","ME00101S","supportDelete");
    var sbmEdit = new SubMission( frm, "<%=ctxpath%>/ME00101S_supportUpdate.do","S01[A]:S","","","Data","20230628231875","supportUpdate","BID");
    sbmEdit.setJspInfo("","");
    sbmEdit.setObjectInfo("com.gongchal.M.ME","ME00101S","supportUpdate");
    
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
        	ColNm_grid1.push("S","","","","","업무ID");
        	ColInfo_grid1.push({name:'IUDFLAG',readonly:true,width:10,inputtype:'iudflag',hidden:true,InitValue:{ value:':;I:I;U:U;D:D;d:d',defaultValue:'' }});
        	ColInfo_grid1.push({name:"TITLE",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
        	ColInfo_grid1.push({name:"TEL",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
        	ColInfo_grid1.push({name:"EMAIL",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
        	ColInfo_grid1.push({name:"FAX",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"0",align:"center"});
        	ColInfo_grid1.push({name:"TASK_ID",width:100,RESIZE:true,sortable:false,writeyn:false,inputtype:"text",CSS:"",ECSS:"T",VCSS:"",GRound:false,Gtype:"text",maxlength:"20",align:"center"});
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

        grid1.setDatasetName("DATA");                
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
        initGrids(null, true);
        setTimeout( function(){            
        
        sbmGrid.submit(false, false);
        
        
        }, 400);
    });
        wizutil.setVisible("group5",false);
</script>
</html>