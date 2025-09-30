package com.bookmario.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookmario.domain.CartVO;
import com.bookmario.domain.ItemVO;
import com.bookmario.service.BookService;
import com.bookmario.service.CartService;
import com.bookmario.service.MemberService;
import com.bookmario.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/orders")
@AllArgsConstructor
public class OrdersController {
	
	BookService bookService;
	MemberService memberService;
	CartService cartService;
	OrderService orderService;

	// 주문 처리
	@PostMapping("")
	public String create(@RequestParam("cartID") Long cartID, RedirectAttributes redirectAttributes) {
	    log.info("주문할 cartID >>>>>>>>" + cartID);

	    // 장바구니에 상품이 있는지 확인
	    int itemCount = cartService.countItemsInCart(cartID);
	    if (itemCount == 0) {
	        log.warn("장바구니에 상품이 없습니다. cartID: " + cartID);
	        redirectAttributes.addFlashAttribute("errorMessage", "장바구니에 상품이 없습니다.");
	        return "redirect:/carts";  // 장바구니 페이지로 이동
	    }

	    try {
	        // 장바구니에서 주문
	        cartService.order(cartID);
	        redirectAttributes.addFlashAttribute("successMessage", "주문이 완료되었습니다.");
	    } catch (Exception e) {
	        log.error("주문 처리 중 오류 발생", e);
	        redirectAttributes.addFlashAttribute("errorMessage", "주문 처리에 실패했습니다.");
	        return "redirect:/carts";  // 장바구니 페이지로 이동
	    }

	    return "redirect:/orders";  // 주문 페이지로 이동
	}


	// 주문 내역 보기
	@GetMapping("")
	public String index(Principal principal, Model model) {
		// 현재 사용자
		String currUserId = memberService.read(principal.getName()).getUserID();
		// 주문 목록
		List<CartVO> orders = memberService.getOrders(currUserId);
		// 주문별 아이템
		for (CartVO order : orders) {
			order.setItems(cartService.getItems(order)); // 아이템 조회
			int sum = 0;
			int count = 0;
			// 주문 아이템에 대한 가격 계산
			for (ItemVO item : order.getItems()) {
				item.setBookVO(bookService.get(item.getBookID()));
				sum += item.getPrice() * item.getAmount();
				count += item.getAmount();
			}
			order.setTotalPrice(sum);
			order.setCount(count);
		}
		model.addAttribute("orders", orders);
		return "orders/orders";  // 주문 내역 페이지로 이동
	}
	
	// 주문 삭제
	@GetMapping("/delete/{cartID}")
	public String delete(@PathVariable Long cartID, RedirectAttributes redirectAttributes) {
	    try {
	        orderService.delete(cartID); // 주문 삭제
	        // 성공 메시지 추가
	        redirectAttributes.addFlashAttribute("cancelMessage", "주문이 성공적으로 취소되었습니다.");
	    } catch (Exception e) {
	        log.error("주문 취소 중 오류 발생: cartID=" + cartID, e);
	        // 실패 메시지 추가
	        redirectAttributes.addFlashAttribute("errorMessage", "주문 취소에 실패했습니다.");
	    }
	    return "redirect:/orders";  // 주문 페이지로 이동
	}

}
