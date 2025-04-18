package com.donut.prokindonutsweb.service.member;

import com.donut.prokindonutsweb.dto.member.MemberAccountDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;
import java.util.Optional;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
class MemberServiceImplTest {
    @Autowired
    private MemberService memberService;

    @Test
    public void loadMember(){
        Optional<List<MemberAccountDTO>> OmemberList = memberService.loadMember();
        List<MemberAccountDTO> memberList = OmemberList.get();
        memberList.forEach(log::info);
    }
}