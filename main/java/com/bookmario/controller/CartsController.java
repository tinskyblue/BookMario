package com.bookmario.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookmario.domain.CartVO;
import com.bookmario.domain.ItemVO;
import com.bookmario.domain.MemberVO;
import com.bookmario.service.BookService;
import com.bookmario.service.CartService;
import com.bookmario.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/carts")
@AllArgsConstructor
public class CartsController {

	MemberService memberService;
	
	CartService cartService;
	
	BookService bookService;
	
	@GetMapping("")
	public String carts(Principal principal, Model model) {
		// 현재 사용자
        String currUserId = memberService.read(principal.getName()).getUserID();
        log.info("currUserId >>>>> "+ currUserId);
        // 카트에
        CartVO cart = memberService.getCart(currUserId);
        if (cart != null) {
            // 담긴 아이템
            List<ItemVO> items = cartService.getItems(cart);
            for (ItemVO i : items) {
                i.setBookVO(bookService.get(i.getBookID())); // 아이템이 가리키는 책
            }
            // 합계
            int sum = 0;
            int count = 0;
            for (ItemVO i : items) {
                sum += i.getPrice() * i.getAmount();
                count = count + i.getAmount();
            }
            cart.setTotalPrice(sum);
            cart.setCount(count);
            model.addAttribute("cart", cart);
            model.addAttribute("items", items);
        }
		return "/carts/carts";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute ItemVO itemVO, Principal principal) {
		log.info("itemVO >>>>> "+ itemVO);
		// 현재 사용자
        MemberVO currentUser = memberService.read(principal.getName());
        log.info("currentUser >>>>> "+ currentUser);
        // 사용자가 가지고있는 장바구니 번호에 아이템을 저장
        if (!memberService.hasCart(CartVO.SHOPPING, currentUser.getUserID())) {
        	CartVO cartVO =  new CartVO(CartVO.SHOPPING, currentUser.getUserID());
            int result = cartService.create(cartVO);
            log.info("카트 생성 결과 >>>>> "+ result);
            Long cartID = cartVO.getCartID();
            log.info("처음 만드는 카트 cartID >>>>> "+ cartID);
            itemVO.setCartID(cartID);
        } else {
        	Long cartID = memberService.getCart(currentUser.getUserID()).getCartID();
        	log.info("이미 있는 카트 cartID >>>>> "+ cartID);
            itemVO.setCartID(cartID);
        }
        // 쇼핑카트에 아이템을 담음
        log.info(itemVO);
        cartService.add(itemVO);
        return "redirect:/carts";
    }
	
	@GetMapping("/delete/{itemID}")
	public String delete(@PathVariable Long itemID) {
		log.info(itemID);
		cartService.delete(itemID);
		return "redirect:/carts";
	}
	
}
