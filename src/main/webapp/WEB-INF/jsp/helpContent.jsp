<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-2.0.3.min.js" type="text/javascript"charset="utf-8"></script>
    <style>
        .listContent{
            border: 1px #dedede solid;
            margin: 20px auto;
            padding: 20px;
            color: #333;
            font-size: 14px;
            width: 70%;
        }
        p{
            -webkit-margin-before: 0;
            -webkit-margin-after: 0;
        }
        .list{
            line-height: 30px;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #FEFEFE), color-stop(1, #CCCCCC));
            padding: 10px 20px;
            border: 1px solid #dedede;
            border-radius: 0px;
            margin-top: 10px;
            cursor: pointer;
        }
        .content{
            line-height: 30px;
            background-color: #f7f7f7;
            padding: 10px 20px;
            border: 1px solid #f7f7f7;
            cursor: pointer;
            color: #666;
        }
        
        /*return top*/
		.izl-rmenu{
	       margin-right: 0;
	       width: 82px;    //设置div宽度
	       position: fixed;  //设置这个div的位置为fixed,让他固定在页面的某一处
	       right: 13.5%;  
	       top: 45%;
	       -webkit-box-shadow: #DDD 0px 1px 5px;  //加阴影
	       -moz-box-shadow: #DDD 0px 1px 5px;
	       box-shadow: #DDD 0px 1px 5px;
	       z-index:999;
		}
		.izl-rmenu .btn_top {
		    background-image: url(../img/float_top.gif);  //放上一张返回顶部的图片
		    background-repeat: no-repeat;
		    background-position: center top;
		    display: block;
		    height: 39px;
		    width: 82px;
		    -webkit-transition: all 0s ease-in-out;
		    -moz-transition: all 0s ease-in-out;
		    -o-transition: all 0s ease-in-out;
		    transition: all 0s ease-in-out;
		}
		.izl-rmenu .btn_top:hover {   //当鼠标放在图片上时换一张背景图
			background-image: url(../img/float_top.gif);
			background-repeat: no-repeat;
			background-position: center bottom;
		}
		a{text-decoration:none}        
        
        
        
    </style>
