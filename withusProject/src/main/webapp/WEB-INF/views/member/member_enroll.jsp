<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
            <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
            <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

            <style>
                @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

                
                .back {
                    
                    width: 100vw;
                    height: 100vh;
                    background: url(https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=813&q=80);
  			 	    background-size: cover;		
                    outline: 0;
                    border: 0;

                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .login {
                    background: rgba(255, 255, 255, 0.4);
                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    backdrop-filter: blur(5px);
                    -webkit-backdrop-filter: blur(5px);
                    border-radius: 10px;
                    border: 1px solid rgba(255, 255, 255, 0.18);
                    height: 500px;
                    width: 400px;
                    margin-left: auto;
                    margin-right: auto;
                }

                .header {
                    text-align: center;
                    font-size: 3em;
                    font-weight: bold;
                }

                .textbtn {
                    background: rgba(255, 255, 255, 0.4);
                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    backdrop-filter: blur(5px);
                    -webkit-backdrop-filter: blur(5px);
                    border-radius: 10px;
                    border: 1px solid rgba(255, 255, 255, 0.18);
                    height: 20px;
                    width: 300px;
                    margin-left: auto;
                    margin-right: auto;

                    padding: 0;
                }

                .textbtn input {
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0);
                    border: 0;
                }

                .textbtn input:focus {
                    outline: 0;
                }

                .check {
                    margin-left: 50px;
                }

                .id {
                    margin-left: 80px;
                    font-size: 12px;
                }

                .test {
                    background: rgba(255, 255, 255, 0.4);
                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    backdrop-filter: blur(5px);
                    -webkit-backdrop-filter: blur(5px);
                    border-radius: 10px;
                    border: 1px solid rgba(255, 255, 255, 0.18);
                    height: 40px;
                    width: 300px;
                    /*????????? ????????? ??????????????? ???????????? ????????????*/
                    display: table;
                    margin-left: auto;
                    margin-right: auto;
                    padding: 0;
                    border: 0;
                    outline: 0;
                }

                .join {
                    margin-left: 90px;
                    font-size: 13px;
                }

                #naver_id_login img {
                    border-radius: 50%;
                }

                ul {
                    list-style: none;
                    margin: 0px;
                    padding: 0px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                li {
                    margin: 0px;
                    margin-right: 15px;
                    padding: 0px;
                    float: left;
                }

            </style>
        </head>

        <body>
         
                <div class="back">
                    <div class="login">
                        <p class="header">Sign-up</p>
                        <form action="insert.me" method="post" id="enrollForm">
                            
                        <div class="textbtn">
                            <input type="text" class="form-control" id="memberName" name="memberName" placeholder="  Please Enter Name" required>
                        </div>
                        <br>
                        <div class="textbtn">
                            <input type="email" class="form-control" id="memberId" name="memberId" placeholder="  Please Enter Email" required>
                            <div id="checkResult" style="display:none; font-size:0.8em;"></div>
                        </div>
                        <br> <br>
                        <div class="textbtn">
                            <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="  ???????????? ??????" required>
                        </div>
                        <br>
                        <div class="textbtn">
                            <input type="password" class="form-control" id="checkPwd" placeholder="  ???????????? ??????" required>
                        </div>
                        <br><br>
                        <div class="btns">
                            <button type="submit" class="test btn" id="enrollBtn" disabled style="background-color: rgb(71, 189, 250); color: white;">????????????</button>
                        </div>
                    </form>
                        


                      


                    </div>
                </div>
                <script>
                    $(function(){
                        
                        var $idInput = $("#enrollForm input[name=memberId]"); // ???????????? ???????????? input?????? ??????
                        
                        $idInput.keyup(function(){
                        
                            // ?????? ?????? 5?????? ???????????? ?????????????????? ajax ???????????? ???????????? ?????????
                            if($idInput.val().length >= 9){
                                
                                $.ajax({
                                    url:"idCheck.me",
                                    data:{checkId:$idInput.val()},
                                    success:function(result){
                                        
                                        if(result == "N"){ // ???????????????
                                            // ????????? ????????? ??????, ?????? ????????????
                                            $("#checkResult").show();
                                            $("#checkResult").css("color", "red").text("????????? ???????????? ???????????????. ?????? ??????????????????.");
                                            $("#enrollBtn").attr("disabled", true);    							
                                        }else{ // ????????????
                                            // ????????? ????????? ??????, ?????? ?????????
                                            $("#checkResult").show();
                                            $("#checkResult").css("color", "#ffea51").text("??????????????? ??????????????????.");
                                            $("#enrollBtn").removeAttr("disabled");    							
                                        }
                                        
                                    },error:function(){
                                        console.log("????????? ??????????????? ajax ?????? ??????");
                                    }
                                })
                                
                                
                            }else{ // ???????????? 5?????? ??????????????? => ????????? ????????? ?????? (????????? ???????????? ??????) => ?????? ?????????????????? ????????????, ????????? ??????????????????
                                $("#enrollBtn").attr("disabled", true);
                                $("#checkResult").hide();
                            }
                            
                        })
                        
                        console.log('Location.search : ', location.search);
                       
                        
                        // ???????????? ????????????
                        let parms = location.search;
                        if(parms && parms.includes("email=") && parms.includes("name=")){
                            parms = parms.replace('?', '');
                            parms = parms.split("&");
            
                            const email = parms[0].replace("email=", '');
                            const name = decodeURI(parms[1].replace("name=", ''));
                            $("#memberId").val(email);
                            $("#memberName").val(name);
                        }
                                
                    })    	
                </script>
            
              
        </body>

        </html>