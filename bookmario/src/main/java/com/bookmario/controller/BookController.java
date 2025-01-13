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
		String fileUrl = FileHelper.upload("/img/register", file, request);
		bookVO.setImage(fileUrl);
		bookService.register(bookVO);
		rttr.addFlashAttribute("result", bookVO.getBookID());
		return "redirect:/books/products";
	}

	// 도서 수정하기
	@GetMapping("/edit/{bookID}")
	public String edit(@PathVariable Long bookID, Model model) {
		log.info("get edit");
		BookVO book = bookService.get(bookID);
		model.addAttribute("bookVO", book);
		return "books/item/edit";
	}

	@PostMapping("/update/{bookID}")
	public String update(@PathVariable Long bookID, @ModelAttribute BookVO bookVO, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
	    log.info("post edit");
	    // 기존 도서 정보를 가져옴
	    BookVO existingBookVO = bookService.get(bookID);

	    // 새 파일이 첨부된 경우 파일 업로드 처리
	    if (file != null && !file.isEmpty()) {
	        String uploadPath = "/img"; // 파일 저장 경로 설정
	        String fileUrl = FileHelper.upload(uploadPath, file, request);
	        bookVO.setImage(fileUrl); // 새 파일 URL 설정
	    } else {
	        // 새 파일이 없으면 기존 파일 URL 유지
	        bookVO.setImage(existingBookVO.getImage());
	    }

	    // bookVO에 bookID 설정
	    bookVO.setBookID(bookID); // 기존 도서의 ID를 설정하여 수정되도록 함

	    // 수정된 도서 정보를 업데이트
	    bookService.modify(bookVO); // 수정된 정보로 도서 업데이트

	    return "redirect:/books/products";
	}

	// 도서 삭제하기
	@GetMapping("/delete/{bookID}")
	public String delete(@PathVariable Long bookID, HttpServletRequest request) {
		bookService.remove(bookID);
		return "redirect:/books/products";
		// 분리 필요
		/*if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		  } else {
		    return "redirect:/books/products";
		  }*/
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
