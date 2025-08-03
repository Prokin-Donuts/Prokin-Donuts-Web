package com.donut.prokindonutsweb.outbound.controller;

import com.donut.prokindonutsweb.outbound.dto.OutboundDTO;
import com.donut.prokindonutsweb.outbound.service.OutboundService;
import com.donut.prokindonutsweb.security.dto.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/wm/outbound")
public class OutboundApprovalController {

    private final OutboundService outboundService;

    @GetMapping("/approval")
    public String getOutboundList(Model model, @AuthenticationPrincipal CustomUserDetails user) {
        log.info("check");

        String memberCode = user.getMemberCode();
        log.info(memberCode);
        String warehouseCode = outboundService.getWarehouseCode(memberCode);


        List<OutboundDTO> outboundList = outboundService.findApprovalOutboundList(warehouseCode);

        model.addAttribute("outboundList", outboundList);
        return "wm/outbound/approval";
    }

    @PostMapping("/approval")
    public String approveOutbound(@RequestParam("outboundCodeList") List<String> outboundCodeList, RedirectAttributes redirectAttributes) {
        for (String outboundCode : outboundCodeList) {
            log.info("출고코드: {}", outboundCode);

            // 재고 존재 확인
            boolean check = outboundService.checkInventory(outboundCode);
            log.info(String.valueOf(check));

            // 존재하면 출고 처리
            if (check) {
                // 상태 변경 ( -> 출고 준비)
                outboundService.approveOutbound(outboundCode);
                // 재고 반영
                outboundService.updateInventory(outboundCode);
                redirectAttributes.addFlashAttribute("errorMessage", "출고가 완료되었습니다.");
            } else {
                // 출고 X 에러 메시지 반환
                redirectAttributes.addFlashAttribute("errorMessage", "재고가 부족해 출고할 수 없습니다.");
            }
        }


        return "redirect:/wm/outbound/approval";
    }
}
