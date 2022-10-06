package com.member.controller;

import com.member.domain.CartDTO;
import com.member.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/member/mypage/cart/*")
public class CartController {

    @Autowired
    private CartService cartService;

    /* 장바구니 추가 */
    /**
     * 0: 등록 실패
     *
     * 1: 등록 성공
     * 2: 등록된 데이터 존재
     * 5: 로그인 필요
     *
     */
    //456
    @PostMapping("/cart/add")
    @ResponseBody
    public String addCartPOST(CartDTO cart) {


        // 카트 등록

        int result = cartService.addCart(cart);

        return result + "";
    }

    /* 장바구니 페이지 이동 */
    @GetMapping("/cart/{memberId}")
    public String cartPageGET(@PathVariable("memberId") String memberId, Model model) {

        model.addAttribute("cartInfo", cartService.getCartList(memberId));

        return "/cart";
    }


    /* 장바구니 삭제 */
    @PostMapping("/cart/delete")
    public String deleteCartPOST(CartDTO cart) {

        cartService.deleteCart(cart.getCartId());

        return "redirect:/cart/" + cart.getMemberId();

    }
}

