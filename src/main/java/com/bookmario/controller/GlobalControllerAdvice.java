package com.bookmario.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.bookmario.domain.CartVO;
import com.bookmario.service.CartService;

@ControllerAdvice
public class GlobalControllerAdvice {

    private final CartService cartService;

    @Autowired
    public GlobalControllerAdvice(CartService cartService) {
        this.cartService = cartService;
    }

    // 모든 페이지에서 cart 아이템 개수를 cartCount로 추가
    @ModelAttribute("cartCount")
    public int getCartCount() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth == null || !auth.isAuthenticated() || auth.getName().equals("anonymousUser")) {
            return 0;
        }

        // 로그인 사용자 이름(username) 기준 CartID 조회
        Long cartID = cartService.getCartIdByUsername(auth.getName());
        if(cartID == null) {
            return 0;
        }

        return cartService.countItemsInCart(cartID);
    }
}
