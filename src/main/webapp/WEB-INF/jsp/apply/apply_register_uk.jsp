<%--
  Created by IntelliJ IDEA.
  User: ������
  Date: 2018/9/13
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
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
    <!--��������-->
    <script src="${pageContext.request.contextPath}/distpicker/js/distpicker.data.js"></script>
    <script src="${pageContext.request.contextPath}/distpicker/js/distpicker.js"></script>
    <script src="${pageContext.request.contextPath}/distpicker/js/main.js"></script>

    <style type="text/css">
        /*�ϴ�����ʽ*/
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

    <div class="panel-head"><strong class="icon-reorder"> ESSǩ������ϵͳ--ע������UKӡ��</strong> <a href="" style="float:right; display:none;">����ֶ�</a></div>
    <div class="padding border-bottom form-x" >
        <ul class="search" style="padding-left:10px;">
            <li><a class="button border-main icon-plus-square-o" href="javaScript:window.location.href = document.referrer;"> ����</a></li>
        </ul>
    </div>

    <form method="post" class="form-x" id="applyInfo_from" action="${pageContext.request.contextPath}/apply/add_do.html" enctype="multipart/form-data">
        <div class="body-content">
            <ul class="search"  >
                <li class="label">
                    <strong class="icon-reorder">ӡ����Ϣ</strong>
                </li>
                <li>
                    <input type="hidden" id="isUK" name="isUK" value="1" />
                    &nbsp;&nbsp;
                    ӡ������
                    <select id="sealTypeId" name="sealTypeId" onchange="changeSealType()"  style="width:150px; line-height:17px;display:inline-block">
                        <c:forEach items="${sealTypes}" var="item"  varStatus="status">
                            <option value="${item.sealTypeId}">${item.sealTypeName}</option>
                        </c:forEach>
                    </select>
                    &nbsp;&nbsp;
                </li>
                <li id="searchPerson" style="display: none">
                    <input type="text" placeholder="�����������ؼ���" id="keywords"  style="width:150px; line-height:17px;display:inline-block" />
                    <a href="javascript:void(0)" class="icon-search" onclick="searchPerson()"> ����</a>
                </li>
            </ul>
            <ul class="search" >
                <%--������Ϣ���--%>
                <input type="hidden" id="applyType" name="applyType" value="${applyType}"/>
                <input type="hidden" id="unitId" name="unitId" value="${unit.unitId}"/>
                <input type="hidden" id="unitName" name="unitName" value="${unit.unitName}"/>
                <li class="form-group">
                    <div class="label">
                        <label>ӡ�����ƣ�</label>
                    </div>
                    <div class="field">
                        <input type="text" class="input w300" id="sealName" name="sealName" value="" />
                    </div>
                </li>
            </ul>
            <ul class="search" id="person_div" style="display: none">
                <li class="form-group" >
                    <div class="label">
                        <label>��ǩ�˱�ʶ��</label>
                    </div>
                    <div class="field">
                        <input type="text"  class="input w100"  id="personName" value="" readonly />
                        <%--<input type="hidden"  name="sealHwUserIdNum" id="sealHwUserIdNum" value="" readonly />--%>
                    </div>
                </li>
                <li class="form-group" >
                    <div class="field">
                        <input type="text"  class="input w200" name="sealHwUserIdNum" id="sealHwUserIdNum" value="" readonly />
                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label>UKͼƬ��</label>
                    </div>
                    <div class="field">
                        <div id="img_show"></div>
                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label>ӡ��ͼƬ��</label>
                    </div>
                    <div class="field">
                        <div class="uploader white">
                            <input type="text" id="fileName" value="ͼƬ����PDF�ļ���������4M��" class="filename input w300" readonly/>
                            <input type="button" class="button1" value="����ļ�"/>
                            <input type="file" id="attachmentFile"  name="attachmentFile" size="30"/>
                            <input type="hidden" id="attachmentPath"  name="attachmentPath"/>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="label">
                    <strong class="icon-reorder">֤����Ϣ</strong>
                    <input type="hidden" id="cerBase64"  name="cerBase64"/>
                    <input type="hidden" id="authorizationTime"  name="authorizationTime" />
                    <input type="hidden" id="authorizationInfo"  name="authorizationInfo" />
                    <input type="hidden" id="keyId"  name="keyId" />
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group" >
                    <div class="label">
                        <label>֤��䷢�ߣ�</label>
                    </div>
                    <div class="field" id="cerIssuer">

                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label>֤�����⣺</label>
                    </div>
                    <div class="field" id="cerCn">
                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label>��Ч�ڣ�</label>
                    </div>
                    <div class="field" id="cerStartTime">

                    </div>
                </li>
            </ul>
            <ul class="search" >
                <li class="form-group">
                    <div class="label">
                        <label></label>
                    </div>
                    <div class="field">
                        <button type="button" class="button bg-main icon-check-square-o w150" onclick="GetUKInfo()" > ��ȡUK</button>
                        <button type="button" class="button bg-main icon-check-square-o w150" onclick="sealInfoSubmit()" > �ύ����</button>
                    </div>
                </li>
            </ul>
        </div>
    </form>
