$(document).ready(function() {

	//검색
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
		var word = $.trim(searchForm.find("input[name='keyword']").val());
		
		if(!word || word==""){
			alert("키워드를 입력하세요");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.find("input[name='keyword]").val("word");		
		e.preventDefault();
		
		searchForm.submit();
	});

	// 페이징 처리
	var actionForm = $("#actionForm");
	
	$(".pagination a").on("click", function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	// 카테고리 선택
	$("#category a").not(".allBooks").on("click",function(e){
		e.preventDefault();
		
		var word = $.trim(searchForm.find("input[name='keyword']").val());
		
		actionForm.find("input[name='keyword']").val(word);
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='type']").val("C");
		actionForm.find("input[name='category']").val($(this).attr("href"));
		
		actionForm.submit();
	})
	
});