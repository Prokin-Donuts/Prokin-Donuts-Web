package com.donut.prokindonutsweb.controller.inbound;

import com.donut.prokindonutsweb.dto.inbound.*;
import com.donut.prokindonutsweb.service.inbound.InboundService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/wm/inbound")
public class InboundController {

    private final InboundService inboundService;
    @GetMapping("/request")
    public void productList(Model model) {
        List<ProductDTO> list = inboundService.findAllProductList().orElseThrow();
        model.addAttribute("product", list);
        System.out.println(list.toString());
        log.info(list.toString());
    }

    @PostMapping("/request")
    public String request(@RequestParam String inboundDate,
                          @ModelAttribute InboundForm inboundForm) {
        List<InboundDetailDTO> list = inboundForm.getProductList();

        // 입고요청 저장
        String inboundCode = inboundService.findNextInboundCode();
        InboundDTO dto = InboundDTO.builder()
                .inboundCode(inboundCode)
                .inboundDate(LocalDate.parse((inboundDate)))
                .inboundStatus("입고요청")
                .warehouseCode("GG1")
                .build();
        inboundService.saveInbound(dto);
        // 입고상세 저장 (service 단에서 VO 만들어서 반환)
        inboundService.saveInboundDetail(list);


        /*System.out.println(inboundDate);
        System.out.println(list.toString());*/

        return "redirect:/wm/inbound/request";
    }

//    창고관리자 - 입고관리 페이지
    @GetMapping("/approval")
    public void wmGetAllInboundList(Model model) {
        List<InboundDTO> inboundList = inboundService.findAllInboundList().get();
        List<InboundDetailDTO> inboundDetailList = inboundService.findAllInboundDetailList().get();
        model.addAttribute("inboundList", inboundList);
        model.addAttribute("inboundDetailList", inboundDetailList);
    }


    @PostMapping("/approve")
    public String wmApproveInbound(@RequestParam String inboundCode) {
        log.info(inboundCode);
        // 입고 상태 ( -> 입고완료!)
        inboundService.approveInbound(inboundCode);

        // 입고상세 목록 재고에 반영
        List<InventoryDTO> inventoryList = inboundService.findInboundDetailList(inboundCode).get();
        inventoryList.stream().forEach(
                dto -> {
                    InventoryVO vo = InventoryVO.builder()
                            .inventoryCode(dto.getWarehouseCode()+"-"+dto.getProductCode())
                            .quantity(dto.getQuantity())
                            .productCode(dto.getProductCode())
                            .warehouseCode(dto.getWarehouseCode())
                            .build();
                    inboundService.updateInventory(vo);
                }
        );

        return "redirect:/wm/inbound/approval";
    }

    @PostMapping("/cancel")
    public String deleteInbound(@RequestParam String inboundCode) {
        inboundService.deleteInbound(inboundCode);

        return "redirect:/wm/inbound/approval";
    }

    // 입고현황

    @GetMapping("/status")
    public void wmGetAllInboundStatus(Model model) {
        List<InboundStatusDTO> inboundStatusList = inboundService.findAllInboundStatusList().get();
        model.addAttribute("inboundStatusList", inboundStatusList);
    }
}