</div>
</body>
<script>
    /**
     *�ύ������Ϣ
     */
    function sealInfoSubmit() {

        var Result  = verification();

        if(Result =="true"){
            var formData = new FormData();
            formData.append("sealTypeId",$("#sealTypeId").val());
            formData.append("applyType",$("#applyType").val());
            formData.append("unitId",$("#unitId").val());
            formData.append("sealName",$("#sealName").val());
            formData.append("sealHwUserIdNum",$("#sealHwUserIdNum").val());
            formData.append("attachmentFile",$("#attachmentFile")[0].files[0]);
            formData.append("attachmentPath",$("#attachmentPath").val());
            formData.append("cerBase64",$("#cerBase64").val());
            formData.append("authorizationTime",$("#authorizationTime").val());
            formData.append("authorizationInfo",$("#authorizationInfo").val());
            formData.append("keyId",$("#keyId").val());
            formData.append("cardType","FTCX");

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/apply/register_do.html",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data)
                {
                    var obj = eval('('+ data +')');
                    if(obj.message == "success"){
                        $('body').dialogbox({
                            type:"normal",title:"����ɹ�",
                            buttons:[{
                                Text:"ȷ��",
                                ClickToClose:true,
                                callback:function (dialog){
                                    window.location.href = document.referrer;
                                }
                            }],
                            message:'�Ѹ������ύ����Ϣ�ɹ��ύӡ�����룬�����Ⱥ����������'
                        });
                    }else{
                        $('body').dialogbox({
                            type:"normal",title:"����ʧ��",
                            buttons:[{
                                Text:"ȷ��",
                                ClickToClose:true,
                                callback:function (dialog){
                                    // window.history.go(-1)
                                }
                            }],
                            message:'�����ύʧ�ܣ��������ԣ�'
                        });
                    }
                }
            });
        }else{
            $('body').dialogbox({
                type:"normal",title:"��Ϣȱʧ",
                buttons:[{
                    Text:"ȷ��",
                    ClickToClose:true,
                    callback:function (dialog){
                    }
                }],
                message:Result
            });
        }
    }

    /**
     *��ʼ������
     */
    $(function(){
        //�Ƿ��ṩ֤�� �ϴ���  ����
        //����֤��״̬Ϊδ����֤��
        $('#fileState').val(1);
        //ӡ�����Ƴ�ʼ��
        $("#sealName").val($("#unitName").val()+$("#sealTypeId").find("option:selected").text());

    });
    function verification(){
        if(isNull($("#sealName").val())){
            return "ӡ�����Ʋ���Ϊ�գ�";
        }
        if(isNull($("#attachmentPath").val())){
            if(isNull($("#attachmentFile").val())){
                return "���ϴ�������";
            }
        }
        if(($("#sealTypeId").val()).indexOf("st7")!=-1){
            if(isNull($("#sealHwUserIdNum").val())){
                return "��ѡ����ǩ�ˣ���";
            }
        }
        if(isNull($("#cerBase64").val())){
            return "���ȡUK��";
        }
        return "true";
    }
    function changeSealType() {
        if(($("#sealTypeId").val()).indexOf("st7")!=-1){
            //չʾ������
            $("#searchPerson").show();
            //չʾ��Աdiv
            $("#person_div").show();
            //����ӡ����
            $("#sealName").val("");
        }else{
            //����������
            $("#searchPerson").hide();
            //��Ա�������
            $("#person_div").hide();
            //����ӡ����
            $("#sealName").val($("#unitName").val()+$("#sealTypeId").find("option:selected").text());
            //ȥ����ǩ��ʶ
            $("#sealHwUserIdNum").val("");
            //ȥ����ǩ��ʶ
            $("#personName").val("");
        }
    }
    //�ϴ�ͼƬ ת��base64 ��ʾ��
    $("#attachment").change(function(){
        var fl=this.files.length;
        for(var i=0;i<fl;i++){
            var file = this.files[i];
            //�ϴ��ļ���ʽ
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
                $("#fileName").val("ͼƬ����PDF�ļ���������4M��");
                $('body').dialogbox({
                    type:"normal",title:"����",
                    buttons:[{
                        Text:"ȷ��",
                        ClickToClose:true,
                        callback:function (dialog){
                            // window.history.go(-1)
                        }
                    }],
                    message:"����ֻ֧��gif,jpg,pdf,png�ȸ�ʽ��"
                });
            }
        }
    });
    //�ϴ�֤�� ת��base64
    $("#pfxFile").change(function(){
        var cerFileType = this.value.toLowerCase().split('.').splice(-1)
        var cerFileSize = this.files[0].size/1024 + 'kb';
        if("pfx" == cerFileType ){
            var v2 = $(this).val();
            var reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload = function(e){
                var cerArray = e.target.result.split(",");
                $('#pfxBase64').val(cerArray[1]);
                $('#fileState').val(3);
            };
        }else{
            var fileTemp = $("#pfxFile");
            fileTemp.after(fileTemp.clone().val(""));
            fileTemp.remove();
            $('body').dialogbox({
                type:"normal",title:"��Ա����",
                buttons:[{
                    Text:"ȷ��",
                    ClickToClose:true,
                    callback:function (dialog){

                    }
                }],
                message:"�ļ���ʽ�����������ϴ�"
            });
        }
    });
    /**
     * �첽��ѯ��Ա
     */
    function searchPerson() {
        $.ajax({
            url: "${pageContext.request.contextPath}/apply/findPerson.html",
            type: "get",
            data: {"phone":$("#keywords").val()},
            success: function (data) {
                var obj = eval('('+ data +')');
                if(obj.message=="ESSSUCCESS"){
                    //�ɹ�
                    var arr=new Array();
                    arr.push("<table class=\"table table-hover text-center\">");
                    arr.push("<tr><th width=\"50px\">ѡ��</th><th width=\"50px\">ͼ��</th><th width=\"90px\">�ֻ���</th><th width=\"60px\">����</th><th width=\"140px\">���֤��</th></tr>");
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
                        type:"normal",title:"��Ա����",
                        buttons:[{
                            Text:"ȷ��",
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
                        type:"normal",title:"��Ա����",
                        buttons:[{
                            Text:"ȷ��",
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
                    type:"normal",title:"����������",
                    buttons:[{
                        Text:"ȷ��",
                        ClickToClose:true,
                        callback:function (dialog){
                        }
                    }],
                    message:"����ķ����������ݴ��������ԣ�"
                });
            }
        });
    }

    function GetUKInfo(){
        $.getJSON("http://127.0.0.1:10102?jsoncallback=?", {
                ACT:"Q_UKINFOFORREG",
                VAL:"CARDTYPE=FTCX"
            },
            function(data) {
                if(data[0].status == 0){
                    var s = data[0].info;
                    var infos = s.split("#");
                    // alert("UK���:" +��infos[0]);
                    $("#keyId").val(infos[0]);
                    // alert("֤������:" +��infos[1]);
                    $("#cerBase64").val(infos[1]);
                    //	alert("��Ȩֵ��:" +��infos[2]);
                    $("#authorizationInfo").val(infos[2]);
                    $("#authorizationTime").val("2020/09/12");

                    // alert("�ϴ��ĵõ���ӡ��UUIDukͼƬ��ַ:" +��infos[3]);
                    $("#attachmentPath").val(infos[3]);
                    // alert("ӡ��GIF:" +��infos[4]);
                    var imgstr='<img style="width:70px;height:70px;" src="data:image/gif;base64,'+infos[4]+'"/>';
                    $("#img_show").append(imgstr);
                    // alert("֤��汾:" +��infos[5]);
                    // $("#cerVersion").text(infos[5]);
                    // alert("֤�����к�:" +��infos[6]);
                    // alert("֤���㷨:" +��infos[7]);
                    // $("#cerAlgorithm").text(infos[7]);
                    // alert("�䷢����Ϣ:" +��infos[8]);
                    $("#cerIssuer").text(infos[8]);
                    // alert("֤����Ч����ʼ:" +��infos[9]);
                    $("#cerStartTime").text(infos[9]+"-"+infos[10]);
                    // alert("֤����Ч����ֹ:" +��infos[10]);
                    // $("#cerEndTime").text(infos[10]);
                    // alert("֤������:" +��infos[11]);
                    $("#cerCn").text(infos[11]);

                }
                else if(data[0].status == 1){
                    alert("���¼��ȫ�ͻ���");
                }else if(data[0].status == 2){
                    alert("��������");
                }
                else{
                    alert(data[0].status);
                }
            }
        );
    }

</script>
</html>