<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <style>
                .regiOuter {
                    width: 1200px;
                    height: 100%;
                    margin: auto;
                    cursor: default;
                    position: relative;
                }

                .regiHeader {
                    height: 200px;
                    padding: 75px;
                    background-color: rgba(224, 224, 224, 0.45);
                }

                .regiHeader b {
                    float: left;
                    font-size: 34px;
                    margin-top: ;
                }

                .regiHeader button {
                    float: right;
                    margin-left: 30px;
                    width: 100px;
                    height: 40px;
                    background-color: rgb(224, 224, 224);
                    color: rgb(94, 94, 94);
                    border: none;
                    border-radius: 5px;
                    font-weight: 500;
                }

                .registerBtn {
                    width: 170px !important;
                    background-color: rgb(52, 152, 219) !important;
                    color: white !important;
                }

                .regiMenubar {
                    width: 260px;
                    height: 100%;
                    padding: 30px;
                    padding-top: 43px;
                }

                .regiMenubar b {
                    font-size: 22px;
                }

                .regiMenubar li {
                    margin-left: -20px;
                    line-height: 2.4;
                    font-size: 17px;
                    cursor: pointer;
                }

                .regiMenuSelected {
                    width: 5px;
                    height: 40px;
                    background-color: rgb(52, 152, 219);
                    margin-left: 255px;
                }

                .regiBody {
                    float: right;
                    width: 940px;
                    height: 100%;
                    border-left: 2px solid rgba(224, 224, 224, 0.45);
                    padding: 30px;
                    padding-left: 50px;
                    font-size: 15px;
                    line-height: 2;
                }

                .regiBtn button {
                    width: 130px;
                    height: 40px;
                    margin-top: 60px;
                    margin-bottom: 60px;
                    margin-left: 10px;
                    border: none;
                    border-radius: 5px;
                }

                .liOne {
                    color: rgb(41, 128, 185);
                }

                .regiSubmitBtn,
                .btn1 {
                    background-color: rgb(52, 152, 219);
                    color: white;
                }

                #regiResetBtn,
                .btn2 {
                    background-color: rgb(224, 224, 224);
                }

                .regiTitle {
                    font-size: 20px;
                    line-height: 3;
                }

                .catOption {
                    width: 113px;
                    height: 40px;
                }

                #projectTitle {
                    width: 548px;
                    height: 40px;
                    margin-left: 10px;
                }

                #projectSummary,
                #projectGprice {
                    width: 675px;
                    height: 40px;
                    margin-right: 10px;
                }

                #projectGprice::placeholder {
                    padding-left: 655px;
                }

                #projectDday {
                    width: 168px;
                    height: 40px;
                    margin-right: 10px;
                }

                #projectDday::placeholder {
                    text-align: right;
                }

                #projectPeriod,
                #deliveryDate {
                    width: 189px;
                    height: 40px;
                    margin-left: 30px;
                    color: rgb(94, 94, 94);
                }

                #projectShipment {
                    margin-right: 10px;
                }

                #pUrl {
                    color: rgb(94, 94, 94);
                    font-size: 19px;
                }

                #projectUrl {
                    width: 240px;
                    height: 40px;
                    margin-left: 60px;
                    font-size: 15px !important;
                }

                #projectUrl::placeholder {
                    padding: 10px;
                }

                #projectKeyword {
                    height: 40px;
                    width: 388px;
                    font-size: 14px !important;
                    border-radius: 5px;
                    border: 1.4px solid rgb(224, 224, 224);
                }

                #keywordBtn {
                    width: 121px;
                    height: 40px;
                    font-size: 15px !important;
                    border: none;
                    border-radius: 5px;
                    background-color: rgb(224, 224, 224);
                }

                #keywordBox {
                    width: 675px;
                    height: 225px;
                    padding: 40px;
                    background-color: rgba(41, 128, 185, 0.16);
                    border-radius: 50px;
                    font-size: 20px;
                }

                #keywordBox span {
                    margin: 10px;
                }

                .bankOption {
                    width: 113px;
                    height: 40px;
                }

                #bankAccount {
                    width: 548px;
                    height: 40px;
                }

                #accountHolder {
                    width: 675px;
                    height: 40px;
                }

                .partnerWebSns {
                    width: 616px;
                    height: 40px;
                }

                .regiReward {
                    background-color: rgba(224, 224, 224, 0.45);
                    width: 95%;
                    padding: 40px;
                    padding-left: 20px !important;
                    color: rgb(51, 51, 51);
                }

                .regiReward th {
                    width: 200px;
                    height: 80px;
                }

                .regiReward input,
                textarea {
                    width: 467px;
                    margin-right: 16px;
                }

                .regiReward textarea {
                    height: 241px;
                }

                .regiReward button {
                    width: 130px;
                    height: 40px;
                    border: none;
                    border-radius: 5px;
                    margin-right: 10px;
                }

                #addOptionBtn {
                    width: 471px;
                    border: 2px solid rgb(41, 128, 185);
                    color: rgb(41, 128, 185);
                }

                #limitNum {
                    float: right;
                    width: 178px;
                }

                .regiRewardContent {
                    vertical-align: top;
                }

                .regiRewardContent td {
                    padding-top: 15px;
                }

                #regiOption {
                    font-size: 13px;
                    margin-bottom: 0px;
                }

                .registered {
                    height: 370px;
                    width: 213px;
                    padding: 20px;
                    border-radius: 5px;
                    border: rgb(94, 94, 94) 1px solid;
                }

                .registered span {
                    border: 2px solid rgba(235, 22, 103, 0.87);
                    color: rgba(235, 22, 103, 0.87);
                    padding: 5px;
                    border-radius: 5px;
                    font-size: 12px;
                }

                #registeredSpan1 {
                    color: white;
                    background-color: rgba(235, 22, 103, 0.87);
                }

                #editBtn {
                    width: 78px;
                    margin: 5px;
                }

                #deleteBtn {
                    width: 71px;
                    margin: 5px;
                }

                .registeredTable th {
                    width: 160px;
                    vertical-align: top;
                    padding-top: 13px;
                }

                #registeredName {
                    font-size: 20px !important;
                    color: rgb(64, 64, 64);
                }

                .registered p {
                    font-size: 13px;
                    color: rgb(127, 127, 127);
                }

                .registered b {
                    font-size: 16px;
                    color: rgb(64, 64, 64);
                }

                .regiOuter .registeredTable td {
                    padding: 7px;
                }

                .regiOuter #partnersPolicy {
                    height: 150px !important;
                    resize: none;
                }

                .defaultInfo,
                #partnersPolicy {
                    width: 776px;
                    height: 274px;
                    background-color: rgb(255, 255, 255);
                    color: rgb(94, 94, 94);
                    border: rgb(204, 204, 204) 1px solid;
                    padding: 20px;
                }

                .regiOuter #showPhone {
                    width: 20px;
                    margin-left: 30px;
                }

                .regiReward label {
                    color: rgb(41, 128, 185);
                }

                .blue {
                    color: rgb(34, 12, 224);
                }

                .pink {
                    color: rgb(245, 40, 153);
                }

                .delOpt{
                    float: right;
                    cursor: pointer;
                    margin-right: 20px;
                }

                .cateLeft a {font-size: 16px !important; margin-bottom: 0.35rem !important;}
                
				.cateCenter {font-size: 16px !important;}
				#cateContent{margin-left: -40px !important;}

            </style>
        </head>

        <body>

            <jsp:include page="../common/header.jsp" />

            <form id="insertForm" action="success.fd" method="post" enctype="multipart/form-data">
                <div class="regiOuter">
    
                    <!-- ???????????? ????????????/????????????/?????????????????? -->
                    <div class="regiHeader">
                        <p>
                            <b class="regi regiOne">????????????</b>
                            <b class="regi regiTwo" style="display: none;">?????????</b>
                            <b class="regi regiThree" style="display: none;">?????????</b>
                            <b class="regi regiFour" style="display: none;">????????????</b>
                            <b class="regi regiFive" style="display: none;">?????????/?????? ??????</b>
                        </p>
                        <button type="submit" class="registerBtn"  onclick="submitForm();">??????????????????</button>
                        <button type="button">????????????</button>
                        <button type="button" id="previewBtn" onclick="preview();">????????????</button>
                    </div>
    
                    <!-- ?????? -->
                    <div class="regiBody">
                        <!-- 1. ???????????? -->
                        <div class="regiOne regi">
                            <div class="regiInfo">
                                <b class="regiTitle">???????????? ?????? ?????? & ????????? ??????</b>
                                <p>
                                    ???????????? ????????? ?????? ???????????? ??????????????? 100% ????????? ???????????? ??????????????? ???????????? ?????????.
                                    <br>
                                    ??????????????? ????????? ??????, ??????????????? ??????????????? ???????????? ?????? ????????? ?????????????????????.
                                    <br>
                                    * ????????? (vat ??????) ???????????? ????????? 5% + ?????? ????????? 3%
                                </p>
                            </div><br>

                            
                        <script>
                            $(function(){
                                $('input').on('keydown', function (e) {
                                    if (e.which == 13) {
                                        e.preventDefault();
                                    }
                                });
                            })
                        </script>                            
                        
    
                            <!-- ????????????+?????? -->
                            <div>
                                <b class="regiTitle">??????????????? ????????? ??????????????? ??????????????????.</b> <br>
                                <select class="catOption" name="catNo">
                                    <option value="1">????????????</option>
                                    <option value="2">??????/??????</option>
                                    <option value="3">??????</option>
                                    <option value="4">??????</option>
                                    <option value="5">?????????</option>
                                    <option value="6">???????????????</option>
                                    <option value="7">??????/??????</option>
                                    <option value="8">?????????/????????????</option>
                                    <option value="9">????????????</option>
                                    <option value="10">??????/??????</option>
                                </select>
                                <input type="text" id="projectTitle" name="projectTitle" placeholder="????????? ??????????????????"  required>
                            </div><br>
    
                            <!-- ???????????? ?????? -->
                            <div>
                                <b class="regiTitle">???????????? ??????</b> <br>
                                <input type="text" id="projectSummary" name="projectSummary"
                                    placeholder="??????????????? ????????? ??????????????????"  required>
                            </div><br>
    
                            <!-- ?????? ?????? -->
                            <div>
                                <b class="regiTitle">?????? ????????? ???????????????</b> <br>
                                <input type="text" id="projectGprice" name="projectGprice" placeholder="0" value="0" required>???
                                
                                <!-- ???????????? typeMismatch ????????????: String ???????????? ??????
                                <script>
                                	$(function(){
                                		var gPrice = $("#projectGprice").val();
                                		$(gPrice).
                                	})
                                </script> -->
                            </div><br>
    
                            <div>
                                <b class="regiTitle">??????????????? ?????? ????????? ???????????????</b>
                                <p>?????? 7????????? ?????? 60????????? ???????????????.</p>
                                <input type="text" id="projectDday" placeholder="0" disabled name="dday">??? ?????? 
                                <input type="date" name="projectEndDT" id="projectPeriod">
    
                                <script>
                                    // ????????? ??????
                                   $(function(){
                                    $("#projectPeriod").change(function(){
                                        var today = new Date();
                                        var dueDay = $("#projectPeriod").val();   
                                        var gap = today.getTime() - new Date(dueDay).getTime();
                                        var result = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1;
                                        //console.log(result);
    
                                        $("#projectDday").attr('placeholder', result);
                                        $("#projectDday").val(result);
                                    })
                                   })
                                </script>
                            </div><br>
                            
    
                            <div>
                                <b class="regiTitle">??????????????? ?????? ???????????? ???????????????</b>
                                <p>????????? ????????? ?????? ??????????????? ??????????????? ??????????????????. <br>
                                    ?????? ????????? ????????? ?????? ???????????? ?????? ????????? ????????? ??????????????? ?????? ????????? ???????????????.
                                </p>
    
                                <!-- ???????????? ????????? ????????? ?????? ???????????? -->
                                <label for="projectShipment">
                                    <input type="checkbox" name="projectShipment" id="projectShipment" onclick="deliverYN();"> ????????? ???????????????
                                </label>
    
                                <input type="date" name="deliveryDate" id="deliveryDate">
    
                                <script>
                                    var shipDate = $('input[name=deliveryDate]');
                                   
                                    $('input[name=projectShipment]').change(function(){
                                        if($(this).prop("checked")){
                                            shipDate.hide();
                                            $('#deliveryDate').val('');
                                        }else{
                                            shipDate.show();
                                        }
                                    });
                                </script>
                            </div><br>
    
                            <div>
                                <b class="regiTitle">??????????????? ?????? ???????????? ??????????????????</b>
                                <p>??????????????? ?????? ????????? ?????? ??? ???????????????. ??????????????? ??? ?????? ????????? ??? ?????? ???????????? ??????????????????.(?????? ????????? 740*492 px)</p>
                                <!-- <button type="button"
                                    style="width: 449px; height: 311px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                    ?????? ????????? 740*492 px
                                </button><br><br> -->
                                <label for="upfile">???????????? :  </label>
                                <input type="file" name="upfile" id="upfile"> <!-- html ????????? ???????????? -->
                            </div><br>
    
                            <div>
                                <b class="regiTitle">???????????? ???????????? ???????????????</b><br>
                                <p style="font-size: 26px;">
                                    # <input type="text" name="projectKeyword" id="projectKeyword"
                                        placeholder=" ???????????? ??????????????????"> <button type="button" id="keywordBtn" onclick="addHash()">???????????? ??????</button>
                                </p>
                                <div id="keywordBox">
                                    <input type="hidden" name="hashtag" value="">
                                </div>
    
                                <script>
                                    var hashs = ""; // input type hidden??? ??????????????? ???
                                    $(function(){
                                        $('#projectKeyword').on('keydown', function(e) {
                                            if (e.which == 13) {
                                                e.preventDefault();
                                                addHash();
                                            }
                                        });
                                    })

                                    function addHash(){
                                        var hashtagi = $('input[id=projectKeyword]').val();
                                        if(hashtagi == ""){
                                            alert("???????????? ??????????????????.");
                                        }else{
                                            $('#keywordBox').last().append('<span> #' + hashtagi + '</span>');
                                            $('input[name=hashtag]').val(hashs);
                                            $('input[id=projectKeyword]').val('');
                                            hashs += '#'+ hashtagi + " ";
                                        }
                                    }
                                </script>
                            </div>
                            
                            <!-- ??????/????????? ?????? -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn oneSubmit" onclick="regiShow('Two')">??????</button>
                                <button type="button" class="regiResetBtn oneReset">?????????</button>
                            </div>
                        </div>
    
    
                        <!-- 2. ????????? -->
                        <div class="regiTwo regi" style="display: none;">
    
                            <!-- 
                            <div>
                                <b class="regiTitle">???????????? ?????? ????????? ???????????? ??????????????????</b>
                                <p>
                                    ????????? ???????????? ?????? ????????? ??????, ????????? ?????? ???????????????.
                                </p>
                            </div>
                            <br>
    
        
                                 ?????????
                                <div>
                                    <b class="regiTitle">???????????? ??????????????????</b><br>
                                    <button
                                        style="width: 255px; height: 185px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                        ?????? ????????? 740*417 px
                                    </button>
                                    <button
                                        style="width: 255px; height: 185px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                        +
                                    </button>
                                </div>
                                <br>
    
                             -->
                            
    
                            <!-- ????????? -->
                            <div>
                                <b class="regiTitle">???????????? ???????????? ???????????????</b>
                                <p>
                                    ??????????????? ???????????? ?????? ????????? ????????? ????????? ????????? ?????? ????????????. <br><br>
    
                                    Enter(???) : ?????? ??????, Shift + Enter : ??????????????????! <br>
                                    ????????? ??????/??? ??????????????? ?????? ??????????????? ?????? ??? ??? ????????????! <br>
                                    ???????????? ????????? ??? ????????? ???????????? ??????????????????. <br>
                                </p>
                                <textarea  id="summernote"   name="projectContent"
                                    style="width: 770px; height: 592px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white; resize: none;">
                                </textarea>
                                <!-- include libraries(jQuery, bootstrap) -->
                                <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
                                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
                                <!-- include summernote css/js -->
                                <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
                                <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
                                <script>
                                    // ????????????
                                    $(document).ready(function() {
                                        
                                        
                                        $('#summernote').summernote({
                                            height: 592,                    // ????????? ??????
                                            width: 770,                     // ????????? ?????? ??????
                                            minHeight: null,                // ?????? ??????
                                            maxHeight: 700,                // ?????? ??????
                                            focus: true,                    // ????????? ????????? ???????????? ????????? ??????
                                            lang: "ko-KR"                  // ?????? ??????         
                                        });
       
                                    });           
                                </script>
    
                            </div>
                                
                            <!-- ??????/????????? ?????? -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn twoSubmit" onclick="regiShow('Three')">??????</button>
                                <button type="button" class="regiResetBtn twoReset">?????????</button>
                            </div>
    
                        </div>
    
                        <!-- 3. ????????? -->
                        <div class="regiThree regi" style="display: none;">
                            <div>
                                <b class="regiTitle">???????????? ???????????? ??????????????????</b>
                                <p>
                                    ???????????? ????????? ???????????? ?????? 1??? ????????? ???????????? ????????? ?????????. <br>
    
                                    ????????? ????????? ???????????? ???????????? ????????? ????????? ???????????????.
                                </p>
                            </div>
    
                            <div class="regiReward">
                                <table>
                                    <tr>
                                        <th>
                                            <b class="regiTitle">????????? ??????</b>
                                        </th>
                                        <td>
                                            <input type="text" placeholder="1,000??? ?????? ????????? ?????????." name="rePrice" class="rePrice reAll">
                                        </td>
                                        <td>???</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <b class="regiTitle" style="line-height: 1;">????????? ??????<br>?????? ??? </b>
                                        </th>
                                        <td class="rewardLimitNum">
                                            <!-- ?????? ?????? 
                                                <button type="button" class="btn2 limitBtn1 limit" onclick="limitBtn(1); limitBtn1();">?????????</button>
                                                <button type="button" class="btn1 limitBtn2 limit" onclick="limitBtn(2); limitBtn2();">??????</button>
                                            -->
                                            <label for="limited" style="width:130px;">
                                                <input type="radio" class="limit" name="limit" id="limited" value="limited" style="width: 30px;" onclick="limitBtn(2); limitBtn2();" checked> ??????
                                            </label>
                                            <label for="unlimited">
                                                <input type="radio" class="limit" name="limit" id="unlimited" value="unlimited" style="width: 30px;"  onclick="limitBtn(1); limitBtn1();"> ?????????
                                            </label>
                                            <input type="hidden" class="limitation" name="limitation" value="Y">
                                            <input type="number" name="limitNum" id="limitNum" name="limitNum" class="limitNum reAll">
                                        </td>
                                        <td class="limitNum">???</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <b class="regiTitle">????????? ??????</b>
                                        </th>
                                        <td>
                                            <input type="text" name="reTitle" id="reTitle" class="reTitle reAll">
                                        </td>
                                        <td>0/30</td>
                                    </tr>
                                    <tr class="regiRewardContent">
                                        <th>
                                            <b class="regiTitle">????????? ??????</b>
                                        </th>
                                        <td>
                                            <textarea class="reAll reContent" name="reContent" placeholder="????????? ???????????? ????????? ???????????????"
                                                style="resize: none;"></textarea>
                                        </td>
                                        <td>0/70</td>
                                    </tr>
                                    <tr class="addOptionTr">
                                        <th>
                                            <b class="regiTitle">????????? ??????</b>
                                        </th>
                                        <td>
                                            <button type="button" id="addOptionBtn" onclick="addOption();">????????? ?????? ????????????</button>
                                            <input type="hidden" class="optionYn" name="optionYn" value="N">
                                        </td>
                                    </tr>
                                    <tr class="optionOnTr" style="display: none;">
                                        <th>
                                            <b class="regiTitle">????????? ??????</b>
                                        </th>
                                        <td>
                                            <p id="regiOption">???????????? <b class="pink delOpt" onclick="delOpt();">????????????</b></p>
                                            <input class="optionInput reAll" name="option" type="text" placeholder="ex) ???????????? ???????????????">
                                        </td>
                                        <td>
                                            <p></p>0/20
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <b class="regiTitle">?????????????????????</b>
                                        </th>
                                        <td>
                                            <label for="yesShip" style="width:180px">
                                                <input type="radio" name="ship" id="yesShip" value="Y" style="width: 30px; " checked> ????????? ??????
                                            </label>
                                            <label for="noShip">
                                                <input type="radio" name="ship" id="noShip" value="N" style="width: 30px;"> ????????? ????????????
                                            </label>
                                            <input type="hidden" class="shipment" name="shipment" value="Y">
                                            <!-- 
                                                <button class="btn1">????????? ??????</button>
                                                <button class="btn2">????????? ????????????</button>
                                                -->
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            
                            <!-- ??????/????????? ?????? -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn threeSubmit" onclick="addedReward();">??????</button>
                                <button type="button" class="regiResetBtn threeReset">?????????</button>
                            </div>
                                <!-- ????????? ?????????  -->
                            <div class="rewardOn" style="display: none;">
                                <table class="registeredTable">
                                    <hr><br>
                                    
                                    <tr>
                                        <th colspan="4">
                                            <b class="regiTitle" style="line-height: 1;"> &nbsp; ????????? ????????? ???????????? <br>&nbsp;</b>
                                        </th>
                                    </tr>
                                </table>

                                <script>
                                    function addOption() {
                                        $('.addOptionTr').hide();
                                        $('.optionOnTr').show();
                                        $('.optionYn').val('Y');
                                    }
                
                                    function delOpt(){
                                        $('.optionOnTr').hide();
                                        $('.optionInput').val('');
                                        $('.addOptionTr').show();
                                        $('.optionYn').val('N');
                                    }

                                    var count = 0;
                
                                    function addedReward(){
                                        if($('#unlimited').prop("checked")){
                                            $('.limitation').val('N');
                                        }else{
                                            $('.limitation').val('Y');
                                        }

                                        $('#noShip').change(function(){
                                            if($('#noShip').prop("checked")){
                                                $('.shipment').val('N');
                                            }else{
                                                $('.shipment').val('Y');
                                            }
                                        })

                                        var price = $('input[name=rePrice]').val();
                                        var limit = $('input[name=limitNum]').val();
                                        var limited = $('input:radio[name=limit]:checked').val();
                                        var limitation = $('input[name=limitation]').val();
                                        var title = $('input[name=reTitle]').val();
                                        var content = $('.reContent').val();
                                        var option = $('input[name=option]').val();
                                        var optionYn = $('input[name=optionYn]').val();
                                        var ship = $('input[name=ship]:checked').val();
                                        var shipment = $('input[name=shipment]').val();
                                    
                                        
                                        // limited??? ?????????????????????, limit??? ???????????? ?????? => ?????????
                                        // unlimited??? ????????????????????? , limit???????????? ?????? ????????????
                                        if ( limited == "limited" && limit == ""){
                                            alert("???????????? ??????????????????.");
                                        }else{
                                            if( price == "" || title == "" || content == "" ){
                                                
                                                alert("???????????? ??????????????????.");
                                                //console.log('?????????');
                                                
                                            }else{
                                                
                                                var aa = '<td class="td">'+
                                                            '<div class="registered registered1">'+
                                                                '<div style="height: 290px;">'+
                                                                    '<div>'+
                                                                        '<p><b id="registeredName">' + price + '??? ??????</b></p>'+
                                                                        '<span id="registeredSpan1">' + limit + '??? ??????</span><br>'+
                                                                    '</div><br>'+
                                                                    '<div><p id="registeredTC">???????????? <br> <b>' + title + " </b> <br> " + content + '</p></div>';
                                                    
                                                if(option != ""){
                                                    aa += '<p id="optionP"><input placeholder='+ option + ' disabled></p>';
                                                    optionYn = 'Y';
                                                }
                
                                                    aa +=   '</div>'+
                                                                '<div class="editDel">'+
                                                                    '<img id="editBtn" src="${ pageContext.request.contextPath }/resources/images/editBtn.PNG" onclick="">'+
                                                                    '<img id="deleteBtn"src="${ pageContext.request.contextPath }/resources/images/deleteBtn.PNG" onclick="deleteRe();">'+
                                                                '</div>'+
                                                            '</div>'+
                                                        '</td>';
        
                                                    aa += '<input type="hidden" name="rewardList[' + count + '].rewardPrice" value="' + price +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardStatus" value="' + limitation +'">'+ //?????????: 'unlimited' ??????: 'limited' 
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardStock" value="' + limit +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardShip" value="' + shipment +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardTitle" value="' + title +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardContent" value="' + content +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].optionYn" value="' + optionYn +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardOption" value="' + option +'">';
                                                    
                                                if(count % 4 == 0) {
                                                    $('.registeredTable').append('<tr></tr>');
                                                }
                                                
                                                $('.registeredTable tr').last().append(aa);
                                                $(".rewardOn").show();
                                                
                                                count++;
                                                
                                            }

                                            
                                        console.log(optionYn);  
                                        console.log(option);
                                        }
                                        $('.reAll').val('');
                                        $('#limited').prop('checked', true);
                                        $(limitation).val('Y');
                                        $('.optionOnTr').hide();
                                        $('.addOptionTr').show();
                                        $(optionYn).val('N');
                                        $('#limitNum').show();
                                        $('#yesShip').prop('checked', true);
                                        $(shipment).val('Y');

										
                                        //console.log(limitation);    
                                        //console.log(shipment);
                                        
                                    }
                                </script>

                                <div class="regiBtn">
                                    <button type="button" class="regiSubmitBtn threeSubmit" onclick="regiShow('Four');">??????</button>
                                </div>
                            </div>
                        </div>
    
                        <!-- 4. ???????????? -->
                        <div class="regiFour regi" style="display: none;">
                            <div>
                                <b class="regiTitle">?????? ??? ?????? ????????? ???????????????</b>
                                <p>
                                    ????????? ????????? ???????????????.
                                </p>
                            </div><br>
    
                            <div class="regiReward">
                                <div>
                                    <b class="regiTitle">???????????? ?????? ??? ?????? ??????</b>
                                    <span class="pink">(????????????)</span>
                                    <textarea name="projectRefcon" id="partnersPolicy"
                                        placeholder="???????????? ?????? ??? ?????? ???????????? ??????????????? ???????????? ???????????????."></textarea>
                                </div><br>
                                <div>
                                    <b class="regiTitle">?????? ????????? ??????</b>
                                    <p>
                                        ?????? ?????? ????????? ??????????????????.
                                    </p>
                                    <div>
                                        <input type="text" name="partnerPhone" id="partnerPhone" placeholder="????????? ??????????????? (???. 010-1234-5678)">
                                        <label><input type="checkbox" id="showPhone"><input type="hidden" class="phoneHidden" value="N" name="phoneYN"  >
                                            ????????????</label>
                                        <script>
                                            $(function(){
                                                $('#showPhone').change(function(){
                                                    if($(this).prop("checked")){
                                                        $('.phoneHidden').val('Y');
                                                    }else{
                                                        $('.phoneHidden').val('N');
                                                    }
                                                    // console.log($('#showPhone').val());
                                                })
                                            })
                                        </script>
                                    </div>
                                </div><br>
                                <div>
                                    <b class="regiTitle">?????? ?????????</b>
                                    <p>
                                        ????????? ???????????????.
                                    </p>
                                    <input type="text" id="partnerEmail" name="partnerEmail" placeholder="abcd1234@withus.com">
                                </div><br>
    
                                <div class="defaultInfo">
                                    <p>
                                    <p class="blue">??????????????? ?????? ??? ???????????? ????????????</p>
    
                                    1. ???????????? ?????? ????????? ???????????? ?????? ??????????????? ?????? ????????? ???????????????. <br>
                                    2. ????????? ???????????? ????????? ????????? ??? ?????? ???????????? ?????? ?????????, ???????????? ?????? ???????????? ?????? ???????????? ?????? ???????????? ????????? ???????????? ?????? ??????
                                    ??????????????????. <br>
                                    3. ????????? ???????????? ???????????? ???????????? ??????, ???????????? ????????? ????????? ???????????? ?????? ???????????????????????????. <br>
                                    ?????? ?????? ????????? ????????? "<span class="pink pinkEmail">abcd1234@gogo.com
                                        <!--????????? ?????????-->
                                    </span>" , ????????? "<span class="pink pinkPhone">010-1234-5678
                                        <!--????????? ?????????-->
                                    </span>" ??? ??????????????????.
                                    </p>
                                </div><br>

                                <script>
                                    $(function(){
                                        
                                        $("#partnerPhone").change(function(){
                                            var phone = $("input[name=partnerPhone]").val();
                                            
                                            if( phone != null || phone != ""){
                                                $('.pinkPhone').empty().append(phone);
                                            }  
                                        })
                                        $("#partnerEmail").change(function(){
                                            var email = $("#partnerEmail").val();

                                            if( email != null || email != ""){
                                                $('.pinkEmail').empty().append(email);
                                            }  
                                        })
                                    })
                                </script>
    
                                <b>* ???????????? ????????? ????????? ???????????? ????????? ?????? ??? ????????? ???????????? ???????????? ???????????? ?????? ????????? ???????????????
                                    ?????? ???????????? ????????????.</b>
                            </div>
                                
                            <!-- ??????/????????? ?????? -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn fourSubmit" onclick="regiShow('Five');">??????</button>
                                <button type="button" class="regiResetBtn fourReset">?????????</button>
                            </div>
                        </div>
    
                        <!-- 5. ?????????/???????????? -->
                        <div class="regiFive regi" style="display: none;">
                            <div>
                                <b class="regiTitle">?????? ????????? ??????????????????</b><br>
                                <p>
                                    ???????????? ?????? ??? ??????????????? ????????? ??????????????????.
                                </p>
                            </div>
    
                            <!-- ??????/???????????? -->
                            <div>
                                <b class="regiTitle">?????? ????????? ???????????????</b><br>
                                <select class="bankOption" name="partnerBank">
                                    <option value="selectBank">????????????</option>
                                    <option value="????????????">????????????</option>
                                    <option value="????????????">??????</option>
                                    <option value="????????????">??????</option>
                                    <option value="????????????">??????</option>
                                    <option value="??????">??????</option>
                                    <option value="???????????????">???????????????</option>
                                </select>
                                <input type="text" id="bankAccount" name="partnerAccount" placeholder="????????????">
                            </div><br>
    
                            <!-- ???????????? -->
                            <div>
                                <b class="regiTitle">??????????????? ??????????????????</b><br>
                                <input type="text" name="partnerAcholer" id="accountHolder" placeholder="????????????">
                            </div><br>
    
                            <!-- sns -->
                            <div>
                                <div>
                                    <b class="regiTitle">??????????????? SNS ????????? ???????????????</b>
                                    <p>?????? ?????? ?????? ?????? ????????? ???????????????. ????????? ????????? ???????????????.</p>
                                    <table>
                                        <tr>
                                            <td align="center" width="70px" height="65px">
                                                <img src="${ pageContext.request.contextPath }/resources/images/webIcon.PNG"
                                                    style="height: 33px;">
                                            </td>
                                            <td>
                                                <input type="text" name="partnerWeb" id="partnerWeb" class="partnerWebSns">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <img src="${ pageContext.request.contextPath }/resources/images/snsIcon.PNG"
                                                    style="height: 33px;">
                                            </td>
                                            <td>
                                                <input type="text" name="partnerSNS" id="partnerSns" class="partnerWebSns">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                                
                            <!-- ??????/????????? ?????? -->
                            <div class="regiBtn">
                                <button type="submit" class="regiSubmitBtn fiveSubmit" onclick="submitForm();">????????????</button>
                                <button type="button" class="regiResetBtn fiveReset">?????????</button>
                            </div>
                        </div>
    
                        
                    </div>
    
    
                    <!-- ?????? ????????? -->
                    <div class="regiMenubar">
                        <p><b>???????????? ?????????</b></p>
                        <ol>
                            <!-- ???????????? ???????????? ????????????????????? -->
                            <li class="regiMenu liOne" onclick="regiShow('One');">????????????</li>
                            <li class="regiMenu liTwo" onclick="regiShow('Two');">?????????</li>
                            <li class="regiMenu liThree" onclick="regiShow('Three');">?????????</li>
                            <li class="regiMenu liFour" onclick="regiShow('Four');">????????????</li>
                            <li class="regiMenu liFive" onclick="regiShow('Five');">?????????/?????? ??????</li>
                        </ol>
                    </div>
                    <!-- ????????? ?????????????????? ????????? -->
                    <div class="regiMenuSelected regi regiOne" style="margin-top: -247px; ">&nbsp;</div>
                    <div class="regiMenuSelected regi regiTwo" style="margin-top: -206px; display: none;">&nbsp;</div>
                    <div class="regiMenuSelected regi regiThree" style="margin-top: -166px; display: none;">&nbsp;</div>
                    <div class="regiMenuSelected regi regiFour" style="margin-top: -125px; display: none;">&nbsp;</div>
                    <div class="regiMenuSelected regi regiFive" style="margin-top: -86px;  display: none;">&nbsp;</div>
    
                    <script>
                        // ???????????? ????????????
	                    function preview(){
                            window.open('', "previewWindow(preview)"/*, "????????????"*/);
                            $("#insertForm").attr("action", "preview.fd");
                            $("#insertForm").attr("target",  "previewWindow(preview)");
                            $("#insertForm").submit();
                        }
                        
                        // ???????????? ??? ???????????? ???????????? ??????????????????
                        function submitForm(){
                        	$("#insertForm").attr("action", "success.fd");
                        	$("#insertForm").submit();
                        }

                        function regiShow(className) {
                            $(".regi").hide();
                            $(".regi" + className).show();
                            $(".regiMenu").css('color', 'black');
                            $(".li" + className).css('color', 'rgb(41, 128, 185)');
                            $(window).scrollTop(0);
                        }
    
                        function limitBtn(className) {
                            $(".limit").css('background-color', 'rgb(224, 224, 224)');
                            $(".limit").css('color', 'black');
                            $(".limitBtn" + className).css('background-color', 'rgb(52, 152, 219)');
                            $(".limitBtn" + className).css('color', 'white');
                        }
    
                        function limitBtn2(){
                            $(".limitNum").show();
                        }
    
                        function limitBtn1(){
                            $(".limitNum").hide();
                        }


                    </script>
                </div> <!-- outer /div -->
            </form>

        </body>

        </html>