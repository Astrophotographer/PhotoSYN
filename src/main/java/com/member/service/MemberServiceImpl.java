package com.member.service;

import java.util.List;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.MaintagDTO;
import com.gallery.mapper.GalleryMapper;
import com.member.domain.*;
import com.member.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private GalleryMapper galleryMapper;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public int addMember(MemberDTO memberDTO) throws Exception {
        memberDTO.setPw(bCryptPasswordEncoder.encode(memberDTO.getPw())); // 비밀번호 암호화

        return memberMapper.addMember(memberDTO);
    }
    
    // 회원 탈퇴
    @Override
    public int addAuth(String auth, String id) throws Exception {
        int result = -1;
        AuthDTO authDTO = new AuthDTO();
        authDTO.setId(id);

        // 일반회원 가입시 권한 추가
        if (auth.equals("member")) {
            authDTO.setAuth("ROLE_MEMBER");
            result = memberMapper.addAuth(authDTO);
            // 관리자로 가입시 권한 추가
        } else if (auth.equals("admin")) {
            authDTO.setAuth("ROLE_MEMBER");
            result = memberMapper.addAuth(authDTO);
            authDTO.setAuth("ROLE_ADMIN");
            result = memberMapper.addAuth(authDTO);
        }

        return result;
    }

    // 회원 정보 가져오기 (접근 권한까지)
    @Override
    public MemberDTO getMember(String id) {
        return memberMapper.getMember(id);
    }

    // 회원 정보 수정
    @Override
    public void updateMember(MemberDTO memberDTO) throws Exception {
        memberMapper.updateMember(memberDTO);
    }

    @Override
    public int deleteMember(MemberDTO memberDTO) throws Exception {
        int result = 0;
        MemberDTO dataMember = getMember(memberDTO.getId());

        if (bCryptPasswordEncoder.matches(memberDTO.getPw(), dataMember.getPw())) {
            result = 1;
            // FK 제약조건 때문에 Auth 먼저 삭제하고 member 삭제
            int deleteRes = memberMapper.deleteAuth(memberDTO.getId());
            deleteRes = memberMapper.deleteMember(memberDTO.getId());
        }
        return result;
    }

    // 닉네임 중복확인
    public int nameCheck(String name) throws Exception {
        return memberMapper.nameCheck(name);
    }

    // 아이디 확인
    @Override
    public int idCheck(String id) throws Exception {
        return memberMapper.idCheck(id);
    }

    // 비밀번호 변경
    @Override
    public int updatePw(MemberDTO memberDTO) throws Exception {
        return memberMapper.updatePw(memberDTO);
    }

    // 프로필 사진 변경
    @Override
    public int updateImg(MemberDTO memberDTO) throws Exception {
        return memberMapper.updateImg(memberDTO);
    }
    
    // 포인트 충전
    @Override
    public int updatePoint(MemberDTO memberDTO) {
        return memberMapper.updatePoint(memberDTO);
    }

    /* 갤러리 목록 */
    @Override
    public List<GalleryDTO> galleryList(String id) {
        return memberMapper.galleryList(id);
    }
    
    /* 갤러리 상태값 변경 (숨김처리) */
    @Override
    public int updateGalleryStatus1(String G_NO) {
        return memberMapper.updateGalleryStatus1(G_NO);
    }

    /* 갤러리 상태값 변경 (판매중) */
    @Override
    public int updateGalleryStatus2(String G_NO) {
        return memberMapper.updateGalleryStatus2(G_NO);
    }

    /* 장바구니 담기 */
    @Override
    public int insertCart(CartDTO cartDTO) {
        return memberMapper.insertCart(cartDTO);
    }

    /* 장바구니 목록 */
    @Override
    public List<CartDTO> listCart(CartDTO cartDTO) {
        return memberMapper.listCart(cartDTO);
    }

    /* 장바구니 삭제 */
    @Override
    public int deleteCart(String g_no) {
        return memberMapper.deleteCart(g_no);
    }

    @Override
    public CartDTO checkCart(CartDTO cartDTO) {
        return memberMapper.checkCart(cartDTO);
    }

    /* 마이페이지 구매 판매내역 */
    @Override
    public List<BuyDTO> listBuy(String id) {
        return memberMapper.listBuy(id);
    }

    /* 총 합계금액 */
    @Override
    public Integer sum(BuyDTO buyDTO) {
        return memberMapper.sum(buyDTO);
    }


    /* 갤러리 구매 (포인트 차감) */
    @Override
    public int buyGallery(BuyDTO buyDTO) {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setPoint((-buyDTO.getO_price()));
        memberDTO.setId(buyDTO.getO_buyer());

        // USER_LIST DB 데이터 업데이트
        memberMapper.updatePoint(memberDTO);

        return memberMapper.buyGallery(buyDTO);
    }

    /************************************************ 페이징 처리 ******************************************************/
    @Override
    public List<BuyDTO> getListWithPaging(MemberCriteria memberCriteria) {
        return memberMapper.getListWithPaging(memberCriteria);
    }
    @Override
    public int getGalleryCount(MemberCriteria memberCriteria) {
        return memberMapper.getGalleryCount(memberCriteria);
    }

    @Override
    public List<MaintagDTO> getMainTagDTO() {
        return memberMapper.getMainTagDTO();
    }


}