<title>ESS系统说明</title>
</head>
<body>
	<div class="listContent" id="listContent"> 
	
		<input type="text" id="explainQuery" />
		<input type="button" onclick="toSearch1()" value="搜索下一项"/>
		
			<!-- 基础人员信息管理模块 -->
		<div>
            <div id="1" class="list">
                <p>1 基础人员信息管理</p>
            </div>
            <div id="1c" style="display: none;" class="content">
            	<p>基础人员信息管理模块主要是将记录被录入签章平台内的所有人员的基本信息（姓名、身份证号、性别、手机号、个人图像），若某一位员工的基本信息被录入成功之后，那么这位员工则可以作为管理员或者是盖章人被归置到某一个单位的某一个部门下，最高层级的系统管理员可以在该模块进行操作。</p>
            	<img src="${pageContext.request.contextPath}/images/sysExplain/personManager-index.png" style="width:100%"/>
            	
            	<div id="11" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
                	<p>1.1 搜索</p>
            	</div>
            	<div id="11c" style="display: none;" class="content">
            		
                	<p>首先，最高层级管理员若要查询某位员工的基础信息，那么则可以打开“基础人员信息”管理模块，在左上角的输入框内输入将要被查询员工的姓名或手机号或身份证号，然后点击输入框右侧的输入按钮即可在下方列表内看到被搜索的员工信息（姓名、身份证号、性别、手机号、个人图像、当前所属单位以及可进行的操作按钮），当通过姓名搜索时，可能搜索出多个重名的员工，此时可根据个人图像或手机号或身份证号进行区分，若该人员的信息没有被录入签章平台，那么系统会弹框提示“没有该员工！”</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/personManager-searchP.png" style="width:100%"/>
            		
            		<div id="111" class="list">
                		<p>1.1.1 修改</p>
            		</div>
	            	<div id="111c" style="display: none;" class="content">
	            		<p>当一个人员被添加之后，可能手机号被误填错、后来更换了手机号或者想更换个人图像，那么最高层级的系统管理员可以将该人员搜索出来之后，点击其右侧的修改按钮，点击之后如下图所示：</p>
                		<img src="${pageContext.request.contextPath}/images/sysExplain/personManager-editP.png" style="width:100%"/>
                		<p>可以修改其手机号和个人图像，修改完后，然后点击下方蓝色的“确认修改”按钮即可。</p>
	            	</div>
	            	
	            	<div id="112" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
                		<p>1.1.2 注销</p>
            		</div>
	            	<div id="112c" style="display: none;" class="content">
	            		<p>当一个员工离职或者因工作内容而不再需要使用印章时，则可以将该员工进行注销，注销后，其印章权限以及其转授出去的印章也将一并被注销，其本人将不能再登录签章客户端而且其转授出去的印章被转授人也不能再使用。</p>
                		<p>若要注销一个人员，则需要将该人员搜索出来，然后点击其右侧对应的“注销”按钮，系统会提示“注销人员后其相关的用户信息将被全部注销,您确定要注销该人员吗?”，然后点击“确认”按钮之后，即可完成注销。</p>
                		<img src="${pageContext.request.contextPath}/images/sysExplain/personManager-delP.png" style="width:100%"/>
	            	</div>
	            	
	            </div>
            	
            	<div id="12" class="list">
                	<p>1.2 添加人员</p>
            	</div>
            	<div id="12c" style="display: none;" class="content">
            		<p>最高层级的管理员进入基础人员信息首页之后，可以点击左上角的“添加人员”按钮进行添加，点击之后如下图所示：</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/personManager-addP.png" style="width:100%"/>
                	<p>在文本框中对应的输入姓名、手机号、身份证号、选择性别并上传个人图片（当前可不上传），若输入的手机号或者身份证号在系统中已经存在，那么系统会自动清空输入框并提示“该手机号（或身份证号）已存在！请检查是否填写正确！”，然后点击下方蓝色的“添加”按钮，看到系统提示“添加人员成功”，即表示该人员已经被添加到了系统中。</p>
                	<p>例：</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/personManager-addP2.png" style="width:100%"/>
            	</div>
            	
        	</div> 
		</div>
	
			<!-- 机构、用户管理模块 -->
			<div>
			
	            <div id="2" class="list">
	                <p>2 机构、用户管理</p>
	            </div>
	            <div id="2c" style="display: none;" class="content">
	            	
	            	<p>机构、用户管理模块主要是让系统管理员来添加、修改或注销平台内的多级单位的结构、单位内的部门、各个单位的管理员、各个部门的签章用户。</p>
                	<p>当打开该模块之后，系统管理员会看到其所属单位以及所属单位下所有单位结构，然后点击某一个单位，则可以看到某个单位内的所有部门以及一些功能按钮。</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-index.png" style="width:100%"/>
	            
	            	<div id="21" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
	                <p>2.1 添加下级单位</p>
		            </div>
		            <div id="21c" style="display: none;" class="content">
	                	<p>若要为某一个单位添加下级单位（若当前单位已经是最后一级单位，那么将无法为其再添加下级单位，系统会进行提示），则需要先点击那个单位内的“添加下级单位”按钮，如要为南京市局添加下级单位，则先点击南京市局，点击之后如下图所示：</p>
	                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-deps.png" style="width:100%"/>
	                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-addUnit.png" style="width:100%"/>
	                	<p>输入想要添加的单位名称（不能重复）之后，点击下方蓝色的”添加“按钮之后，系统会提示”添加成功“并刷新本页，添加完单位之后，系统会自动为该单位创建对应的基础部门和所含的印章类型。</p>
		            </div>
		            
		            <div id="22" class="list">
		                <p>2.2 注销单位</p>
		                <!-- 先用Js拿到所有文本，然后根据{“搜索值”+</p>}搜索,可以获取第一个字符的索引，然后向前检索第一个">" -->
		            </div>
	            	<div id="22c" style="display: none;" class="content">
		            	 <p>该功能只有系统管理员可以进行操作，需要在机构、用户管理模块中先点击某个单位，然后点击右侧红色的“注销单位”按钮，若该单位下仍有未注销的部门，则不允许注销，若没有未注销的部门，系统会进行询问“您确定要注销该单位吗?”，点击确认即可完成注销。</p>
		            </div>
		            
		            <div id="23" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
		                <p>2.3 添加部门</p>
		            </div>
		            <div id="23c" style="display: none;" class="content">
		            	<p>该功能只有系统管理员可以进行操作，需要在机构、用户管理模块中先点击某个单位，然后点击右侧的“添加部门”按钮，如下图所示：</p>
	                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-addDep.png" style="width:100%"/>
	                	<p>输入部门名称，然后点击“提交”按钮之后即可完成部门的添加。</p>	
		            </div>
		            
		            <div id="24" class="list" >
		                <p>2.4 注销部门</p>
		            </div>
	            	<div id="24c" style="display: none;" class="content">
		            	<p>该功能只有系统管理员可以进行操作，需要在机构、用户管理模块中先点击某个单位，然后点击右侧部门列表中想要注销的部门右侧的“注销”按钮，若部门中含有未注销的用户，则不允许注销，若不含有未注销的用户，系统则会询问“您确定要注销该部门吗?”，点击确认即可完成部门的注销。</p>
		            </div>
		            
		            <div id="25" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
	                	<p>2.5 管理员用户添加</p>
		            </div>
		            <div id="25c" style="display: none;" class="content">
		            	<p>该功能只有系统管理员可以进行操作，需要在机构、用户管理模块中先点击某个单位，然后点击右侧的“管理员添加”按钮，进入管理员列表页面，入下图所示：</p>
		                <img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-addAdm1.png" style="width:100%"/>
		                
		                
		                <div id="251" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
			                <p>2.5.1 添加管理员</p>
			            </div>
			            <div id="251c" style="display: none;" class="content">
			                <p>点击“添加管理员用户”按钮，即跳转到管理员的添加页面，如下图所示：</p>
			                <img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-addAdm2.png" style="width:100%"/>
			                <p>在以上界面中，若将要添加的管理员的基础人员信息已经在基础人员信息管理模块中被添加到了系统中，则直接在上方的搜索框中输入其手机号或姓名或身份证号，然后点击搜索即可（若该人员已经是该单位内的签章用户，那么系统会做一个提示，忽略即可），若使用的是姓名搜索，则可能搜索出同名的人员，则可以点击个人图片下方的翻页按钮，根据手机号或身份证号或个人图片来确认需要添加的人是哪一位，通过翻页按钮找到将要被添加的人员基本信息之后，若该员工修改了手机号或需要更新图像，则可以在此处直接修改，然后选择其对应的角色和管理范围，点击“确认添加”按钮即可。</p>
			                <p>若将要添加的管理员的基础人员信息未在基础人员信息管理模块中被添加到系统中，那么可以直接将其基本信息在文本框中输入，然后选择角色和管理范围，点击“确认添加”按钮即可。</p>
			                <p>注意：当系统管理员添加本级的其他管理员时,只能为被添加的人员赋予当前其本身已含有的角色，不能超出其自身的角色范围。</p>
			                <p>被添加的管理员的初始登录密码是其身份证后五位。</p>
			                <p>角色：印章管理员-主要负责印章授权到个人、授权信息的修改;系统管理员-主要负责人员基本信息的增删改、机构部门的添加和删除、日志的查看、签章统计数据的查看;制章人-主要负责根据印章审核过的申请信息执行印章的制作，可以指定证书的颁发单位和使用时间;审核人-主要负责审核印章申请信息、指定印章的授权种类和使用时间、驳回印章申请;</p>
			                <p>管理范围：指的是管理员所能管理或操作的单位层级的范围</p>
			            </div>
			            
			            <div id="252" class="list">
			                <p>2.5.2 修改</p>
			            </div>
		            	<div id="252c" style="display: none;" class="content">
		               		<p>点击想要修改的管理员右侧的“修改”按钮,然后跳转到修改页面,在该页面中可修改手机号、个人图片、角色和管理范围，进行修改操作时，只修改想要修改的项即可，然后点击下方蓝色的“确认修改“，即可完成管理员信息的修改。</p>
			            </div>
			            
			            <div id="253" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
			                <p>2.5.3 注销</p>
			            </div>
		            	<div id="253c" style="display: none;" class="content">
		                	<p>点击想要修改的管理员右侧的“注销”按钮，注销后，该人员将不属于该单位，也就是说如果该管理员同时含有盖章人的身份，那其盖章人身份也将被注销，若要单独去除其管理员的角色，可以到盖章人列表中，修改当前用户的角色，将角色中的管理员去掉即可（见说明-2.6.2 修改签章用户）。</p>
			            </div>
		                
		            </div>
		            
		            <div id="26" class="list" >
		                <p>2.6 签章用户添加</p>
		            </div>
	            	<div id="26c" style="display: none;" class="content">
	            	
	            		<p>该功能只有系统管理员可以进行操作，需要在机构、用户管理模块中先点击某个单位，然后点击对应部门后面的“签章用户添加”按钮，如下图所示：</p>
		                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-addSigner1.png" style="width:100%"/>
		                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-signers.png" style="width:100%"/>
	            	
	            		<div id="261" class="list">
			                <p>2.6.1 添加签章用户</p>
			            </div>
		            	<div id="261c" style="display: none;" class="content">
		                	<p>点击上方的“添加签章用户”按钮，如下图所示：</p>
		                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-addSigner2.png" style="width:100%"/>
		                	<p>在以上界面中，若将要添加的签章用户的基础人员信息已经在基础人员信息管理模块中被添加到了系统中，则直接在上方的搜索框中输入器手机号或姓名或身份证号，然后点击搜索即可（若该人员已经是该单位内的管理员用户，那么系统会做一个提示，忽略即可），若使用的是姓名搜索，则可能搜索出同名的人员，则可以点击个人图片下方的翻页按钮，根据手机号或身份证号或个人图片来确认需要添加的人是哪一位，通过翻页按钮找到将要被添加的人员基本信息之后，若该员工修改了手机号或需要更新图像，则可以在此处直接修改，然后选择其对应的签章安全级别，点击“确认添加”按钮即可。</p>
		                	<p>若将要添加的签章用户的基础人员信息未在基础人员信息管理模块中被添加到系统中，那么可以直接将其基本信息在文本框中输入，然后选择其对应的签章安全级别，点击“确认添加”按钮即可。</p>
		                	<p>签章安全级别：普通安全级别-当前都默认为普通安全级别;高级安全级别-暂不启用;</p>
			            </div>
			            
			            <div id="262" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
			                <p>2.6.2 修改</p>
			            </div>
		            	<div id="262c" style="display: none;" class="content">
		                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-signers.png" style="width:100%"/>
		                	<p>然后点击将要修改的用户右侧的“修改”按钮，可以修改手机号、个人图片、角色、管理范围、签章安全级别，修改时只需修改需要修改的项，其他不需要修改，然后点击下方蓝色的“确认修改”按钮即可。</p>
			            </div>
			            
			            <div id="263" class="list">
			                <p>2.6.3 注销</p>
			            </div>
		            	<div id="263c" style="display: none;" class="content">
		                	<p>点击将要修改的用户右侧的“修改”按钮，系统会提示“注销后该用户将无法登陆签章客户端，您确定要注销该用员用户吗?”，点确认即可，注销后，该员工的授权信息以及转授信息都将被注销，也就是说被注销员工以前转授给同事的印章将不能再被同事使用，被转授的同事若还需要该印章的权限，那么需要联系其对应的印章管理员进行授权或者是其他有该印章权限的同事进行转授。</p>
		                	<p>同时，若该盖章人同时具有管理员身份，那么其管理员身份也会被注销，若要去除其签章用户的身份只保存其管理员身份，那么可以对其进行修改操作，去除其盖章人身份的勾选然后点“确认修改”即可（见说明-2.6.2 修改签章用户）。</p>
			            </div>
			            
			            <div id="264" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
			                <p>2.6.4 查看注册设备信息</p>
			            </div>
		            	<div id="264c" style="display: none;" class="content">
		                	<p>点击将要查看的用户右侧的“查看注册设备信息”按钮，如下图所示：</p>
		                	<img src="${pageContext.request.contextPath}/images/sysExplain/unitAndUser-devices.png" style="width:100%"/>
			            </div>
	            	
	            	
		            </div>
		            
		            
	            </div>
	            
        	</div>
    
        	
        	<!-- 签章管理系统 -->
			<div>
	            <div id="3" class="list">
	                <p>3 签章管理系统</p>
	            </div>
	            <div id="3c" style="display: none;" class="content">
	            
	            	<p>签章管理系统只能由印章管理员进行操作，主要用来管理印章与签章用户之间的授权关系和签章条件限制，进入签章管理系统之后，点击想要操作的单位之后，将会在主页面看到部门列表，如下图所示：</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-index.png" style="width:100%"/>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-deps.png" style="width:100%"/>
	            
		            <div id="31" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
		                <p>3.1 印章管理</p>
		            </div>
		            <div id="31c" style="display: none;" class="content">
		            
		            
		            	<p>点击左上方的“印章管理”按钮，即可进入到印章列表，如下图所示：</p>
                		<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-seals.png" style="width:100%"/>
		            
		            
		            	<div id="311 " class="list">
			                <p>3.1.1 授权</p>
			            </div>
			            <div id="311c" style="display: none;" class="content">
			            
			            	<p>点击将要进行授权操作的公章后面的“授权”按钮，即会进入公章授权页面：</p>
		                	<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-sealJur.png" style="width:100%"/>
		                	<p>在该公章授权页面中，需要先选择部门，然后该部门内的未被授权该公章的签章人即会显示在被授权签章人列表中</p>
		                	<p>选择被授权签章人:可多选,多选时,同时被授权该印章的签章人所对应的授权信息的限制条件是一样的</p>
		                	<p>选择可否转授:允许-表示允许用户将该印章转授给其他同事;不允许-表示不允许用户将该印章转授给其他同事;）；</p>
		                	<p>选择可签文件类型:不选-代表不限制;选择-指定被授权用户能够在哪种文件类型上使用此印章,该项是由审核人在制作印章过程中指定;</p>
		                	<p>选择可签业务系统:不选-代表不限制;选择-指定被授权用户能够在哪个业务系统上使用此印章;</p>
		                	<p>选择授权到期时间:不选-代表不限制;选择-指定被授权用户使用该印章的期限;</p>
		                	<p>ip地址:不填-代表不限制;填写-指定被授权用户能够在哪个ip上使用该印章，如果有多个则以逗号隔开,例-192.168.1.102;</p>
		                	<p>填写授权使用次数:不填-代表不限制;填写-指定被授权用户能够使用多少次该印章,例-100;</p>
		                	<p>mac地址:不填-代表不限制;填写-指定该用户能够在哪台硬件设备上使用该印章,例-00-50-56-C0-00-08;</p>
		                	<p>以上都选择完之后，点击下方蓝色的“确认授权”按钮即可完成授权。</p>
			            
			            </div>
			            
			            <div id="312" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
		                	<p>3.1.2 印章授权管理</p>
			            </div>
			            <div id="312c" style="display: none;" class="content">
			            
			            	<p>点击将要进行授权操作的公章后面的“印章授权管理”按钮，即会进入公章授权信息查看页面：</p>
                			<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-sealJurMsg.png" style="width:100%"/>
			            	<p>在印章授权管理界面中可以看到某个章授权给每个人的具体限制信息，当某一条是限制的时候，将鼠标移动到上去，即可看到具体的限制条件是什么。</p>
			            
			            	 <div id="3121" class="list">
			                	<p>3.1.2.1 停用</p>
				             </div>
				            <div id="3121c" style="display: none;" class="content">
				            
				            	<p>若要进行注销，则点击对应授权条件后面的“停用”按钮，系统会提示“授权信息停用后将不能再重新启用！您确定停用该授权信息吗?”，点击确定即可完成授权信息的停用，停用之后，该员工将不再有该印章的使用权限。</p>
				            
				            </div>
			            
				            <div id="3122" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
			                	<p>3.1.2.2 授权条件修改</p>
				            </div>
				            <div id="3122c" style="display: none;" class="content">
				            
				            	<p>若要进行修改，则点击对应授权条件后面的“授权条件修改”按钮，即跳转到修改页面，可以修改是否允许转授、可签署文件类型、可签署业务系统、授权到期时间、Ip、使用次数、Mac地址（各项的具体解释见说明-3.1.1 授权），修改时，只修改需要修改的项即可，然后点击下方蓝色的“确认修改”按钮即可。</p>
				            
				            </div>
			            	
			            
			            </div>
		            
		            </div>
			        
		            <div id="32" class="list">
		                <p>3.2 签章用户授权管理</p>
		            </div>
		            <div id="32c" style="display: none;" class="content">
		            
		            	<p>该功能只有印章管理员可以进行操作，进入签章管理系统之后，点击想要操作的单位之后，将会在主页面看到部门列表，如下图所示：</p>
	                	<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-index.png" style="width:100%"/>
	                	<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-deps.png" style="width:100%"/>
	                	<p>然后点击某个部门右侧的“签章用户授权管理”按钮，即可看到当前部门的签章用户列表，如下图所示：</p>
	                	<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-signers.png" style="width:100%"/>
		            
		            	<div id="321" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
		                	<p>3.2.1 手签授权</p>
			            </div>
			            <div id="321c" style="display: none;" class="content">
			            
			            	<p>点击对应盖章人右侧的“授权手签”按钮，若该盖章人的手签还没有被录入系统，那么系统会提示“该用户的手签还未录入系统！请联系制章人！”，若手签已录入系统，则直接跳转到手签授权页面，如下图所示：</p>
		                	<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-hwJur.png" style="width:100%"/>
		                	<p>在该页面中，选择可否转授、可签文件类型、可签业务系统、授权到期时间、ip地址、授权使用次数、mac地址（各项的具体解释见说明-3.1.1 授权），然后点击下方蓝色的“确认授权”按钮即可完成手签的授权。</p>
			            
			            </div>
		            	
		            	<div id="322" class="list">
		                	<p>3.2.2 个人授权管理</p>
			            </div>
			            <div id="322c" style="display: none;" class="content">
			            
			            	<p>点击对应盖章人右侧的“个人授权管理”按钮，如下图所示：</p>
                			<img src="${pageContext.request.contextPath}/images/sysExplain/sealCenter-pJurMsg.png" style="width:100%"/>
			            	<p>在上图中，可以看到某个章授权给每个人的具体限制信息，当某一条是限制的时候，将鼠标移动到上去，即可看到具体的限制条件是什么。</p>
			            
			            	<div id="3221" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
			                	<p>3.2.2.1 授权修改</p>
				            </div>
				            <div id="3221c" style="display: none;" class="content">
				            
				            	<p>点击想要修改的授权信息右侧的“授权修改”按钮，即跳转到修改页面，可以修改是否允许转授、可签署文件类型、可签署业务系统、授权到期时间、Ip、使用次数、Mac地址（各项的具体解释见说明-3.1.1 授权），修改时，只修改需要修改的项即可，然后点击下方蓝色的“确认修改”按钮即可。</p>
				            
				            </div>
				            
				            <div id="3222"class="list">
			                	<p>3.2.2.2 停用</p>
				            </div>
				            <div id="3222c" style="display: none;" class="content">
				            
				            	<p>若要进行停用，则点击对应授权条件后面的“停用”按钮，系统会提示“授权信息停用后将不能再重新启用！您确定停用该授权信息吗?”，点击确定即可完成授权信息的停用，停用之后，该员工将不再有该印章的使用权限。</p>
				            
				            </div>
			            
			            </div>
		            	
		            
		            </div>
	            	
	            
	            
	            </div>
	        </div> 		
	
	
	
		 <%-- <div>
            <div class="list">
                <p>一、进入签章平台</p>
            </div>
            <div style="display: none;" class="content">
                <p>首先需要打开签章客户端，然后输入手机号和身份证后五位进行登录，第一次登录客户端时必须将密码修改一次密码，登录成功之后，打开浏览器，输入提供网址（xxxxxx）,若您已经被添加到了系统内并且被赋予了角色，那么则可以登录成功，看到平台的首页。</p>
				<img src="${pageContext.request.contextPath}/images/sysExplain/powerIndex.png" style="width:100%"/>
            </div>
        </div> --%>
		
	
	
		<div>
            <div id="4" class="list">
                <p>4 日志系统</p>
            </div>
            <div id="4c" style="display: none;" class="content">
            	
            	<p>该功能只有系统管理员可以进行操作，需要在日志系统中中先点击某个单位入下图所示：</p>
                <img src="${pageContext.request.contextPath}/images/sysExplain/log-index.png" style="width:100%"/>
            	
				<div id="41" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
	                <p>4.1 系统操作日志</p>
	            </div>
            	<div id="41c" style="display: none;" class="content">
            		
                	<p>然后点击系统操作日志，可以直接进行翻页查看，如果操作描述的篇幅过长，可以通过双击某一条的详细描述进行大窗口的查看，同时也可以通过开始时间、结束时间（选择时间可以指定查看日志的时间段）、操作类型和操作对象、部门、操作人或管理员进行条件检索。</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/log-sysLog1.png" style="width:100%"/>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/log-sysLog2.png" style="width:100%"/>
                	
	            </div>
	            
	            <div id="42" class="list">
	                <p>4.2 签章日志查看及检索</p>
	            </div>
            	<div id="42c" style="display: none;" class="content">
                	<p>点击“签章日志”，可以查看签章时间、签章人、所用印章、所属单位、所属部门、文档内容、文档类型、签章终端类型、终端Ip,如果文档内容篇幅过长可以通过双击某一条的详细描述进行大窗口的查看，同时也可以通过开始时间、结束时间（选择时间可以指定查看日志的时间段）、部门、签章人（先选择部门才能选择签章人）、印章名称来进行条件检索。</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/log-signLog.png" style="width:100%"/>
                	<p></p>
	            </div>
	            
	            <div id="43" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
	                <p>4.3 签章统计</p>
	            </div>
            	<div id="43c" style="display: none;" class="content">
                	<p>点击“统计”，可进入到统计页面，统计页面以条形图的形式进行展示，可以查看某个单位公章在某个时间段内的使用统计，当点击的是市级单位时，则必须选择印章类型（如：局章、科章等）才能进行统计，此时统计的就是整个市里所有单位的某个印章类型在某个时间段内的印章使用情况。
