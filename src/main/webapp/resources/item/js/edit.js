// 부트스트랩 유효성 검사
window.addEventListener('load', () => {
	const forms = document.getElementsByClassName('form-horizontal');

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