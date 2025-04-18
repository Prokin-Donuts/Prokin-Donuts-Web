package com.donut.prokindonutsweb.service.member;

import com.donut.prokindonutsweb.dto.member.MemberAccountDTO;

import java.util.List;
import java.util.Optional;

public interface MemberService {
    Optional<List<MemberAccountDTO>> loadMember();
}
