package com.member.mapper;

import com.member.domain.CartDTO;

import java.util.List;

public interface CartMapper {

    /* 카트 추가 */
    public int addCart(CartDTO cart);

    /* 카트 삭제 */
    public int deleteCart(int g_no);

    /* 카트 목록 */
    public List<CartDTO> getCart(String u_id);

    /* 카트 확인 */
    public CartDTO checkCart(CartDTO cart);
}
