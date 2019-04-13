<%--
  Created by IntelliJ IDEA.
  User: 陈晓坤
  Date: 2018/9/13
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mask.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-dialogbox/jquery.dialogbox-1.0.css">
    <script src="${pageContext.request.contextPath}/jquery-dialogbox/jquery.dialogbox-1.0.js"></script>
    <!--三级联动-->
    <script src="${pageContext.request.contextPath}/distpicker/js/distpicker.data.js"></script>
    <script src="${pageContext.request.contextPath}/distpicker/js/distpicker.js"></script>
    <script src="${pageContext.request.contextPath}/distpicker/js/main.js"></script>

    <style type="text/css">
        /*上传框样式*/
        .uploader { position:relative; display:inline-block; overflow:hidden; cursor:default; padding:0;
            margin:10px 0px; -moz-box-shadow:0px 0px 5px #ddd; -webkit-box-shadow:0px 0px 5px #ddd;
            box-shadow:0px 0px 5px #ddd; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; }
        .filename { float:left; display:inline-block; outline:0 none; height:32px; width:180px; margin:0; padding:8px 10px; overflow:hidden; cursor:default; border:1px solid; border-right:0; font:9pt/100% Arial, Helvetica, sans-serif; color:#777; text-shadow:1px 1px 0px #fff; text-overflow:ellipsis; white-space:nowrap; -moz-border-radius:5px 0px 0px 5px; -webkit-border-radius:5px 0px 0px 5px; border-radius:5px 0px 0px 5px; background:#f5f5f5; background:-moz-linear-gradient(top, #fafafa 0%, #eee 100%); background:-webkit-gradient(linear, left top, left bottom, color-stop(0%, #fafafa), color-stop(100%, #f5f5f5)); filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fafafa', endColorstr='#f5f5f5', GradientType=0);
            border-color:#ccc; -moz-box-shadow:0px 0px 1px #fff inset; -webkit-box-shadow:0px 0px 1px #fff inset; box-shadow:0px 0px 1px #fff inset; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; box-sizing:border-box; }
        .button1 { float:left; height:32px; display:inline-block; outline:0 none; padding:8px 12px; margin:0; cursor:pointer; border:1px solid; font:bold 9pt/100% Arial, Helvetica, sans-serif; -moz-border-radius:0px 5px 5px 0px; -webkit-border-radius:0px 5px 5px 0px; border-radius:0px 5px 5px 0px; -moz-box-shadow:0px 0px 1px #fff inset; -webkit-box-shadow:0px 0px 1px #fff inset; box-shadow:0px 0px 1px #fff inset; }
        .uploader input[type=file] { position:absolute; top:0; right:0; bottom:0; border:0; padding:0; margin:0;
            height:30px; cursor:pointer; filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity: 0; opacity:0; }

        .w300{
            width: 300px;
            float:left;
        }
        .w100{
            width: 100px;
            float:left;
        }
        .w150{
            width: 150px;
            float:left;
        }
        .w200{
            width: 200px;
            float:left;
        }
        .form-x .form-group .label {
            width: 170px;
        }
        .form-x .form-group .field {
            width: calc(100% - 170px);
        }
    </style>
</head>
<body>
<div class="panel admin-panel">

    <div class="panel-head"><strong class="icon-reorder"> ESS签章制作系统--申请新印章</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom form-x" >
        <ul class="search" style="padding-left:10px;">
            <li><a class="button border-main icon-plus-square-o" href="javaScript:window.location.href = document.referrer;"> 返回</a></li>
        </ul>
    </div>

    <form method="post" class="form-x" id="applyInfo_from" action="${pageContext.request.contextPath}/apply/add_do.html" enctype="multipart/form-data">
        <div class="body-content">
            <ul class="search"  >
                <li>
                    <select id="isUK" name="isUK"  onchange="ukChange()" style="width:70px; line-height:17px; display:none">
                        <option value="1">是</option>
                        <option value="2">否</option>
                    </select>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label>印章类型：</label>
                    </div>
                    <div class="field">
                        <select id="sealTypeId" name="sealTypeId" onchange="changeSealType()"  style="width:150px; line-height:17px;display:inline-block">
                            <c:forEach items="${sealTypes}" var="item"  varStatus="status">
                                <option value="${item.sealTypeId}">${item.sealTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>
            </ul>
            <ul class="search" >
                <%--申请信息类别--%>
                <input type="hidden" id="applyType" name="applyType" value="${applyType}"/>
                <input type="hidden" id="unitId" name="unitId" value="${unit.unitId}"/>
                <input type="hidden" id="unitName" name="unitName" value="${unit.unitName}"/>
                <li class="form-group">
                    <div class="label">
                        <label>印章名称：</label>
                    </div>
                    <div class="field">
                        <input type="text"  class="input w300" id="sealName" name="sealName" value="" />
                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label>附件：</label>
                    </div>
                    <div class="field">
                        <div class="uploader white">
                            <input type="text" id="fileName" value="图片或者PDF文件（不超过4M）" class="filename input w300" readonly/>
                            <input type="button" class="button1" value="添加文件"/>
                            <input type="file" id="attachmentFile"  name="attachmentFile" size="30"/>
                        </div>
                    </div>
                </li>
            </ul>

            <ul class="search" id="pfx_div" >
                <li class="form-group">
                    <div class="label">
                        <label>证书：</label>
                    </div>
                    <div class="field">
                        <div class="uploader white">
                            <input type="text" class="filename input w150" value="证书格式CER" readonly/>
                            <input type="button" class="button1 w150" value="上传证书"/>
                            <input type="file" id="pfxFile"   size="30"/>
                            <input type="hidden" id="pfxBase64" name="pfxBase64"/>
                            <input type="hidden" id="fileState" name="fileState" value="1"/>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label></label>
                    </div>
                    <div class="field">
                        <button type="button" class="button bg-main icon-check-square-o w150" onclick="sealInfoSubmit()"> 提交申请</button>
                    </div>
                </li>
            </ul>
        </div>
    </form>
</div>
</body>
<script>
    /**
     *提交申请信息
     */
    function sealInfoSubmit() {
        $("#fileTypeNum").val(getTheCheckBoxValue());
        var formData = new FormData($("#applyInfo_from")[0]);
        var verificResult  = verification();
        // var verificResult = true;
        if(verificResult){
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/apply/add_do.html",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data)
                {
                    var obj = eval('('+ data +')');
                    if(obj.message == "success"){
                        $('body').dialogbox({
                            type:"normal",title:"申请成功",
                            buttons:[{
                                Text:"确认",
                                ClickToClose:true,
                                callback:function (dialog){
                                    window.location.href = document.referrer;
                                }
                            }],
                            message:'已根据您提交的信息成功提交印章申请，请您等候审核制作！'
                        });
                    }else{
                        $('body').dialogbox({
                            type:"normal",title:"申请失败",
                            buttons:[{
                                Text:"确认",
                                ClickToClose:true,
                                callback:function (dialog){
                                    // window.history.go(-1)
                                }
                            }],
                            message:'申请提交失败，请您重试！'
                        });
                    }
                }
            });
        }else{
            $('body').dialogbox({
                type:"normal",title:"信息缺失",
                buttons:[{
                    Text:"确认",
                    ClickToClose:true,
                    callback:function (dialog){
                    }
                }],
                message:verificResult
            });
        }
    }

    /**
     *初始化工作
     */
    $(function(){
        //是否提供证书 上传框  控制
        //设置证书状态为未生成证书
        $('#fileState').val(1);
        //印章名称初始化
        $("#sealName").val($("#unitName").val()+$("#sealTypeId").find("option:selected").text());

        //隐藏解析证书按钮
        $("#getPfxBtn").hide();

    });

    function verification(){
        if(isNull($("#sealName").val())){
            return "印章名称不可为空！";
        }

        if(isNull($("#attachment").val())){
            return "请上传图片或附件！";
        }
        // if(isNull($("#province").val()) ||isNull($("#city").val()) ||isNull($("#certUnit").val())
        //     ||isNull($("#certDepartment").val()) ||isNull($("#cerName").val())){
        //
        //     return "请填写证书信息！";
        // }

        if($("#isPfx").val()==1 ){
            if(isNull($("#pfxBase64").val())){
                return "请上传证书！";
            }
            // if(isNull($("#cerPsw").val())){
            //     return "请输入密码！";
            // }
        }
        //上传证书和uk印章不可相同
        // if($("#isPfx").val()==1 ){
        //     if($("#isPfx").val()==1 ){
        //         return "pfx证书不适用于UK印章申请！";
        //     }
        // }
        return "true";
    }

    //上传图片 转换base64 显示。
    $("#attachment").change(function(){
        var fl=this.files.length;
        for(var i=0;i<fl;i++){
            var file = this.files[i];
            //上传文件格式
            var FileType = file.name.toLowerCase().split('.').splice(-1);
            var FileSize = file.size/1024 + 'kb';
            $("#fileName").val(file.name);
            if("gif" == FileType ||"jpg" == FileType ||"png" == FileType ||"pdf" == FileType){
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function(e){

                };
            }else{
                var fileTemp = $("#attachment");
                fileTemp.after(fileTemp.clone().val(""));
                fileTemp.remove();
                $("#fileName").val("图片或者PDF文件（不超过4M）");
                $('body').dialogbox({
                    type:"normal",title:"错误！",
                    buttons:[{
                        Text:"确认",
                        ClickToClose:true,
                        callback:function (dialog){
                            // window.history.go(-1)
                        }
                    }],
                    message:"附件只支持gif,jpg,pdf,png等格式！"
                });
            }
        }
    });
    //上传证书 转换base64
    $("#pfxFile").change(function(){
        var cerFileType = this.value.toLowerCase().split('.').splice(-1)
        var cerFileSize = this.files[0].size/1024 + 'kb';
        if("cer" == cerFileType ){
            var v2 = $(this).val();
            var reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload = function(e){
                var cerArray = e.target.result.split(",");
                $('#pfxBase64').val(cerArray[1]);
                $('#fileState').val(2);
            };
        }else{
            var fileTemp = $("#pfxFile");
            fileTemp.after(fileTemp.clone().val(""));
            fileTemp.remove();
            $('body').dialogbox({
                type:"normal",title:"人员搜索",
                buttons:[{
                    Text:"确认",
                    ClickToClose:true,
                    callback:function (dialog){

                    }
                }],
                message:"文件格式错误，请重新上传"
            });
        }
    });
    /**
     * 异步查询人员
     */
    function searchPerson() {
        $.ajax({
            url: "${pageContext.request.contextPath}/apply/findPerson.html",
            type: "get",
            data: {"phone":$("#keywords").val()},
            success: function (data) {
                var obj = eval('('+ data +')');
                if(obj.message=="ESSSUCCESS"){
                    //成功
                    var arr=new Array();
                    arr.push("<table class=\"table table-hover text-center\">");
                    arr.push("<tr><th width=\"50px\">选择</th><th width=\"50px\">图像</th><th width=\"90px\">手机号</th><th width=\"60px\">名字</th><th width=\"140px\">身份证号</th></tr>");
                    $.each(obj.body,function(name,value) {
                        arr.push("<tr>");
                        arr.push("<td><input type=\"radio\" name=\"companyRdoID\" id=\"companyRdoID1\" value=\""+value.personId+"\"></td>");
                        arr.push("<td><img src=\"data:image/gif;base64,"+value.personImgBase64+"\" width=\"30px\" height=\"30px\"/></td>");
                        arr.push("<td id=\""+value.personId+"phone\">"+value.phone+"</td>");
                        arr.push("<td id=\""+value.personId+"name\">"+value.personName+"</td>");
                        arr.push("<td id=\""+value.personId+"idNum\">"+value.idNum+"</td>");
                        arr.push("</tr>");
                    });
                    arr.push("</table>");
                    $('body').dialogbox({
                            type:"normal",title:"人员搜索",
                            buttons:[{
                                Text:"确认",
                                ClickToClose:true,
                                callback:function (dialog){
                                    var personId = $(dialog).find("input[name='companyRdoID']:checked").val();
                                    $("#personName").val($(dialog).find("#"+personId+"name").text());
                                    $("#sealHwUserIdNum").val($(dialog).find("#"+personId+"idNum").text());
                                }
                            }],
                            message:arr
                    });
                } else if(obj.message=="ESSERROR"){
                    $('body').dialogbox({
                        type:"normal",title:"人员搜索",
                        buttons:[{
                            Text:"确认",
                            ClickToClose:true,
                            callback:function (dialog){
                            }
                        }],
                        message:obj.body
                    });
                }

            },
            error: function (data) {
                $('body').dialogbox({
                    type:"normal",title:"服务器错误！",
                    buttons:[{
                        Text:"确认",
                        ClickToClose:true,
                        callback:function (dialog){
                        }
                    }],
                    message:"请求的服务器或数据错误！请重试！"
                });
            }
        });
    }
    function getPfxInfo() {
        if(isNull($("#pfxBase64").val())){
            $('body').dialogbox({
                type:"normal",title:"系统提示！",
                buttons:[{
                    Text:"确认",
                    ClickToClose:true,
                    callback:function (dialog){
                    }
                }],
                message:"请上传证书后重试！"
            });
        }else{
            if(isNull($("#cerPsw").val())){
                $('body').dialogbox({
                    type:"normal",title:"系统提示！",
                    buttons:[{
                        Text:"确认",
                        ClickToClose:true,
                        callback:function (dialog){
                        }
                    }],
                    message:"请输入证书密码后重试！"
                });
            }else{
                $.ajax({
                    url: "${pageContext.request.contextPath}/apply/get_pfx_info.html",
                    type: "post",
                    data: {"pfxBase64":$("#pfxBase64").val(),"cerPsw":$("#cerPsw").val(),},
                    success: function (data) {
                        var obj = eval('('+ data +')');
                        if(obj.message=="success"){
                            $("#country").val(obj.body.C);
                            $("#province").val(obj.body.ST);
                            $("#city").val(obj.body.L);
                            $("#certUnit").val(obj.body.O);
                            $("#certDepartment").val(obj.body.OU);
                            $("#cerName").val(obj.body.CN);
                        }else{
                            $('body').dialogbox({
                                type:"normal",title:"密码错误！",
                                buttons:[{
                                    Text:"确认",
                                    ClickToClose:true,
                                    callback:function (dialog){
                                    }
                                }],
                                message:"你输入的证书密码错误！请检查后重试！"
                            });
                        }

                    }
                });
            }
        }
    }
</script>
</html>