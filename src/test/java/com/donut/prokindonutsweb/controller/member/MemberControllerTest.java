package com.donut.prokindonutsweb.controller.member;

import com.donut.prokindonutsweb.dto.member.MemberAccountDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;
@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
class MemberControllerTest {
    @Autowired
    private MemberController memberController;

    /*
    * memberController의 wmMemberList 테스트
    * Model객체에 담긴 List 확인
    * */
    @Test
    public void wmMemberListTest(){
        Model model = new ExtendedModelMap(); //model은 interface이므로 객체생성 불가, 구현체 주입
        memberController.wmMemberList(model);
        List<MemberAccountDTO> memberList = (List<MemberAccountDTO>)model.getAttribute("memberList");
        assertNotNull(memberList);
        memberList.forEach(log::info);
    }
}