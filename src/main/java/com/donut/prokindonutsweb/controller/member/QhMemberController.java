package com.donut.prokindonutsweb.controller.member;

import com.donut.prokindonutsweb.dto.member.MemberAccountDTO;
import com.donut.prokindonutsweb.dto.member.MemberListForm;
import com.donut.prokindonutsweb.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/qh/member")
public class QhMemberController {
    private final MemberService memberService;

    @GetMapping("/list")
    public void qhGetMemberList(Model model){
        List<MemberAccountDTO> qhMemberList = memberService.findMember().orElse(Collections.emptyList());
        model.addAttribute("qhMemberList",qhMemberList);
    }

    @PostMapping("/add")
    public String qhAddMemberList(MemberAccountDTO memberAccountDTO) {
        memberService.saveMember(memberAccountDTO);
        return "redirect:/qh/member/list";
    }

    @PostMapping("/update")
    public String qhUpdateMembers(@Valid @ModelAttribute MemberListForm memberlist,
                                  BindingResult bindingResult, RedirectAttributes redirectAttributes) {
            if (bindingResult.hasErrors()) {
                String errorMessage = bindingResult.getAllErrors().get(0).getDefaultMessage();
                redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
                redirectAttributes.addFlashAttribute("memberList", memberlist.getMemberList());
                return "redirect:list";
            }

            memberService.updateMember(memberlist.getMemberList());
        return "redirect:list";
    }

    @PostMapping("/delete")
    public String qhDeleteMembers(List<String> memberCode) {
        memberService.deleteMember(memberCode);
        return "redirect:/qh/member/list";
    }
}
