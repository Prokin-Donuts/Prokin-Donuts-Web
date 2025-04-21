package com.donut.prokindonutsweb.mappers.inbound;

import com.donut.prokindonutsweb.dto.inbound.InboundDetailVO;
import com.donut.prokindonutsweb.dto.inbound.InboundVO;
import com.donut.prokindonutsweb.dto.inbound.InventoryVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
class InboundMapperTest {

    @Autowired(required = false)
    private InboundMapper inboundMapper;

    @Test
    void mapper() {
        inboundMapper.selectAllProductList().forEach(System.out::println);
    }

    @Test
    @DisplayName("입고 내역 DB 저장 테스트")
    void insertInbound() {
        InboundVO vo = InboundVO.builder()
                .inboundCode("IN7")
                .inboundDate(LocalDate.parse("2025-04-20"))
                .inboundStatus("입고대기")
                .warehouseCode("GG1")
                .build();

        inboundMapper.insertInbound(vo);
    }

    @Test
    @DisplayName("입고상세 내역 List DB 저장 테스트")
    void insertInboundDetail() {
        InboundDetailVO dto1 = InboundDetailVO.builder()
                .inboundDetailCode("In1-7")
                .quantity(200)
                .inboundCode("In1")
                .productCode("DPN1")
                .sectionCode("GG1-R")
                .build();

        InboundDetailVO dto2 = InboundDetailVO.builder()
                .inboundDetailCode("In1-8")
                .quantity(300)
                .inboundCode("In1")
                .productCode("DPN3")
                .sectionCode("GG1-R")
                .build();
        List<InboundDetailVO> list = new ArrayList<>();
        list.add(dto1);
        list.add(dto2);

        inboundMapper.insertInboundDetailList(list);
    }

    @Test
    @DisplayName("다음 입고 코드 반환 테스트")
    void selectInboundCode() {
        String s = inboundMapper.selectInboundCode();
        System.out.println(s);
    }

    @Test
    @DisplayName("입고목록 반환 메서드 테스트")
    void selectAllInboundList() {
        inboundMapper.selectAllInboundList().forEach(System.out::println);
    }

    @Test
    @DisplayName("입고상세 목록 반환 메서드 테스트")
    void selectAllInboundDetailList() {
        inboundMapper.selectAllInboundDetailList().forEach(System.out::println);
    }

    @Test
    @DisplayName("제품 이름 반환 메서드")
    void selectProductName() {
        String productName = inboundMapper.selectProductName("BGL1");
        System.out.println(productName);
    }

    @Test
    @DisplayName("제품 가격 반환 메서드")
    void selectProductPrice() {
        System.out.println(inboundMapper.selectProductPrice("BGL1"));
    }

    @Test
    @DisplayName("입고 완료 시 상태 변경 메서드")
    void approveInbound() {
        inboundMapper.approveInbound("IN1");
        inboundMapper.selectAllInboundList().forEach(System.out::println);
    }

    @Test
    @DisplayName("입고 완료시 재고에 반영하는 메서드(재고 O)")
    void updateInventory1() {
        InventoryVO vo = InventoryVO.builder()
                .inventoryCode("BS1-BGL1")
                .quantity(150)
                .productCode("BGL1")
                .warehouseCode("BS1")
                .build();
        inboundMapper.updateInventory(vo);
    }

    @Test
    @DisplayName("입고 완료시 재고에 반영하는 메서드(재고 X)")
    void updateInventory2() {
        InventoryVO vo = InventoryVO.builder()
                .inventoryCode("BS3-BGL1")
                .quantity(150)
                .productCode("BGL1")
                .warehouseCode("BS1")
                .build();
        inboundMapper.updateInventory(vo);
    }

    @Test
    @DisplayName("입고코드 입력시 입고상세 목록 반환(창고코드, 수량, 제품코드)")
    void selectInboundDetailList() {
        inboundMapper.selectInboundDetailList("IN2").forEach(System.out::println);
    }

    @Test
    @DisplayName("입고 취소(입고상태 -> 입고취소)")
    void deleteInbound() {
        inboundMapper.deleteInbound("IN7");
    }

    @Test
    @DisplayName("입고현황 반환 메서드")
    void selectAllInboundStatusList() {
        inboundMapper.selectAllInboundStatusList().forEach(System.out::println);
    }

    @Test
    @DisplayName("본사관리자의 입고승인(-> 승인대기)")
    void updateQhInboundStatus() {
        inboundMapper.updateQhInboundStatus("IN15");
    }

}