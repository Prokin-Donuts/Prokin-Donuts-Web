package com.donut.prokindonutsweb.controller.inbound;

import com.donut.prokindonutsweb.dto.inbound.InboundDTO;
import com.donut.prokindonutsweb.dto.inbound.InboundDetailDTO;
import com.donut.prokindonutsweb.dto.inbound.InboundStatusDTO;
import com.donut.prokindonutsweb.dto.inbound.ProductDTO;
import com.donut.prokindonutsweb.service.inbound.InboundService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/qh/inbound")
public class QhInboundController {

    private final InboundService inboundService;
    // 본사관리자 입고현황
    @GetMapping("/status")
    public void qhGetAllInboundStatus(Model model) {
        List<InboundStatusDTO> inboundStatusList = inboundService.findAllInboundStatusList().get();
        model.addAttribute("inboundStatusList", inboundStatusList);
    }

    @GetMapping("/request")
    public void wmGetAllInboundList(Model model) {
        List<InboundDTO> inboundList = inboundService.findAllQhInboundList().get();
        List<InboundDetailDTO> inboundDetailList = inboundService.findAllInboundDetailList().get();
        model.addAttribute("inboundList", inboundList);
        model.addAttribute("inboundDetailList", inboundDetailList);
    }


}
