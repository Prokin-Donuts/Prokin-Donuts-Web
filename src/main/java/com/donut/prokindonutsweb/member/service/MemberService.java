package com.donut.prokindonutsweb.member.service;

import com.donut.prokindonutsweb.member.dto.MemberAccountDTO;

import java.util.List;
import java.util.Optional;

public interface MemberService {
    Optional<List<MemberAccountDTO>> findMember();
    void saveMember(MemberAccountDTO memberAccountDTO);
    void updateMember(List<MemberAccountDTO> memberList);
    void deleteMember(List<String> memberList);
    String memberCode(String authorityCode);
    int memberIdCheck(String id);

    int  memberEmailCheck(String email);
    void updateByMember(String userid, MemberAccountDTO dto);
    void deleteByMember(String id);

}
