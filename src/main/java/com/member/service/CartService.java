package com.member.service;

import com.member.domain.CartDTO;

public interface CartService {
    /* 장바구니 추가 */
    public int addCart(CartDTO cartDTO);
}
