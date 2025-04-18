package com.donut.prokindonutsweb.controller.inbound;

import com.donut.prokindonutsweb.dto.inbound.ProductDTO;
import com.donut.prokindonutsweb.service.inbound.InboundService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/inbound")
public class InboundController {

    private final InboundService inboundService;

    @GetMapping("/request")
    public String productList(Model model) {
        List<ProductDTO> list = inboundService.productList();
        model.addAttribute("product", list);

        return "wm/inbound/request";
    }

    @PostMapping("/request")
    public String request() {


        return "redirect:/wm/inbound/request";
    }
}
