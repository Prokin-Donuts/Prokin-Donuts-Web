package com.donut.prokindonutsweb.dashboard.controller;

import com.donut.prokindonutsweb.dashboard.dto.CountStatDTO;
import com.donut.prokindonutsweb.dashboard.dto.InventoryStatisticDTO;
import com.donut.prokindonutsweb.dashboard.dto.SubcategoryProductInventoryDTO;
import com.donut.prokindonutsweb.dashboard.service.WmDashboardService;
import com.donut.prokindonutsweb.security.dto.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.Year;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/wm/Dashboard")
public class WmDashboardController {
  
  private final WmDashboardService wmDashboardService;
  
  // 대시보드 기본 로딩
  @GetMapping
  public void loadDashboard(Model model, @AuthenticationPrincipal CustomUserDetails user) {
    String memberCode = user.getMemberCode();
    List<String> warehouseCodes = wmDashboardService.findWarehouseCodesByMember(memberCode);
    
    if (warehouseCodes.isEmpty()) {
      log.warn("No warehouse found for member: {}", memberCode);
      return;
    }
    
    String warehouseCode = warehouseCodes.get(0); // 하나만 사용한다고 가정
    
    int inboundWaiting = wmDashboardService.findTodayWaitingInboundCount(warehouseCode); // 오늘 미승인 입고요청 건수
    int orderWaiting = wmDashboardService.findTodayWaitingOrderCount(warehouseCode); // 오늘 미승인 출고요청 건수
    int coldTemp = wmDashboardService.findSectionTemperature(warehouseCode, "냉장"); // 냉장 섹션 현재 온도
    int frozenTemp = wmDashboardService.findSectionTemperature(warehouseCode, "냉동"); // 냉동 섹션 현재 온도
    int roomTemp = wmDashboardService.findSectionTemperature(warehouseCode, "상온"); // 상온 섹션 현재 온도
    
    Long totalInventoryPrice = wmDashboardService.findTotalInventoryPrice(warehouseCode); // 현재 창고의 총 자산 (재고가치 총합)
    
    int currentYear = Year.now().getValue();
    List<InventoryStatisticDTO> categoryInventory = wmDashboardService.findCategoryInventoryByWarehouse(warehouseCode); // 카테고리별 재고 수량 목록
    List<SubcategoryProductInventoryDTO> subcategoryProductInventoryList = wmDashboardService.findSubcategoryProductInventoryByWarehouse(warehouseCode);
    
    model.addAttribute("warehouseCode", warehouseCode); // 로그인한 창고관리자의 창고코드
    model.addAttribute("inboundWaiting", inboundWaiting); // 오늘 미승인 입고요청 건수
    model.addAttribute("orderWaiting", orderWaiting); // 오늘 미승인 출고요청 건수
    model.addAttribute("coldTemp", coldTemp); // 냉장 섹션 현재 온도
    model.addAttribute("frozenTemp", frozenTemp); // 냉동 섹션 현재 온도
    model.addAttribute("roomTemp", roomTemp); // 상온 섹션 현재 온도
    model.addAttribute("totalInventoryPrice", totalInventoryPrice); // 창고의 총 자산가치
    model.addAttribute("categoryInventory", categoryInventory); // 카테고리별 재고 수량 목록
    model.addAttribute("subcategoryProductInventoryList", subcategoryProductInventoryList); // 카테고리별 제품별 재고 상세 목록
    
    // 처음에 대시보드 들어왔을 때는 "월별" 기준 데이터 세팅해줘야 함
    List<CountStatDTO> inboundByMonth = wmDashboardService.findInboundCountLast12Months(warehouseCode);
    List<CountStatDTO> orderByMonth = wmDashboardService.findOrderCountLast12Months(warehouseCode);
    
    model.addAttribute("inboundByMonth", inboundByMonth);
    model.addAttribute("orderByMonth", orderByMonth);
  }
  
  // 입고완료/출고완료 통합 조회 (년별/월별/주별)
  @GetMapping(path = "/stat/inbound-order", produces = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public Map<String, List<CountStatDTO>> getInboundAndOrderStats(
      @RequestParam String warehouseCode,
      @RequestParam String periodType
  ) {
    List<CountStatDTO> inboundStats;
    List<CountStatDTO> orderStats;
    
    switch (periodType) {
      case "week":
        inboundStats = wmDashboardService.findInboundCountLast4Weeks(warehouseCode);
        orderStats   = wmDashboardService.findOrderCountLast4Weeks(warehouseCode);
        break;
      case "year":
        inboundStats = wmDashboardService.findInboundCountRecentYears(warehouseCode);
        orderStats   = wmDashboardService.findOrderCountRecentYears(warehouseCode);
        break;
      case "month":
      default:
        inboundStats = wmDashboardService.findInboundCountLast12Months(warehouseCode);
        orderStats   = wmDashboardService.findOrderCountLast12Months(warehouseCode);
        break;
    }
    
    return Map.of(
        "inboundStats", inboundStats,
        "orderStats",   orderStats
    );
  }
  
  // 차트3 재고 통계 조회 (카테고리/섹션별만 남김)
  @GetMapping("/inventory/stat")
  @ResponseBody
  public List<?> getInventoryStats(@RequestParam String warehouseCode,
                                   @RequestParam String type) {
    if ("section".equals(type)) {
      return wmDashboardService.findSectionUsageRateByWarehouse(warehouseCode);
    } else {
      return wmDashboardService.findCategoryInventoryByWarehouse(warehouseCode);
    }
  }
  
  // 섹션 온도 업데이트
  @GetMapping("/temperature/edit")
  @ResponseBody
  public String updateSectionTemperature(@RequestParam String warehouseCode,
                                         @RequestParam String storedType,
                                         @RequestParam int temperature) {
    wmDashboardService.updateSectionTemperature(warehouseCode, storedType, temperature);
    return "ok";
  }
}
