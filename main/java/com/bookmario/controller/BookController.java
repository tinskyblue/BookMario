package com.bookmario.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookmario.domain.BookVO;
import com.bookmario.domain.Criteria;
import com.bookmario.domain.PageDTO;
import com.bookmario.helper.FileHelper;
import com.bookmario.service.BookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/books")
@AllArgsConstructor
public class BookController {

	private BookService bookService;
	
	@GetMapping("")
	public String index(Criteria cri, Model model) {
		log.info("main");
		log.info("list: " + cri);
		List<BookVO> books = bookService.getListWithPaging(cri);
		// 모델을 통해 뷰페이지로 데이터를 전달
		model.addAttribute("books", books);
		return "books/index";
	}

	// 도서 등록하기
	@GetMapping("/register")
	public String register() {
		log.info("get register");
		return "books/item/register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute BookVO bookVO, @RequestParam MultipartFile file, HttpServletRequest request, RedirectAttributes rttr) {
		log.info("post register: " + bookVO);
		String fileUrl = FileHelper.upload("/img", file, request);
		bookVO.setImage(fileUrl);
		bookService.register(bookVO);
		rttr.addFlashAttribute("result", bookVO.getBookID());
		return "redirect:/books/products";
	}

	// 도서 수정하기
	@GetMapping("/edit/{bookID}")
	// PathVariable URL의 값을 정의한 이름과 같은 이름의 인자랑 매핑시키고자 할 때 사용한다.
	public String edit(@PathVariable Long bookID, Model model) {
		log.info("get edit");
		// id 값을 통해 데이터를 가져옴
		BookVO bookVO = bookService.get(bookID);
		/*System.out.println(bookVO.getBookID());*/
		System.out.println(bookVO.toString());
		// 뷰 페이지로 데이터를 전달(key/value 형식)
		model.addAttribute("book", bookVO);
		return "books/item/edit";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute BookVO bookVO, @RequestParam MultipartFile file, HttpServletRequest request) {
		String fileUrl = FileHelper.upload("/img", file, request);
		bookVO.setImage(fileUrl);
		bookService.modify(bookVO);
		System.out.println(bookVO.toString());
		return "redirect:/books/products";
	}

	// 도서 삭제하기
	@GetMapping("/delete/{bookID}")
	public String delete(@PathVariable Long bookID, HttpServletRequest request) {
		bookService.remove(bookID);
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/books/products";
		  }
	}

	// 도서 리스트
	@GetMapping("/products")
	public String products(Model model, Criteria cri) throws Exception {
		log.info("Products");
		log.info("list: " + cri);
		List<BookVO> list = bookService.getListWithPaging(cri);
		int total = bookService.getTotal(cri);
		log.info("total: "+ total);
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("list", list); // -> 한페이지에 들어갈 게시글의 갯수를 지정
		model.addAttribute("pageMaker", pageDTO); // -> 하단에 보이는 페이지 갯수를 지정
		return "books/shop/products";
	}

	// 도서 상세정보
	@GetMapping("/item")
	public String item() {
		log.info("item");
		return "books/item/item";
	}

	@GetMapping("/item/{bookID}")
	public String item(@PathVariable Long bookID, Model model) {
		BookVO bookVO = bookService.get(bookID);
		model.addAttribute("book", bookVO);
		return "books/item/item";
	}
	
}
