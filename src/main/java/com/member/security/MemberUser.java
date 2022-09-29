package com.member.security;

import com.member.domain.MemberDTO;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;

@Getter
public class MemberUser extends User {
    // 회원정보 담을 인스턴스 변수 추가
    private MemberDTO member;

    public MemberUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public MemberUser(MemberDTO dto) {
        super(dto.getId(), dto.getPw(), dto.getAuthDTOList().stream()
                .map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
                .collect(Collectors.toList())
        );
        this.member = dto;
    }
}
