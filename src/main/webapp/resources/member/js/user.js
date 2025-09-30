/**
 * 
 */

// 부트스트랩 유효성 검사
window.addEventListener('load', () => {
	const forms = document.getElementsByClassName('validation-form');

		Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function (event) {
			if (form.checkValidity() === false) {
				event.preventDefault();
				event.stopPropagation();
			}

			form.classList.add('was-validated');
		}, false);
	});
}, false);


// 비밀번호 보이게해주는 타입변경 이벤트
$(document).ready(function(){
    $('#pass i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"bi bi-eye-fill fs-5")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"bi bi-eye-fill fs-5")
            .prev('input').attr('type','password');
        }
    });
});

// 비밀번호 재확인


// 부트스트랩x 유효성 검사 메서드
/*function Validation() {
    // 변수에 저장
    var id = document.getElementById("userID")
    var pw = document.getElementById("userPass")
    var ename = document.getElementById("username")

    //아이디 확인
    if(id.value.length <4){
    	alert("아이디를 4글자 이상 입력하세요.")
        id.focus();
        return false;
    }
    //아이디 영어 대소문자 확인
    else if(!checkEngNumber(id.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        id.focus();
        return false;
    }

    //비밀번호 확인
    if(pw.value.length <4){
        alert("비밀번호를 4글자 이상 입력하세요.")
        pw.focus();
        return false;
    }
    //비밀번호 영어 대소문자 확인
    else if(!checkEngNumber(pw.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        pw.focus();
        return false;
    }

    //이름 확인 = 한글과 영어만 가능하도록
    if(ename.value == ""){
        alert("이름을 입력하세요.")
        ename.focus();
        return false;
    }
    
    else if(!checkKorEng(ename.value)){
        alert("한글, 영어만 입력하세요.")
        ename.focus();
        return false;
    }

}

// 문자열이 영어, 숫자인지 확인하는 메서드 
function checkEngNumber(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=48 && value.charCodeAt(i)<=57)){
            count += 1;
        }
    }

    //카운트 수와 문자의 길이가 같다면 true
    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}

//영어, 한글인지(가~힣) 확인
function checkKorEng(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        console.log(value.charCodeAt(i));
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=44032 && value.charCodeAt(i)<=55203)){
            count += 1;
        }
    }

    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}*/