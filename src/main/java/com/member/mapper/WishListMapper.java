package com.member.mapper;

import com.member.domain.WishListDTO;

import java.util.List;

public class WishListMapper {

    /* 카트 추가 */
    public int addCart(WishListDTO wishList);

    /* 카트 삭제 */
    public int deleteCart(int cartId);

    /* 카트 목록 */
    public List<WishListDTO> getCart(String memberId);

    /* 카트 확인 */
    public WishListDTO checkCart(WishListDTO cart);
}