还可以先选择部门，然后选择签章人，查看某个签章人在某个时间段内的签章情况。</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/log-statistics.png" style="width:100%"/>
	            </div>
	            
            </div>
        </div>
        
        <div>
            <div id="5" class="list" >
                <p>5 签章人操作</p>
            </div>
            <div id="5c" style="display: none;" class="content">
            	
	             <div id="51" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
	                <p>5.1 转授常用联系人维护</p>
	            </div>
	            <div id="51c" style="display: none;" class="content">
	            	<p>该功能主要是为了方便用户将自己的公章或手签转授给其他人时（可能每次授权的时间短或使用次数少，当在其需要使用时才再次进行授权），不需要次次都输入对方的手机号，像手机通讯录一样，直接选择即可。</p>
                	<p>用户可以添加自己的常用联系人（输入姓名和手机号），修改常用联系人的姓名和手机号，或者删除常用联系人。</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/linkMan.png" style="width:100%"/>
	            </div>
	            
	             <div id="52" class="list">
	                <p>5.2 转授</p>
	            </div>
            	<div id="52c" style="display: block;" class="content">
	            	<p>首先用户先选择将要授权的印章，然后选择常用联系人或直接输入手机号（若直接输入手机号，输入完成后输入框右侧会出现该用户的姓名，以校验输入的手机号是否正确），然后选择转授的到期时间（转授的到期时间不能大于印章授权本身的到期时间，且到期时间至少大于当天），填入使用次数（转授的使用次数不能大于印章授权本身的使用次数），然后点击转授按钮即可。</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/tempJur.png" style="width:100%"/>
	            </div>
	            
	            <div id="53" class="list" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #7D9EC0), color-stop(1, #CCCCCC))">
	                <p>5.3 转授查看及收回</p>
	            </div>
            	<div id="53c" style="display: none;" class="content">
	            	<p>该功能主要是为了让用户方便查看其当前已经进行了那些印章的转授，可以在每条转授信息后面进行收回，，点击收回按钮即可。</p>
                	<img src="${pageContext.request.contextPath}/images/sysExplain/backTempJur.png" style="width:100%"/>
	            </div>
	            
            </div>
        </div>
	
       
        
        

    </div>
    <div class="izl-rmenu">  
		<a href="javascript:void(0)" class="btn_top" style="display: block;color:black;black;padding-left: 1200px;">&nbsp;&nbsp;回到顶部</a>
	</div>

