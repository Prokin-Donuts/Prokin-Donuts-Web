package com.donut.prokindonutsweb.config;

import com.donut.prokindonutsweb.dto.member.MemberAccountDTO;
import com.donut.prokindonutsweb.dto.member.MemberAccountVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;

@Log4j2
class ModelMapperConfigTest {

    private final ModelMapper modelMapper = new ModelMapper();

    @Test
    public void modelMapperTest(){
        MemberAccountDTO memberAccountDTO = MemberAccountDTO.builder()
                .memberCode("QH200")
                .authorityCode("1")
                .name("test")
                .phoneNumber("010")
                .email("t@mail.com")
                .address("test")
                .id("test")
                .password("test").build();

        MemberAccountVO  memberAccountVO = modelMapper.map(memberAccountDTO, MemberAccountVO.class);
        log.info("변환된 VO 객체: {}", memberAccountVO);
    }

}