package com.donut.prokindonutsweb.mappers.member;

import com.donut.prokindonutsweb.dto.member.MemberAccountVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RequiredArgsConstructor
class MemberMapperTest {

    @Autowired
    private MemberMapper mapper;


    //loadMember MapperTest
    @Test
    public void loadMember(){
        List<MemberAccountVO> memberList = mapper.loadMember();
        memberList.forEach(log::info);
    }

}