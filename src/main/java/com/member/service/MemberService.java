package com.member.service;

import com.member.domain.BuyDTO;
import com.member.domain.CartDTO;
import com.member.domain.MemberDTO;


import java.util.List;

public interface MemberService {
    // 회원가입
    public int addMember(MemberDTO memberDTO) throws Exception;

    // 회원 접근 권한 추가
    public int addAuth(String auth, String id) throws Exception;

    // 회원 정보 가져오기 (접근 권한까지)
    public MemberDTO getMember(String id);

    // 회원 정보 수정
    public void updateMember(MemberDTO memberDTO) throws Exception;

    // 회원 탈퇴
    public int deleteMember(MemberDTO memberDTO) throws Exception;

    // 닉네임 중복확인
    public int nameCheck(String name) throws Exception;

    // 아이디 확인
    public int idCheck(String id) throws Exception;

    // 비밀번호 변경
    public int updatePw(MemberDTO memberDTO) throws Exception;

    // 프로필 사진 변경
    public int updateImg(MemberDTO memberDTO) throws Exception;

    // 포인트 충전
    public int updatePoint(MemberDTO memberDTO);

    /* 장바구니 담기 */
    public void insertCart(Long G_NO);

    /* 장바구니 목록 */
    public List<CartDTO> listCart(CartDTO cartDTO);

    /* 장바구니 삭제 */
    public int deleteCart(Long g_no);

    /* 구매 판매내역*/
    public List<BuyDTO> listBuySell(BuyDTO buyDTO);

    /* 갤러리 구매 (포인트 차감) */
    public int buyGallery(BuyDTO buyDTO);

}
