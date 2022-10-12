package com.member.service;

import com.member.domain.CartDTO;
import com.member.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class CartServiceImpl implements CartService {

    @Autowired
    CartMapper mapper;

    @Override
    public int addCart(CartDTO cartDTO) {
        String u_id = "user01";
        int g_no = 1;

        cartDTO.setU_id(u_id);
        cartDTO.setG_no(g_no);

        int result = 0;
        result = mapper.addCart(cartDTO);

        return 0;
    }
}
