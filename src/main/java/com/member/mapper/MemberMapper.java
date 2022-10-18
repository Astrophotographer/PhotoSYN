package com.member.mapper;

import com.gallery.domain.GalleryDTO;
import com.member.domain.AuthDTO;
import com.member.domain.BuyDTO;
import com.member.domain.CartDTO;
import com.member.domain.MemberDTO;

import java.util.List;

public interface MemberMapper {
    // 회원가입
    public int addMember(MemberDTO memberDTO) throws Exception;

    // 회원 정보 가져오기 (접근 권한까지)
    public MemberDTO getMember(String id);

    // 회원 접근 권한 추가
    public int addAuth(AuthDTO auth) throws Exception;

    // 회원 정보 수정
    public void updateMember(MemberDTO memberDTO) throws Exception;

    // 회원 정보 삭제
    public int deleteMember(String id) throws Exception;

    // 회원 권한 삭제
    public int deleteAuth(String id) throws Exception;

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

    /* 갤러리 목록 */
    public List<GalleryDTO> galleryList(GalleryDTO galleryDTO, String id);

    /* 갤러리 상태값 변경 */
    public int updateGalleryStatus(GalleryDTO galleryDTO);

    /* 장바구니 담기 */
    public void insertCart(Long g_no);

    /* 장바구니 목록 */
    public List<CartDTO> listCart(CartDTO cartDTO);

    /* 장바구니 삭제 */
    public int deleteCart(Long g_no);

    /* 장바구니 확인 */
    public CartDTO checkCart(CartDTO cartDTO);

    /* 마이페이지 구매 판매내역 */
    public List<BuyDTO> listBuy(BuyDTO buyDTO);

    /* 총 합계금액 */
    public int sum(BuyDTO buyDTO);

    /* 갤러리 구매 (포인트 차감) */
    public int buyGallery(BuyDTO buyDTO);

}