</body>
<script type="text/javascript">
    $(".list>p").click(function(){
        var nextCotent = $(this).parent().next();
        if(nextCotent.is(":hidden")){
            $(this).parent().next().slideDown();
        }else{
            $(this).parent().next().slideUp();
        }
    });
   /*  $(".content").click(function(){
        console.log("111");
        if(!$(this).is(":hidden")){
            $(this).slideUp();
        }

    }); */
 
    
    
    function toSearch(){
    	
    	var t = $('#53').offset().top;//  获取需要跳转到标签的top值
    	$("html,body").animate({ scrollTop: t}, 500); // 动态跳转到指定位置（数值越大滚动速度越慢）
    	
    } 
    
    
    /*
    	用户输入搜索值,然后点击搜索按钮之后:
    	1. 根据{搜索内容+</p>}检索到第一个字符的索引
    	2. 根据第一个字符的索引向前获取与其最近的">"符号和空格的索引 
    		或 向前检索第一个">"的索引和第一个空格的索引
    	3. 截取第一个">"的索引+1 到 第一个空格索引之间的字符串
    	4. 判断获取到的字符串中是否有".",如果有则去掉，此时就获取到了id
    	5. 如果获取到的id位数大于1为x,那么则循环id的长度,用长度进行循环,分别获取"id"."aa".subString(0,i);
    		每获取一个Id则把其id+c的display标签设置为inline,最后跳转到查询出来的id的位置
    	
    	用户每次输入搜索值的时候都将成员变量num设置为0
    	如果用户输入搜索值之后,点击了下一步,将成员变量num的值+1
    	1. 如果是2,则查询到第一组之后,以获取到的（字符索引+搜索值的长度）为起始索引,截取字符串
    		如果是3,则查询到第二组之后...
    	2. 在进行检索
    	...
    
    
    */
    
    
    var num = 0;
    		
    // 为搜索框绑定输入事件
    $("#explainQuery").bind('input propertychange', function() {setNum();});    		
    
    // 当用户在进行输入的时候,将Num设置为0		
    function setNum(){
    	
    	num = 0;
    	
    }
    
	function toSearch1(){
    	
		num++;
		
		var eq = $("#explainQuery").val();
		
		if(eq == ""){
			
			alert("请输入搜索值!");
			
		}
    	
		var divId = getDivId(eq,num);
    	
		if(divId == " "){
			
			alert(123123123);
			
			num = 0;
			
		}
		
		var eqLength = divId.length;
		
		for(var i = 0;i <= eqLength; i++){
			
			var thisId = divId.substring(0,i);
			
			$("#"+thisId+"c").attr("style","style='display: block;");
			
		}
		
    	var t = $('#'+divId).offset().top;//  获取需要跳转到标签的top值
    	
    	$("html,body").animate({ scrollTop: t}, 500); // 动态跳转到指定位置（数值越大滚动速度越慢）
    	
    }
	
	function getDivId(eq,num){
		
		// 获取整个listContent里的内容
		var all = $("#listContent").html();
		
		// 查询的内容
		var searchStr = eq+"</p>";
		
		var eqIndex = all.indexOf(searchStr);
		
		// 如果不是第一次搜索,则搜索后面的
		if(num != 1){
			
			// 如果num不等于1,那就说明是第二次、第三次...查询
			for(var i = 1;i <= num; i++){
				
				all = getNextStrFormStrByTheIndex(all,eqIndex,searchStr);
				
				eqIndex = all.indexOf(searchStr);
				
			}
			
			return getDivIdFormStrByTheIndex(all,eqIndex);
			
			
		}else{
			// 如果是第一次搜索则直接返回id
			
			return getDivIdFormStrByTheIndex(all,eqIndex);
			
		}
	
		
	}
	
	// 将文本中去掉第一个要查询的字符串之后，进行返回
	function getNextStrFormStrByTheIndex(str,index,searchStr){
		
		return str.substring(index+searchStr.length);
		
	}
    
    		
	// 根据查询字符串的开始索引和整段内容获取标签的id
	function getDivIdFormStrByTheIndex(str,index){
		
		var targetCharIndex = 0;
		
		var spaceIndex = 0;
		
		for(var i = 0; i <= index; i++){
			
			// 目标
			var rel = str.charAt(index-i);
			
			if(rel == ">"){
				
				// 获取目标索引的值
				targetCharIndex = index-i;
				
				break;
				
			}
			
			if(rel == " "){
				
				// 获取空格索引的值
				spaceIndex = index-i;
				
			}
			
		}
		for(var i = 0; i <= index; i++){
			
			// 目标
			var rel = str.charAt(index-i);
			
			if(rel == " "){
				
				// 获取空格索引的值
				spaceIndex = index-i;
				
				break;
				
			}
			
		}
		
		var rel = str.substring(targetCharIndex+1,spaceIndex);
		
		if(rel.indexOf(".") > 0){
			
			re = new RegExp("\\.","g");//g,表示全部替换 正则表达式
			rel = rel.replace(re,"");
			
		}
		
		return rel;
		
	}
	
	  $(".btn_top").hide();         //刚进入页面时设置为隐藏
		$(".btn_top").bind("click",function(){     //单击时返回顶部
			$('html, body').animate({scrollTop: 0},300);return false;
		});
		$(window).bind('scroll resize',function(){   //判断页面所在的位置，小于300就隐藏，否则就显示
			if($(window).scrollTop()<=300){
				$(".btn_top").hide();
			}else{
				$(".btn_top").show();
			}
	});

	
    
    
</script>
</html>