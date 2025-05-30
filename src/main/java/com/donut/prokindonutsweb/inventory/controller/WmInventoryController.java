package com.donut.prokindonutsweb.inventory.controller;

import com.donut.prokindonutsweb.inventory.dto.InventorySelectDTO;
import com.donut.prokindonutsweb.inventory.service.WmInventoryService;
import com.donut.prokindonutsweb.product.service.CategoryFilterService;
import com.donut.prokindonutsweb.security.dto.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/wm/warehouse")
public class WmInventoryController {
  
  private final WmInventoryService wmInventoryService;
  private final CategoryFilterService categoryFilterService;
  
  // 1) 초기 페이지 로딩
  @GetMapping
  public void wmGetInventoryList(Model model, @AuthenticationPrincipal CustomUserDetails user) {
    log.info(String.valueOf(user));
    // 1. 로그인 안 되어 있으므로 더미 담당자 코드로 설정
    String dummyMemberCode = user.getMemberCode();
    log.info("WM - Fetching inventory list for member: {}", dummyMemberCode);
    
    // 2. 해당 담당자에게 할당된 창고코드 조회 + 창고명 조회
    String warehouseCode = wmInventoryService.findWarehouseCodeByMemberCode(dummyMemberCode);
    String warehouseName = wmInventoryService.findWarehouseNameByWarehouseCode(warehouseCode);
    
    // 3. 창고가 아예 할당되지 않은 경우 (예: 담당자 미지정)
    if (warehouseCode == null || warehouseCode.trim().isEmpty()) {
      log.warn("No warehouse assigned to member: {}", dummyMemberCode);
      model.addAttribute("inventoryList", List.of()); // 재고는 빈 리스트로
      model.addAttribute("warehouseCode", "코드 미지정"); // 창고 없음 표시
      model.addAttribute("warehouseName", "할당사항 없음"); // 창고명
      return;
    }
    
    // 4. 할당된 창고의 재고 목록 조회
    List<InventorySelectDTO> inventoryList = wmInventoryService.findInventoryList(warehouseCode);
    
    // 5. 재고가 아예 없는 경우
    if (inventoryList == null || inventoryList.isEmpty()) {
      log.warn("No inventory found for warehouse: {}", warehouseCode);
      model.addAttribute("inventoryList", List.of()); // 재고는 빈 리스트로
      model.addAttribute("warehouseCode", warehouseCode + ", 재고 없음"); // 창고는 있으나 재고 없음 표시
      model.addAttribute("warehouseName", warehouseName); // 창고명
    } else {
      // 6. 재고가 존재할 경우 → 그대로 전달
      model.addAttribute("inventoryList", inventoryList);
      model.addAttribute("warehouseCode", warehouseCode);
      model.addAttribute("warehouseName", warehouseName); // 창고명
    }
    
    // 7. 중분류 목록을 조회
    List<String> categoryMidList = categoryFilterService.findCategoryMidList();
    model.addAttribute("categoryMidList", categoryMidList);
  }
  
}