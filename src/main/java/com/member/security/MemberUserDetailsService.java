package com.member.security;

import com.member.domain.MemberDTO;
import com.member.mapper.MemberMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
@Log4j
public class MemberUserDetailsService implements UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;
    /*
     * username을 주면 회원정보를 UserDatails로 리턴해주는 처리가 되어야한다.
     * 우리가 사용하는 회원정보(회원테이블)는 memberDTO이며, 이 메서드가 리턴해주는 타입은 UserDatails 인터페이스이다.
     * --> memberDTO를 UserDetails 타입으로 변환해주는 처리가 필요함.
     */

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("LoadUserByUsername username : " + username);
        MemberDTO memberDTO = memberMapper.getMember(username);
        log.info("loadUserByUsername : " + memberDTO.getId());
        return memberDTO == null? null : new MemberUser(memberDTO);
    }
}
