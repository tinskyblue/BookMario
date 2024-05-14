package com.bookmario.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@PostMapping("")
	public String create(@RequestParam("cartID") int cart) {
		log.info("cartID >>>>>>>>" + cart);
		cartService.order(cart);
		return "redirect:/orders";
    }
		
	@GetMapping("")
	public String index(Principal principal, Model model) {
		// 현재 사용자
		String currUserId = memberService.read(principal.getName()).getUserID();
		// 주문 목록
		List<CartVO> orders = memberService.getOrders(currUserId);
		// 주문별 아이템
		for (CartVO order : orders) {
			order.setItems(cartService.getItems(order));
			// 아이템-책
			int sum = 0;
			int count = 0;
			for (ItemVO i : order.getItems()) {
				i.setBookVO(bookService.get(i.getBookID()));
				sum += i.getPrice() * i.getAmount();
				count = count + i.getAmount();
			}
			order.setTotalPrice(sum);
			order.setCount(count);
		}
		model.addAttribute("orders", orders);
		return "orders/orders";
	}
	
	@GetMapping("/delete/{cartID}")
	public String delete(@PathVariable Long cartID) {
		orderService.delete(cartID);
		return "redirect:/orders";
	}
}
