package com.donut.prokindonutsweb.controller.member;

import com.donut.prokindonutsweb.dto.member.MemberAccountDTO;
import com.donut.prokindonutsweb.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/wm/member")
    public void wmMemberList(Model model){
        List<MemberAccountDTO> memberList = memberService.loadMember().orElse(Collections.emptyList());
        model.addAttribute("memberList",memberList);
    }
    @PostMapping("/wm/member")
    public void wmMemberListPost(Model model,List<MemberAccountDTO> memberList){

    }
}
