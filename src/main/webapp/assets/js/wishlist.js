var isLogined = false;

function wishlist() {
	if (isLogined == false) {
		alert("로그인 후 이용 가능합니다.");
	} else {
		var param = {
			"userName": $("#userId").val(),
			"storeId": $("#storeId").val()
		};
		
		$.ajax({
			type: "post",
			data: param,
			url: "wishlistCon",
			success: function(data) {
				if (data == "success") {
					alert("가고 싶은 곳에 저장되었습니다");
				} else if (data == "error") {
					alert("이미 저장된 곳 입니다.");
				} else if (data == "nostoreid") {
					alert("상점 아이디가 없습니다");
				}
			},
			error: function() {
				alert("실패");
			}
		});
	} 
}
function refresh(){
	location.reload();
}

function delWishlist(){
	
		var param2 = {
			"userName": $("#userId2").val(),
			"storeId": $("#storeId2").val()
		};
		
		$.ajax({
			type: "post",
			data: param2,
			url: "delWishCon",
			success: function(data) {
				if (data == "success") {
					alert("삭제되었습니다.");
					refresh();
				} else if (data == "error") {
					alert("data == errorr");
				} else if (data == "nostoreid") {
					alert("상점 아이디가 없습니다");
				}
			},
			error: function() {
				alert("에러");
			}
		});
 
}
function like(review_num){
	
		var param3 = {
			"reviewNum": review_num,
			"r_user_id": $("#r_user_id").val()
			
		};
		
		$.ajax({
			type: "post",
			data: param3,
			url: "reviewLikeCon",
			success: function(data) {
				if (data == "success") {
					
					refresh();
				} else if (data == "error") {
					alert("이미 공감하셨습니다.");
				} else if (data == "nostoreid") {
					alert("상점 아이디가 없습니다");
				}
			},
			error: function() {
				alert("에러");
			}
		});
 
}
function postlike(post_num){
	
		var param4 = {
			"postNum": post_num,
			"p_user_id": $("#p_user_id").val()
			
		};
		
		$.ajax({
			type: "post",
			data: param4,
			url: "postLikeCon",
			success: function(data) {
				if (data == "success") {
					
					refresh();
				} else if (data == "error") {
					alert("이미 좋아요를 눌렀습니다.");
				} else if (data == "nostoreid") {
					alert("상점 아이디가 없습니다");
				}
			},
			error: function() {
				alert("에러");
			}
		});
 
}
	



