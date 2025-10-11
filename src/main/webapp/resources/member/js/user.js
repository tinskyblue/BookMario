/**
 * 
 */

// 부트스트랩 유효성 검사
window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');

    Array.prototype.filter.call(forms, (form) => {
        const userPass = form.querySelector('#userPass');
        const userPass2 = form.querySelector('#userPass2');

        // 실시간 비밀번호 일치 검사
        const validatePasswordMatch = () => {
            if(userPass2.value === ''){
                userPass2.classList.remove('is-valid', 'is-invalid');
            } else if(userPass2.value === userPass.value){
                userPass2.classList.add('is-valid');
                userPass2.classList.remove('is-invalid');
            } else {
                userPass2.classList.add('is-invalid');
                userPass2.classList.remove('is-valid');
            }
        };

        userPass.addEventListener('input', validatePasswordMatch);
        userPass2.addEventListener('input', validatePasswordMatch);

        // 폼 제출 시 검사
        form.addEventListener('submit', function(event) {
            validatePasswordMatch(); // 제출 전에 최종 체크

            // 비밀번호 불일치 시 제출 막기
            if(userPass.value !== userPass2.value){
                event.preventDefault();
                event.stopPropagation();
                alert("비밀번호가 일치하지 않습니다.");
                return;
            }

            // HTML5 / Bootstrap 기본 유효성 검사
            if(form.checkValidity() === false){
                event.preventDefault();
                event.stopPropagation();
                alert("일치하지 않는 항목이 있습니다.");
            }

            form.classList.add('was-validated');
        }, false);
    });
});

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

// 카카오 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('address1').value = data.roadAddress;
            document.getElementById('address2').value = '';
        }
    }).open();
}

// 폼 제출 시 hidden input에 합쳐서 담기
document.querySelector('form').addEventListener('submit', function(e) {
    const address1 = document.getElementById('address1').value;
    const address2 = document.getElementById('address2').value;
    document.getElementById('fullAddress').value = address1 + " " + address2;
});

