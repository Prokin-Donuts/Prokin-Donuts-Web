package com.donut.prokindonutsweb.service.member;

import com.donut.prokindonutsweb.dto.member.MemberAccountDTO;
import com.donut.prokindonutsweb.dto.member.MemberAccountVO;
import com.donut.prokindonutsweb.mappers.member.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final ModelMapper modelMapper;
    private final MemberMapper memberMapper;

    /*
    * memberaccount table의 member를 조회하는 메서드
    * List<vo>->List<dto>->optional<List<dto>>
    * */
    @Override
    public Optional<List<MemberAccountDTO>> loadMember() {
        List<MemberAccountVO> memberVOList = memberMapper.loadMember();
        List<MemberAccountDTO> memberDTOList = memberVOList.stream()
                .map(member -> modelMapper.map(member, MemberAccountDTO.class)).toList();
        return Optional.ofNullable(memberDTOList.isEmpty() ? null : memberDTOList);
    }
}
