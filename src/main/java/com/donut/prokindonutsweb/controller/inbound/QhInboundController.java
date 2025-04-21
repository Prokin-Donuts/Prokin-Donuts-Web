package com.donut.prokindonutsweb.controller.inbound;

import com.donut.prokindonutsweb.dto.inbound.InboundStatusDTO;
import com.donut.prokindonutsweb.service.inbound.InboundService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/qh/inbound")
public class QhInboundController {

    private final InboundService inboundService;
    @GetMapping("/status")
    public void qhGetAllInboundStatus(Model model) {
        List<InboundStatusDTO> inboundStatusList = inboundService.findAllInboundStatusList().get();
        model.addAttribute("inboundStatusList", inboundStatusList);
    }
}
