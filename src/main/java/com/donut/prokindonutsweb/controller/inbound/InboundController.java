package com.donut.prokindonutsweb.controller.inbound;

import com.donut.prokindonutsweb.dto.inbound.InboundDetailDTO;
import com.donut.prokindonutsweb.dto.inbound.InboundForm;
import com.donut.prokindonutsweb.dto.inbound.ProductDTO;
import com.donut.prokindonutsweb.service.inbound.InboundService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/wm/inbound")
public class InboundController {

    private final InboundService inboundService;

    /*@GetMapping("/request")
    public String productList(Model model) {
        List<ProductDTO> list = inboundService.productList();
        model.addAttribute("product", list);
        return "wm/inbound/request";
    }*/

    @GetMapping("/request")
    public void productList(Model model) {
        List<ProductDTO> list = inboundService.productList();
        model.addAttribute("product", list);
    }

    @PostMapping("/request")
    public String request(@RequestParam String inboundDate,
                          @ModelAttribute InboundForm inboundForm) {
        List<InboundDetailDTO> list = inboundForm.getProductList();
        log.info(inboundDate);
        System.out.println(inboundDate);
        System.out.println(list);

        return "redirect:/wm/inbound/request";
    }

    /*@PostMapping("/request")
    public String request(@RequestParam String inboundDate,  // 입고 날짜
                          @RequestParam List<InboundDetailDTO> productList) {
        log.info(inboundDate);
        log.info(productList.toString());
        productList.forEach(System.out::println);

        return "redirect:/wm/inbound/request";
    }*/
}
