<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
        <title>#광광곳곳</title>
    
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-plot-listing.css">
        <link rel="stylesheet" href="assets/css/animated.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    <!--
    
    TemplateMo 564 Plot Listing
    
    https://templatemo.com/tm-564-plot-listing
    
    -->
    <style>
        /*리뷰 작성*/
        #review-form{padding: 100px;background:rgb(242, 238, 234); border: 1px solid #000; background-clip: content-box;}
        #review-form .section{border-bottom:solid #E0E0E0 1px;padding:20px 30px;}
        #review-form .section:after{content:'';clear:both;display:block;width:0px;height:0px;}
        #review-form .review-title > p{color:#999999;margin-top:5px;font-size:12px;}
    
        #review-form .rating-title{float:left;width:290px;}
        #review-form .rating-title i{color:#EE4949}
        #review-form .score_box {float:right;width:300px;padding:18px 15px 15px 24px;border:solid #E0E0E0 1px;line-height:25px;}
        #review-form .score_box > div{}
        #review-form .score_box > div:after{content:'';clear:both;display:block;width:0px;height:0px;}
        #review-form .score_star {float:right;width:300px;padding-top:5px;}
        #review-form .score_title {float:right;width:65px;height:25px;border-radius:2px;color:#FFFFFF;text-align:center;padding-top:2px;}
        #review-form .star{margin-top:-5px;cursor:pointer;}
        #review-form .star_on {background:url('https://s3-ap-northeast-1.amazonaws.com/dcicons/2018/images/mobile/appraisal/review-rating-top-on@2x.png');background-size:25px 25px;display:inline-block;width:25px;height:25px;}
        #review-form .star_off {background:url('https://s3-ap-northeast-1.amazonaws.com/dcicons/2018/images/mobile/appraisal/review-rating-top-off@2x.png');background-size:25px 25px;display:inline-block;width:25px;height:25px;}
        .score_text {border:none;display:inline-block;width:55px;height:25px;text-align:center;}
        .score {border:none;display:inline-block;width:55px;height:15px;}
        #review-form .radio_score {float:right;width:180px;padding-top:5px;}
    
        #review-form .list-keyword{padding-bottom:20px;}
        #review-form .clear{clear:both;width:0px;height:0px;}
        #review-form .title{font-weight:bold;}
        #review-form .title > span {font-weight:normal}
        #review-form .title i{color:#EE4949}
        #review-form .list-keyword .input-text{width:400px;height:40px;border:solid #D5D5D5 1px;font-size:inherit;line-height:inherit}
    
        #review-form textarea{font-size:inherit;line-height:inherit;margin-top:10px;}
        .bc-gray-review {background-color:#D5D5D5;}
        .bc-blue{background-color:#2483FF;}
    
        .keyword_normal {float:left;border:solid #999999 1px;border-radius:2px;text-align:center;padding:2px 8px 0 18px;margin:8px 8px 0 0;background: url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-tag-nor.png) no-repeat -1px;cursor:pointer;}
    
        .keyword_check {float:left;border:solid #2483FF 1px;border-radius:2px;text-align:center;padding:2px 8px 0 18px;margin:8px 8px 0 0;background: #2483FF url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-tag-sel.png) no-repeat -1px;color:#FFFFFF;cursor:pointer;}
    
        .keyword_etc {float:left;border:solid #09D2E5 1px;border-radius:2px;text-align:center;padding:2px 8px 0 18px;margin:8px 8px 0 0;background: #09D2E5 url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-tag-added.png) no-repeat -1px;color:#FFFFFF;cursor:pointer;}
    
        .btn {
            border:none;
            -webkit-border-radius:2px;
            -moz-border-radius:2px;
            border-radius:2px;
            width:100%;
            cursor:pointer;
            height:40px;
            font-size:13px;
        }
    
        .btn-black {
            background-color:#222222;
            color:#FFFFFF;
        }
    
        .btn.w100{width:100px;}
        .fc-blue{color:#2483FF}
        .fc-red{color:#EE4949}
        .fc-gray{color:#999}
        .w90{width:90px;}
        .w240{width:240px;}
    
    
        .image {float:left;margin-right:8px;margin-bottom:8px;}
        .image .image_wrap{width:100px;height:100px;overflow:hidden;position:relative}
        .image .image_wrap img{position:absolute;width:100%;height:100%;top:0px;left:0px;}
        .image .image_wrap img.wl{top:50%;left:50%;height:100%;width:auto;-webkit-transform: translate(-50%,-50%);  -ms-transform: translate(-50%,-50%);  transform: translate(-50%,-50%);}
        .image .image_wrap img.hl{height:auto;width:100%;top:50%;left:50%;-webkit-transform: translate(-50%,-50%);  -ms-transform: translate(-50%,-50%);  transform: translate(-50%,-50%);}
        .image_txt {text-align:right;font-size:10px;color:#999999;cursor:pointer;}

        .point_box {margin-top:12px;padding:14px 24px;background-color:#F9F9F9;border:solid 1px #E9E9E9;}
        .point_box dl {border:solid #E9E9E9 1px;}
        .point_box dt {margin-bottom:9px;float:left;}
        .point_box dt em {display:none;padding-left:12px;font-style:normal;color:#2483FF;}
        .point_box dd {float:right;font-weight:bold;color:#999999;}
        .point_box dd.active {float:right;font-weight:bold;color:#2483FF;}

        .checkbox { cursor:pointer; }
        .checkbox .check-icon { display:inline-block; width:30px; height:30px; margin-right:4px; background:url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-signup-chk-off.png) left center no-repeat; vertical-align:middle; transition-duration:.3s; }
        .checkbox input[type=checkbox] { display:none; }
        .checkbox input[type=checkbox]:checked + .check-icon { background-image:url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-chk-on.png); }
    

        /*평점별주기*/
        .star-rating {
        display: flex;
        flex-direction: row-reverse;
        font-size: 2.25rem;
        line-height: 2.5rem;
        justify-content: space-around;
        padding: 0 0.2em;
        text-align: center;
        width: 5em;
        }
        
        .star-rating input {
        display: none;
        }
        
        .star-rating label {
        -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
        -webkit-text-stroke-width: 2.3px;
        -webkit-text-stroke-color: #2b2a29;
        cursor: pointer;
        }
        
        .star-rating :checked ~ label {
        -webkit-text-fill-color: gold;
        }
        
        .star-rating label:hover,
        .star-rating label:hover ~ label {
        -webkit-text-fill-color: #fff58c;
        }

    </style>


</head>
<body >
    <%int storeId = Integer.parseInt(request.getParameter("storeId")); %>
    <%String storeName = request.getParameter("storeName"); %>
     <input type="hidden" id = "storeId" value="<%=storeId%>"/>
     <input type="hidden" id = "storeId" value="<%=storeName%>"/>
    <div id="container-wrap" class="div-cont" >
        <input id="hid_month_point" type="hidden" value="0">
        <input id="hid_contents_point" type="hidden" value="100">
        <input id="hid_photo_point" type="hidden" value="100">
        <input id="hid_menu_point" type="hidden" value="100">
        <input id="hid_complete" type="hidden" value="N">
        <input id="hid_current" type="hidden" value="review.php">

        <div id="contents">
        
            <div id="subright-cont">
                <!--<form id="frm-image-upload" name="frm-image-upload" method="post" enctype="multipart/form-data" target="iframe-image-upload"></form>

                <div id="frm-photo"></div>
                <div id="frm-menu"></div>-->

                <div id="review-form">

                    <!-- form --><!--  enctype="multipart/form-data" -->
                    <form id="frm_action" method="POST" action="reviewRegister" enctype="multipart/form-data">
                        <div id="add-photo-list"></div>
                        <div id="add-menu-list"></div>

                        <input name="retURL" type="hidden" value="">
                        <input name="v_rid" type="hidden" value="xArNDLm2fV1z">
                        <input name="rv_id" type="hidden" value="">
                        <input name="contents_point" type="hidden" value="0">
                        <input name="photo_point" type="hidden" value="0">
                        <input name="menu_point" type="hidden" value="0">

                        <input id="hid_keyword_check_purpose" type="hidden" name="checkPurpose" value="">
                        <input id="hid_keyword_check_mood" type="hidden" name="checkMood" value="">
                        <input id="hid_keyword_check_facility" type="hidden" name="checkFacility" value="">

                        <input id="hid_keyword_etc_purpose" type="hidden" name="etcPurpose" value="">
                        <input id="hid_keyword_etc_mood" type="hidden" name="etcMood" value="">
                        <input id="hid_keyword_etc_facility" type="hidden" name="etcFacility" value="">

                        <input id="hid_remove_photo" type="hidden" name="removePhoto" value="">
                        <input id="hid_remove_menu" type="hidden" name="removeMenu" value="">

                        <input type="hidden" name="beforePhoto" value="0">
                        <input type="hidden" name="beforeMenu" value="0">
                    <div class="section">
                        <h5>평가를 완료하시면 100포인트가 적립됩니다.</h5>                    
                    </div>
                    <div class="section">
                        <div class="rating-title">
                            <strong>전체평점<i>*</i></strong><br>
                            <span>이 음식점에 대한 전반적인 평가를 해주세요.</span>
                            
                        </div>
                      
                        <div >
                            <input id="hid_score" name="score" type="hidden" value="">
                            <div class="score_star">
                                <div class="star-rating space-x-4 mx-auto">
                                    <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                                    <label for="5-stars" class="star pr-4">★</label>
                                    <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                                    <label for="4-stars" class="star">★</label>
                                    <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                                    <label for="3-stars" class="star">★</label>
                                    <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                                    <label for="2-stars" class="star">★</label>
                                    <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                                    <label for="1-star" class="star">★</label>
                                </div>
                            </div>    
                        </div>
                    </div>
                    <div class="section">
                        <div class="rating-title">
                            <strong>항목별 평점<i>*</i></strong><br>
                            <span>이 음식점의 맛, 가격, 서비스를 항목별로 나누어 평가해주세요.</span>
                        </div>
                        <div class="score_box">
                            <div>
                                <input id="hid_taste" name="star_taste" type="hidden" value="">
                                <div class="fl">맛</div>
                                <div class="score_title bc-gray-review"></div>
                                <div class="score_star radio_score" data-type="taste">
                                <input type="radio" id="taste1" name="taste" class="score">
                                <input type="radio" id="taste2" name="taste" class="score">
                                <input type="radio" id="taste3" name="taste" class="score">
                                <label for="taste1" class="score_text">맛없음</label>
                                <label for="taste2" class="score_text">보통</label>
                                <label for="taste3" class="score_text">맛있음</label></div>
                                <div class="clear"></div>
                            </div>
                            <div style="margin:32px 0;">
                                <input id="hid_price" name="star_price" type="hidden" value="">
                                <div class="fl">가격</div>
                                <div class="score_title bc-gray-review"></div>
                                <div class="score_star radio_score" data-type="price">
                                <input type="radio" id="price1" name="price" class="score">
                                <input type="radio" id="price2" name="price" class="score">
                                <input type="radio" id="price3" name="price" class="score">
                                <label for="price1" class="score_text">저렴</label>
                                <label for="price2" class="score_text">보통</label>
                                <label for="price3" class="score_text">비쌈</label></div>
                                <div class="clear"></div>
                            </div>
                            <div>
                                <input id="hid_service" name="star_service" type="hidden" value="">
                                <div class="fl">서비스</div>
                                <div class="score_title bc-gray-review"></div>
                                <div class="score_star radio_score" data-type="service">
                                <input type="radio" id="service1" name="service" class="score">
                                <input type="radio" id="service2" name="service" class="score">
                                <input type="radio" id="service3" name="service" class="score">
                                <label for="service1" class="score_text">불친절</label>
                                <label for="service2" class="score_text">보통</label><label for="service3" class="score_text">친절함</label></div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="section">
                        <div class="title">음식점 해시태그<i>*</i></div>
                            <div class="list-keyword">이 식당은 어떤 <span class="fc-blue">방문목적</span>에 적합한가요?<br>
                                <div id="div_keyword_purpose">
                                    <div class="keyword_normal" value="혼밥">혼밥</div>
                                    <div class="keyword_normal" value="데이트">데이트</div>
                                    <div class="keyword_normal" value="친구">친구</div>
                                    <div class="keyword_normal" value="가족외식">가족외식</div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="list-keyword">이 식당의 <span class="fc-blue">분위기</span>를 선택해주세요? <br>
                                <div id="div_keyword_mood">
                                    <div class="keyword_normal" value="숨은맛집">모던</div>
                                    <div class="keyword_normal" value="서민적인">클래식</div>
                                    <div class="keyword_normal" value="캐주얼한">빈티지</div>
                                    <div class="keyword_normal" value="고급스러운">레트로</div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="list-keyword">이 식당은 어떤 <span class="fc-blue">편의시설</span>이 있었나요?<br>
                                <div id="div_keyword_facility">
                                    <div class="keyword_normal" value="무료주차">무료주차</div>
                                    <div class="keyword_normal" value="노키즈존">노키즈존</div>
                                    <div class="keyword_normal" value="놀이방">놀이방</div>
                                    <div class="keyword_normal" value="반려동물동반">반려동물동반</div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                    <div class="section">
                                            <!-- 방문후기 -->
                        <input id="hid_contents_deny" type="hidden" value="">
                        <div style="position:relative">
                            <div class="title"><strong>방문후기</strong> <span class="deny fc-red"></span></div>
                            <div style="position:absolute;right:0px;top:0px;"></div>
                            <div class="clear"></div>
                        </div>

                        <textarea id="txt_contents" name="content" class="fs-13" placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요." style="border:solid 1px #D5D5D5; width:100%; height:120px;"></textarea>
                        <div style="padding-top:5px;">
                            <div id="div_contents_point" class="fl fc-blue " style="display:none"><img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-point-save-ok.png" style="margin-top:-3px;"></div>
                            <div class="fr"><span id="lbl_limit">0</span> / 500</div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="section">
                                            <!-- 사진 -->
                        <div>
                            <input id="hid_photo_deny" type="hidden" value="">
                            <input id="hid_photo" name="photos" type="file" style="display:none;">
                            <div class="title fl">
                                음식, 실내외 사진 <span class="fs-11 fc-red"></span><br>
                                <span class="fc-gray" style="line-height:1.0;"></span>
                            </div>
                            <div class="fr">
                                                            <button id="btn_photo" type="button" class="btn btn-black w90 fr">사진첨부</button>
                                                            <button id="btn_photo" type="button" class="btn btn-black w90 fr">영수증첨부</button>
                                                        </div>
                            <div class="clear"></div>
                        </div>
                        <div id="div_photo" style="display:block;margin-top:10px;" data-max="15">
                                                </div>
                        <div class="clear"></div>
                        <div id="div_photo_point" class="fl fc-blue " style="display:none"><img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-point-save-ok.png"></div>
                    </div>
                    
                        <!-- 클린평가 -->
                        <div class="section">
                            <div class="title">
                                <label class="checkbox"><input id="ckb_oath" type="checkbox" value="Y"><i class="check-icon"></i> 클린평가 서약</label>
                            </div>
                            <div style="padding-left:38px;">위 작성된 평가는 허위후기, 음식점 관련자의 홍보성 내용, 경쟁업소의 왜곡된 평가가 아님을 서약합니다.</div>
                        </div>
                   </form>

                    <div style="padding:20px 0px;text-align:center;">
                        <button id="btn_save" type="button" class="btn btn-black w240">평가제출</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    



<script src="https://cdnjs.cloudflare.com/ajax/libs/exif-js/2.1.0/exif.min.js"></script>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script>
    var photo_end = menu_end = false;
    var photo_cnt = menu_cnt = now_cnt = 0;

    $(function(){
        var point	= {"contents" : 0, "photo" : 0, "menu" : 0};
        var aScoreText	= ["", "매우불만", "불만", "보통", "만족", "매우만족"];
        var tasteText   = ["", "맛없음", "보통", "맛있음"];
        var priceText   = ["", "불만", "보통", "만족"];
        var serviceText = ["", "불친절", "보통", "친절함"];
        var nScore		= 0;

        $('.star').hover(
            function() {
                nScore      = ($(this).index() + 1);
                var p       = $(this).parent();
                var datatype    = $(this).parent().attr("data-type");

                // 별
                if( p.parent().find("input[type=hidden]").val() ) {
                    p.find("i").removeClass("star_on");
                    p.find("i").addClass("star_off");
                }

                p.find("i:lt(" + nScore + ")").removeClass("star_off");
                p.find("i:lt(" + nScore + ")").addClass("star_on");

                // 텍스트
                p.parent().find(".score_title").html();
                p.parent().find(".score_title").removeClass("bc-gray-review");
                p.parent().find(".score_title").addClass("bc-blue");
                p.parent().find(".score_title").html(aScoreText[nScore]);


            }
            ,	function() {
                n	= ($(this).index() + 1);
                var p	= $(this).parent();
                p.find("i:lt(" + nScore + ")").removeClass("star_on");
                p.find("i:lt(" + nScore + ")").addClass("star_off");

                if( p.parent().find("input[type=hidden]").val() ) {
                    p.parent().find(".score_title").html(aScoreText[nScore]);
                }
                else {
                    p.parent().find(".score_title").removeClass("bc-blue");
                    p.parent().find(".score_title").addClass("bc-gray-review");
                    p.parent().find(".score_title").html("평가없음");
                }
            }
        );

        $('.star').parent().mouseleave(function() {
            var n	= $(this).parent().find("input[type=hidden]").val();
            if( n ) {
                $(this).find("i:lt(" + n + ")").removeClass("star_off");
                $(this).find("i:lt(" + n + ")").removeClass("star_on");
                $(this).find("i:lt(" + n + ")").addClass("star_on");
                $(this).parent().find(".score_title").html(aScoreText[n]);
            }
        });

        $('.star').click(function() {
            var n = $(this).prop("for").substring(0, 1);
            //$(this).parent().parent().find("input[type=hidden]").val(n);
            $("#hid_score").val(n);
            // alert(n);
        });
        $('.score').click(function() {
            var datatype    = $(this).parent().attr("data-type");
            nScore          = ($(this).index() + 1);
            var n	        = ($(this).index() * 2 + 1);
            var p           = $(this).parent();
            $(this).parent().parent().find("input[type=hidden]").val(n);

            if(datatype == 'taste'){
                p.parent().find(".score_title").html();
                p.parent().find(".score_title").removeClass("bc-gray-review");
                p.parent().find(".score_title").addClass("bc-blue");
                p.parent().find(".score_title").html(tasteText[nScore]);
            }else if(datatype == 'price'){
                p.parent().find(".score_title").html();
                p.parent().find(".score_title").removeClass("bc-gray-review");
                p.parent().find(".score_title").addClass("bc-blue");
                p.parent().find(".score_title").html(priceText[nScore]);
            }else if(datatype == 'service'){
                p.parent().find(".score_title").html();
                p.parent().find(".score_title").removeClass("bc-gray-review");
                p.parent().find(".score_title").addClass("bc-blue");
                p.parent().find(".score_title").html(serviceText[nScore]);
            }
        });


        $('[class^=keyword]').click(function() {
            var keyword	= $(this).attr("class");
            if (keyword != "keyword_check" && $(this).parent().find(".keyword_check").length > 0) {
				alert("하나만 선택 가능합니다.");
				return;
            }
            var p		= $(this).parent();
            $(this).removeClass(keyword);
            if( keyword == "keyword_normal" ) {
                if( $(this).attr("value") == "해당없음" ) {
                    p.find("[class=keyword_etc]").remove();
                    p.find("[class^=keyword]").addClass("keyword_normal");
                    p.find("[class^=keyword]").removeClass("keyword_check");
                }
                else {
                    p.find("[value=해당없음]").removeClass("keyword_check");
                    p.find("[value=해당없음]").removeClass("keyword_normal");
                    p.find("[value=해당없음]").addClass("keyword_normal");
                }
                $(this).addClass("keyword_check");
            }
            else if( keyword == "keyword_check" ) {
                $(this).addClass("keyword_normal");
            }
            else if( keyword == "keyword_etc" ) {
                $(this).remove();
            }
        });

        // 키워드 추가
        $('[id^=txt_keyword]').keyup(function(e) {
            var code	= (e.keyCode ? e.keyCode : e.which);
            if( code == 13 ) {
                setKeyword($(this));
            }
            else {
                var regExc = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi
                if(regExc.test($(this).val())) {
                    $(this).val($(this).val().replace(regExc, ""));
                }
            }
        });

        // 키워드 추가 버튼
        $('[id^=btn_keyword]').click(function() {
            var keyword	= "#" + $(this).attr("id").replace("btn", "txt");
            if( $(keyword).val() ) {
                setKeyword($(keyword));
            }
        });

        //방문 후기
        $('#txt_contents').keyup(function() {
            var regExc = /[&+]/gi
            if(regExc.test($(this).val())) {
                $(this).val($(this).val().replace(regExc, ""));
            }

            CutStrLength($(this).val().length, 1000, 'lbl_limit');
            
            if ($(this).val().length > 500) {
            	$(this).val($(this).val().substring(0, 500));
            	$(this).trigger("keyup");
            }
            
            /* if( $('#hid_month_point').val() < 5000 ) {
                if( $(this).val().length < 30 ) {
                    $('#div_contents_point').hide();
                    setPoint("m", "contents");
                }
                else {
                    setPoint("p", "contents");
                }
            } */
        });
        
        function CutStrLength(a, lngt, id) {
        	console.log(a);
        	$("#" + id).text(a);
        }

        // 음식사진 저장
        $('#btn_photo').click(function() {
            $('#hid_photo').click();
        });
        $('#hid_photo').change(function(e) {
        	addFiles(e);
            imageUpload(this, 'photo',3);
        });

        // 메뉴사진 저장
        $('#btn_menu').click(function() {
            $('#hid_menu').click();
        });
        $('#hid_menu').change(function() {
            imageUpload(this, 'menu',10);
        });

        var rotation = {
            1: 'rotate(0deg)',
            3: 'rotate(180deg)',
            6: 'rotate(90deg)',
            8: 'rotate(270deg)'
        };
        
        var filesTempArr = [];
     // 파일 추가
     function addFiles(e) {
         var files = e.target.files;
         var filesArr = Array.prototype.slice.call(files);
         var filesArrLen = filesArr.length;
         var filesTempArrLen = filesTempArr.length;
         if (filesTempArrLen.length > 0) {
        	 return;
         }
         for( var i=0; i<filesArrLen; i++ ) {
             filesTempArr.push(filesArr[i]);
         }
         $(this).val('');
     }
     // 파일 삭제
     function deleteFile (eventParam, orderParam) {
         filesTempArr.splice(orderParam, 1);
     }

        function imageUpload(input, type, max)
        {
            var file_name = $(input).val();

            var ext = file_name.slice(file_name.lastIndexOf(".") + 1).toLowerCase();

            if (!(ext == "gif" || ext == "jpg" || ext == "jpeg" || ext == "png")) {
                alert("이미지파일 (.jpg, .jpeg, .png, .gif ) 만 업로드 가능합니다.");
                return false;
            }

            var file, img;
            var _URL = window.URL || window.webkitURL;
            var cnt = $("#div_" + type + " .image").length;
            if((file = input.files[0])) {
                var $temp = $(input).clone();

                img = new Image();
                img.src = _URL.createObjectURL(file);

                img.onload = function(e) {

                    var width = this.width;
                    var height = this.height;

                    var clas = '';
                    if(width > height) {
                        clas = 'wl';
                    }
                    else if (width < height){
                        clas = 'hl';
                    }

                    var $img = $("<div class='image'></div>");
                    $img.append("<div class='image_wrap'><img src='" + img.src + "'/ ></div>");

                    window.EXIF.getData(file, function () {
                        var orientation = EXIF.getTag(this, "Orientation");

                        if(orientation) {
                            $img.find('img').addClass(clas).css('transform','translate(-50%, -50%) ' + rotation[orientation]);
                        }
                    });

                    $img.append("<div class='image_txt image_del' data-type='" + type + "' data-id='0'>삭제</div>");
                    $("#div_" + type).append($img);
                    $("#frm-" + type).append($temp.attr('id','add_' + type + '_' + cnt).attr('name', type + '_upload'));
                    getImageCount(type);
                    if(max == $("#div_" + type + " image").length) {
                        $("#btn_" + type).hide();
                    }
                }
            }
        }

        // 방문후기
        if( !$('#hid_contents_deny').val() ) {
            $('#txt_contents').keyup();
        }

        // 사진
        if( !$('#hid_photo_deny').val() ) {
            getImageCount("photo");
        }

        // 매장정보
        if( !$('#hid_menu_deny').val() ) {
            getImageCount("menu");
        }

        //이미지 삭제
        $(document).on("click",".image_del",function(){
            var type = $(this).attr('data-type');
            var id = $(this).attr('data-id');

            if(id != "0") {
                var val = $("#hid_remove_" + type).val();
                if(val == "") {
                    $("#hid_remove_" + type).val(id);
                }
                else {
                    $("#hid_remove_" + type).val($("#hid_remove_" + type).val() + ',' + id);
                }
            }
            else {
                var index = $("#div_" + type + " .image").index($(this).parent());
                $("#add_" + type + "_" + index).remove();
            }

            $(this).parent().remove();
            getImageCount(type);
        });

        $("#btn_save").on("click",function(){
            $("#div_shadow").show();

            // 음식점 키워드 저장
            var type	= "";
            var keyword	= "";
            $('[id^=div_keyword]').each(function() {
                type	= $(this).attr("id").replace("div_keyword_", "");
                keyword	= "";
                $(this).find(".keyword_check").each(function() {
                    keyword+= "," + $(this).html();
                });
                $('#hid_keyword_check_' + type).val(keyword.substr(1));

                keyword	= "";
                $(this).find(".keyword_etc").each(function() {
                    keyword+= "," + $(this).html();
                });
                $('#hid_keyword_etc_' + type).val(keyword.substr(1));
            });

            // 전체평점
            if( !$('#hid_score').val() ) {
                alert("전체평점을 선택해 주세요.");
                $("#div_shadow").hide();
                $("html,body").stop().animate({
                    scrollTop : 0
                },	400);
                return false;
            }

            // 맛
            if( !$('#hid_taste').val() || !$('#hid_price').val() || !$('#hid_service').val() ) {
                alert("항목별 펑점을 선택해 주세요.");
                $("#div_shadow").hide();
                $("html,body").stop().animate({
                    scrollTop : 0
                },	400);
                return false;
            }

            var chkKeyword	= 0;
            $('[id^=div_keyword]').each(function() {
                chkKeyword	= 0;
                $(this).find("[class=keyword_check]").each(function() {
                    chkKeyword++;
                });
                $(this).find("[class=keyword_etc]").each(function() {
                    chkKeyword++;
                });
                if( chkKeyword == 0 ) {
                    alert("음식점 키워드를 선택해 주세요.");
                    $("#div_shadow").hide();
                    $('html,body').animate({
                        scrollTop : 500
                    },	400);
                    return false;
                }
            });
            if( chkKeyword == 0 ) {
                return false;
            }

            // 클린평가 서약
            if( !$('#ckb_oath').is(":checked") ) {
                alert("클린평가 서약을 반드시 체크하셔야 평가제출이 가능합니다.");
                $("#div_shadow").hide();
                return false;
            }

            // 로그
           /*  if( !$('[name=rv_id]').val() ) {
                setLogAct("review", $('#hid_current').val(), $('[name=v_rid]').val(), "save");
            } */

            //이미지 등록처리
            if($("#frm-photo input").length) {
                imageFinalUpload('photo');
                //업로드
            }

            var timer = setInterval(function(){
                $("#div_shadow").show();
                if(now_cnt == photo_cnt) {
                    clearInterval(timer);
                    now_cnt = 0;

                    if($("#frm-menu input").length) {
                        imageFinalUpload('menu');
                    }

                    var timer2 = setInterval(function(){
                        $("#div_shadow").show();
                        if(now_cnt == menu_cnt) {
                            clearInterval(timer2);
                            //$("#frm_action").submit();
                            var formData = new FormData();
                            $("#frm_action").find("input").each(function (index, input) {
                            	if ($(this).prop("name") == "photos") {
									return;
                            	}
                            	console.log(index + " " +$(this).val());
                            	 formData.append($(this).prop("name"), $(this).val());
                            	
                            });
                            formData.append("content", $("#txt_contents").val());
                            formData.append("storeId", $("#storeId").val() );
                            formData.append("storeName", $("#storeName").val() );
                            $.each(filesTempArr, function(i, v) {
                            	formData.append("photo", v);
                            });
                            console.log(formData);
                            /*
                            for(var i=0; i<$('#photo_upload')[0].files.length; i++){
                                formData.append('uploadFile', $('#photo_upload')[0].files[i]);
                            }
                            */
                         
                            $.ajax({
                            	url: 'reviewRegister',
                                data: formData,
                                processData: false,
                                contentType: false,
                                type: 'POST',
                                success: function (data) {
                                  	window.location.href="detail.jsp?name=<%=storeName%>";
                                }
                            });
                        }
                    },500);
                }
            },500);
        });

        function setLogAct(mode, current, val, type) {
            var key		= ( mode == "like" || mode == "review" ) ? "v_rid" : "url";
            var jData	= '{"mode" : "' + mode + '", "' + key + '" : "' + val + '", "current" : "' + current + '", "type" : "' + type + '"}';
            getAjax("/ajax/log.php", "text", jData, retAjax);
        }

        function imageFinalUpload(type)
        {
            var before_cnt = $("#div_" + type + " .image").length - $("#frm-" + type + " input").length;

            if(type == 'photo') {
                photo_cnt = $("#frm-" + type + " input").length;
            }
            else if(type == 'menu'){
                menu_cnt = $("#frm-" + type + " input").length;
            }
            now_cnt = 0;

            $.each($("#frm-" + type + " input"),function(key, data){
                $("#frm-image-upload").empty();
                $("#frm-image-upload").append("<input type='hidden' name='type' value='" + type + "' />");
                $("#frm-image-upload").append("<input type='hidden' name='cnt' value='" + (before_cnt + key + 1) + "' />");
                $("#frm-image-upload").append(data);


                var options = {
                    target : $("#frm-image-upload"),
                    beforeSubmit: function() {
                    },
                    success : function(rtn, statusText, xhr, $form) {
                        now_cnt ++;
                        $("#add-" + type + "-list").append("<input type='hidden' name='add_" + type + "[]' value='" + rtn.data + "' />");
                    },
                    url : '/ajax/aws.php',
                    type : 'post',
                    async : true,
                    dataType : 'json',
                };

                $("#frm-image-upload").ajaxSubmit(options);
            });
        }

        function setKeyword(obj) {
            var keyword	= "#" + obj.attr("id").replace("txt", "div");
            if( $(keyword).find("[value=" + obj.val() + "]").attr("value") ) {
                $(keyword).find("[value=" + obj.val() + "]").click();
            }
            else {
                // 해당없음 해제
                $(keyword).find("[value=해당없음]").removeClass("keyword_normal");
                $(keyword).find("[value=해당없음]").removeClass("keyword_check");
                $(keyword).find("[value=해당없음]").addClass("keyword_normal");

                // 사용자 키워드 등록
                $(keyword).find("div:last").remove();	// clear
                $(keyword).before().append("<div class='keyword_etc' value='" + obj.val() + "' onClick='$(this).remove();'>" + obj.val() + "</div>");
                $(keyword).before().append("<div class='clear'></div>");
            }
            $(obj).val("");
            $(obj).focus();
        }

        function setPoint(mode, type) {
            if( Number($('#hid_month_point').val()) < Number("5000") && $('#hid_complete').val() != "Y" ) {
                if( mode == "p" ) {
                    if( point[type] == 0  ) {
                        point[type]	= parseInt($('#hid_' + type + '_point').val());
                        $('#div_' + type + '_point').show();
                        if( $('#dd_' + type + '_point').attr("class") != "active" ) {
                            $('#dd_' + type + '_point').addClass("active");
                        }
                    }
                }
                else if( mode == "m" ) {
                    $('#div_' + type + '_point').hide();
                    if( point[type] > 0 ) {
                        point[type]	= 0;
                        $('#dd_' + type + '_point').removeClass("active");
                    }
                }
                $('#lbl_total_point').html(point['contents'] + point['photo'] + point['menu']);
                $('[name=contents_point]').val(point['contents']);
                $('[name=photo_point]').val(point['photo']);
                $('[name=menu_point]').val(point['menu']);
            }
        }

        function getImageCount(type) {
            var cnt	= $('#div_' + type + ' .image').length;
            var max = $("#div_" + type).attr('data-max');
            if( type == "photo" ) {
                var mode	= ( cnt > 1 ) ? "p" : "m";
                setPoint(mode, "photo");
            }
            else if( type == "menu" ) {
                var mode	= ( cnt > 0 ) ? "p" : "m";
                setPoint(mode, "menu");
            }
            $("#view-" + type + "-cnt").html(cnt);
            if(max > cnt) {
                $("#btn_" + type).show();
            }
            else {
                $("#btn_" + type).hide();
            }
        }
    });
</script>    <!-- s: footer-wrap //-->

</div>
</body>
</html>