
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mask.css">

    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-dialogbox/jquery.dialogbox-1.0.css">
    <script src="${pageContext.request.contextPath}/jquery-dialogbox/jquery.dialogbox-1.0.js"></script>

    <%--������--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/xcConfirm/css/xcConfirm.css"/>
    <script src="${pageContext.request.contextPath}/xcConfirm/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
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

        .w20 { width:50%; float:left;}
        .body-content{
            width: 50%;
            margin: 20px 20px;
            box-shadow: 3px -3px 3px #dedede, -3px 3px 3px #dedede, -3px -3px 3px #dedede;
            background-color: #f7f7f7;
        }
        .option{
            padding: 10px 40px;

        }
        .title{
            color: #333;
            width: 130px;
        }
        /*������ʽ*/
        .sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center;
            background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
        .rightContent{
            width: 40%;
            /*border: 1px #dedede solid;*/
            margin: 20px 20px;
            box-shadow: 3px -3px 3px #dedede, -3px 3px 3px #dedede, -3px -3px 3px #dedede;
            background-color: #f7f7f7;
        }
    </style>

</head>
<body>


<div class="panel admin-panel">
    <div class="panel-head" id="add">
        <strong>
            <span class="icon-pencil-square-o"></span> ���ӡ������-
            <c:choose>
                <c:when test="${sealApply.applyType == '1'}">
                    ������ӡ��
                </c:when>
                <c:when test="${sealApply.applyType == '2'}">
                    UKע��
                </c:when>
                <c:when test="${sealApply.applyType == '3'}">
                    ��Ȩ����
                </c:when>
                <c:when test="${sealApply.applyType == '4'}">
                    ֤������
                </c:when>
                <c:when test="${sealApply.applyType == '5'}">
                    ӡ������
                </c:when>
                <c:otherwise>
                    δ֪
                </c:otherwise>
            </c:choose>
        </strong>
    </div>
    <div class="padding border-bottom">
        <ul class="search" style="padding-left:10px;">
            <li><a class="button border-main icon-plus-square-o" href="javaScript:window.location.href = document.referrer;"> ����</a></li>
        </ul>
    </div>
    <div class="ub">
        <div class="body-content f-s-14 c-6">
            <form method="post" class="form-x" action="" id="seal_review_from" enctype="multipart/form-data">
                <input type="hidden" name="applyType" value="2"/>
                <div class="ub option">
                    <div class="title f-w">������λ��</div>
                    <div class="ub-f1">
                        <input type="text" class="w20" id="unitName" name="" value="${unit.unitName}"  readonly="readonly" />
                        <input type="hidden" id="unitId" name="unitId" value="${unit.unitId}"/>
                    </div>
                </div>
                <div class="ub option">
                    <div class="title f-w">ӡ�����ͣ�</div>
                    <div class="ub-f1" >
                        <select id="sealType" name="sealTypeId" class="w20">
                            <c:forEach items="${sealTypes}" var="item"  varStatus="status">
                                <option value="${item.sealTypeId}">${item.sealTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="ub option">
                    <div class="title f-w">ӡ�����ƣ�</div>
                    <div class="ub-f1" >
                        <input type="text"  id="sealName" name="sealName" class="w20"/>
                        <input type="hidden" id="sealHwUserIdNum" name="sealHwUserIdNum" />
                    </div>
                </div>
                <div id="personChoose" style="display: none">
                    <div class="ub option">
                        <div class="title f-w">
                            Ա��������
                        </div>
                        <div class="ub-f1">
                            <input type="text" name="empSearchMsg" id="empSearchMsg" value="" data-validate="required:�������ֻ���" class="w20"/>
                            <div class="tips" id="employeTip">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a  class="button border-main icon-search"  href='javascript:void(0)' onclick="searchEmp()" > ����</a>
                                &nbsp;&nbsp;&nbsp;
                                *����Ա���ֻ��Ž�������
                            </div>
                        </div>
                    </div>
                    <div class="ub option">
                        <div class="title f-w">
                            Ա����Ϣ��
                        </div>
                        <div class="field" id="empInfoDiv">
                            <div class="tips"></div>
                        </div>
                    </div>
                </div>
                <div class="ub option">
                    <div class="title f-w">
                        ӡ��ͼƬ��
                    </div>
                    <div class="ub-f1" >
                        <div id="gif_show"></div>
                        <div id="jpg_show"></div>
                    </div>
                </div>
                <div class="ub option">
                    <div class="title f-w">
                        �ϴ�ͼƬ��
                    </div>
                    <div class="ub-f1">
                        <div class="uploader white">
                            <input type="button" name="file" class="button bg-main" value="�ϴ�GIF��׼ͼ"/>
                            <input type="file" id="gifImg" name="gifImg"/>
                        </div>
                        <div class="uploader white">
                            <input type="button" name="file" class="button bg-main" value="�ϴ�JPG����ͼ"/>
                            <input type="file" id="jpgImg"  name="jpgImg"/>
                        </div>
                    </div>
                </div>

                <div class="ub option">
                    <div class="title f-w">ӡ�µ���ʱ�䣺</div>
                    <div class="ub-f1" >
                        <input type="date" id="authorizationTime" name="authorizationTime" value="2018-09-04" readonly class="w20"/>
                        <input type="hidden" id="authorizationInfo" name="authorizationInfo" value="" readonly />
                    </div>
                </div>
                <input type="hidden" id="sealImgId" name="sealImgId" />
                <input type="hidden" id="cerBase64" name="cerBase64"/>
                <input type="hidden" id="keyId" name="keyId"/>
                <div class="form-group">
                    <div class="label">
                        <label></label>
                    </div>
                    <div class="field">
                        <button type="button" class="button bg-main " onclick=" GetUKInfo()"> ��ȡUK</button>
                        <button type="button" class="button bg-main " onclick="sealInfoSubmit()" > ע��</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="rightContent ub-f1 ">
            <div class="ub option">
                <div class="title f-w">֤��汾��</div>
                <div class="ub-f1" id="cerVersion"></div>
            </div>
            <div class="ub option">
                <div class="title f-w">ǩ���㷨��</div>
                <div class="ub-f1" id="cerAlgorithm"></div>
            </div>

            <div class="ub option">
                <div class="title f-w">֤��ʹ���ߣ�</div>
                <div class="ub-f1" id="cerCn"></div>
            </div>
            <div class="ub option">
                <div class="title f-w">֤��䷢�ߣ�</div>
                <div class="ub-f1" id="cerIssuer"></div>
            </div>
            <div class="ub option">
                <div class="title f-w">��Ч����ʼ��</div>
                <div class="ub-f1" id="cerStartTime"></div>
            </div>
            <div class="ub option">
                <div class="title f-w">��Ч�ڽ�����</div>
                <div class="ub-f1" id="cerEndTime"></div>
            </div>
        </div>
    </div>
</div>


</body>
<script>
    /**
     * submit����
     * @param
     * @returns
     */
    function sealInfoSubmit(){
        // alert("�ϴ��������ɹ�");
        var formData = $("#seal_review_from").serializeArray();
        var verificResult  = verification();

        if(verificResult == "true"){
            $.ajax({
                url: "${pageContext.request.contextPath}/seal/seal_apply_do.html",
                type: "post",
                data: new FormData($("#seal_review_from")[0]),
                cache: false,
                processData: false,
                contentType: false,
                // dataType : "json",
                success: function (data)
                {
                    if(data == "success"){

                        $('body').dialogbox({
                            type:"normal",title:"�����ɹ�",
                            buttons:[{
                                Text:"ȷ��",
                                ClickToClose:true,
                                callback:function (dialog){
                                    window.location.href = document.referrer;
                                }
                            }],
                            message:'�����ͨ����ӡ�����룡'
                        });
                    }else{
                        $('body').dialogbox({
                            type:"normal",title:"����ʧ��",
                            buttons:[{
                                Text:"ȷ��",
                                ClickToClose:true,
                                callback:function (dialog){
                                }
                            }],
                            message:'�����ύʧ�ܣ��������ԣ�'
                        });
                    }
                }
            });
        }else{
            var txt = verificResult;
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.confirm);
        }
    }


    function verification(){

        return "true";

    }

    /**
     * �������ֵ�Ƿ�Ϊ��
     * @param data
     * @returns {boolean}
     */
    function isNull(val) {
        if (val == '' || val == undefined || val == null) {
            //��
            return true;
        } else {
            // �ǿ�
            return false;
        }
    }

    //�ϴ�ͼƬ ת��base64 ��ʾ��
    $("#gifImg").change(function(){
        //���ͼƬ����
        $("#gif_show").empty();
        var fl=this.files.length;
        for(var i=0;i<fl;i++){
            var file = this.files[i];
            //�ϴ��ļ���ʽ
            var imgFileType = file.name.toLowerCase().split('.').splice(-1);
            var imgFileSize = file.size/1024 + 'kb';
            if("gif" == imgFileType){
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function(e){
                    var imgstr='<img style="width:70px;height:70px;" src="'+e.target.result+'"/>';
                    $("#gif_show").append(imgstr);
                };
            }else{
                alert("�ļ���ʽ���������� �ϴ�");
                //����file Input ֵ
                file.value = '';
            }
        }
    });
    //�ϴ�ͼƬ ת��base64 ��ʾ��
    $("#jpgImg").change(function(){
        //���ͼƬ����
        $("#jpg_show").empty();
        var fl=this.files.length;
        for(var i=0;i<fl;i++){
            var file = this.files[i];
            //�ϴ��ļ���ʽ
            var imgFileType = file.name.toLowerCase().split('.').splice(-1);
            if("jpg" == imgFileType){
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function(e){
                    var imgstr='<img style="width:70px;height:70px;" src="'+e.target.result+'"/>';
                    $("#jpg_show").append(imgstr);
                };
            }else{
                alert("�ļ���ʽ���������� �ϴ�");
                //����file Input ֵ
                file.value = '';
            }
        }
    });

    $(function(){

        //ӡ���������JS
        $("#sealName").val($("#unitName").val()+$("#sealType").find("option:selected").text());
        $("#sealType").change(function(){

            if($("#sealType").find("option:selected").text()=='��ǩ'){

                $("#personChoose").show();
                $("#sealName").val("");
            }else{

                $("#personChoose").hide();
                $("#sealName").val($("#unitName").val()+$("#sealType").find("option:selected").text());
            }

        });



        //�ļ��ϴ������
        $("input[type=file]").change(function(){
            $(this).parents(".uploader").find(".filename").val($(this).val());
        });

        $("input[type=file]").each(function(){
            if($(this).val()==""){
                $(this).parents(".uploader").find(".filename").val("��ѡ���ļ�...");
            }
        });
    });

    //�����û���������������û�����  ����ֵ��ʽ��personId@personName@personPhone@personIdNum@@@personId@personName@...
    function searchEmp(){
        var empSearchMsg = $("#empSearchMsg").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/seal/findPerson.html",
            type: "post",
            data: {"phone":empSearchMsg},
            dateType: "json",
            success: function (data)
            {

                var result = data;
                if(result.meg=="success"){
                    $("#empInfoDiv").html("");
                    //������ǩ�����֤��
                    $("#sealHwUserIdNum").val(result.body.idNum);
                    //������ǩӡ������
                    $("#sealName").val(result.body.personName);
                    alert(result.body.personName);
                    $("#empInfoDiv").append(
                        "<label>" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                        +"<font size='2'><strong>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:&nbsp;</strong></font>"+result.body.personName+"<br/>"
                        +"<font size='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>��&nbsp;��&nbsp;&nbsp;��:&nbsp;</strong></font>"+result.body.phone+"<br/>"
                        +"<font size='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>���֤��:&nbsp;</strong></font>"+result.body.idNum+" </label>" +
                        "<br/><hr style='width:260px'/>"
                    );
                }else{
                    window.wxc.xcConfirm(result.meg, window.wxc.xcConfirm.typeEnum.info);
                }
            }
        });
    }


    function GetUKInfo(){
        clientIsRunning = false;
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
                    // alert("�ϴ��ĵõ���ӡ��UUID:" +��infos[3]);
                    $("#sealImgId").val(infos[3]);
                    // alert("ӡ��GIF:" +��infos[4]);
                    var imgstr='<img style="width:70px;height:70px;" src="data:image/gif;base64,'+infos[4]+'"/>';
                    $("#gif_show").append(imgstr);
                    // alert("֤��汾:" +��infos[5]);
                    $("#cerVersion").text(infos[5]);
                    // alert("֤�����к�:" +��infos[6]);

                    // alert("֤���㷨:" +��infos[7]);
                    $("#cerAlgorithm").text(infos[7]);
                    // alert("�䷢����Ϣ:" +��infos[8]);
                    $("#cerIssuer").text(infos[8]);
                    // alert("֤����Ч����ʼ:" +��infos[9]);
                    $("#cerStartTime").text(infos[9]);
                    // alert("֤����Ч����ֹ:" +��infos[10]);
                    $("#cerEndTime").text(infos[10]);
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