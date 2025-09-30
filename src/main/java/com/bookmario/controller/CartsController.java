package com.bookmario.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String add(@ModelAttribute ItemVO itemVO, Principal principal, RedirectAttributes redirectAttributes) {
	    log.info("itemVO >>>>> " + itemVO);

	    // 현재 사용자 정보 가져오기
	    MemberVO currentUser = memberService.read(principal.getName());
	    log.info("currentUser >>>>> " + currentUser);

	    // 장바구니 ID 가져오기
	    Long cartID;
	    if (!memberService.hasCart(CartVO.SHOPPING, currentUser.getUserID())) {
	        // 장바구니가 없으면 생성
	        CartVO cartVO = new CartVO(CartVO.SHOPPING, currentUser.getUserID());
	        cartService.create(cartVO);
	        log.info("새로운 장바구니 생성: " + cartVO);
	        cartID = cartVO.getCartID();
	    } else {
	        // 기존 장바구니 ID 가져오기
	        cartID = memberService.getCart(currentUser.getUserID()).getCartID();
	        log.info("기존 장바구니 사용: cartID >>>>> " + cartID);
	    }

	    // 중복 체크
	    itemVO.setCartID(cartID); // 장바구니 ID 설정
	    boolean isDuplicate = cartService.isItemInCart(cartID, itemVO.getBookID());
	    if (isDuplicate) {
	        // 이미 있는 아이템일 경우
	        log.info("이미 장바구니에 존재하는 아이템: " + itemVO);
	        redirectAttributes.addFlashAttribute("errorMessage", "This book is already in your cart.");
	        return "redirect:/carts"; // 장바구니 페이지로 리다이렉트
	    }

	    // 새로운 아이템 추가
	    cartService.add(itemVO);
	    log.info("장바구니에 아이템 추가 완료: " + itemVO);

	    return "redirect:/carts"; // 장바구니 페이지로 리다이렉트
	}
	
	// 장바구니 수정 처리
    @PostMapping("/update/{itemID}")
    public String updateItem(@PathVariable Long itemID, @RequestParam int amount, Principal principal, RedirectAttributes redirectAttributes) {
        log.info("수정된 아이템 ID: " + itemID + ", 새로운 수량: " + amount);

        // 현재 사용자 정보 가져오기
        MemberVO currentUser = memberService.read(principal.getName());
        CartVO cart = memberService.getCart(currentUser.getUserID());

        // 아이템 찾기
        ItemVO item = cartService.getItemByID(itemID);
        if (item != null && item.getCartID().equals(cart.getCartID())) {
            item.setAmount(amount); // 수량 변경
            cartService.updateItemAmount(item); // 수량 업데이트
            log.info("아이템 수량이 변경되었습니다: " + item);
            // 성공 메시지 추가
            redirectAttributes.addFlashAttribute("successMessage", "아이템 수량이 변경되었습니다.");
        } else {
            log.warn("아이템을 찾을 수 없거나 권한이 없는 요청: " + itemID);
            // 오류 메시지 추가
            redirectAttributes.addFlashAttribute("errorMessage", "아이템 수량 수정에 실패했습니다.");
        }

        return "redirect:/carts"; // 장바구니 페이지로 리다이렉트
    }
	
	@Delete("/{itemID}")
	public String delete(@PathVariable Long itemID) {
		log.info(itemID);
		cartService.delete(itemID);
		return "redirect:/carts";
	}
	
}
