package com.donut.prokindonutsweb.outbound.mapper;

import com.donut.prokindonutsweb.outbound.dto.OutboundDTO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OutboundMapperTest {

    @Autowired(required = false)
    private OutboundMapper outboundMapper;

    @Test
    @DisplayName("출고 목록 반환 메서드 테스트")
    void selectAllOutboundList() {
        outboundMapper.selectAllOutboundList("DJ1").forEach(System.out::println);
    }


    @Test
    @DisplayName("재고 존재 여부 반환 메서드 ")
    void checkInventory() {
        boolean OB006 = outboundMapper.checkInventory("OB006");
        log.info(String.valueOf(OB006));
    }

    @Test
    @DisplayName("창고코드 반환")
    void getWarehouseCode() {
        String warehouseCode = outboundMapper.getWarehouseCode("WM1");
        log.info(warehouseCode);
    }


    @Test
    @DisplayName("출고 승인 목록 반환 메서드 테스트")
    void selectApprovalOutboundList() {
        List<OutboundDTO> outboundDTOList = outboundMapper.selectApprovalOutboundList("DJ1");
        outboundDTOList.forEach(dto -> log.info("출고정보: {}", dto));
    }

    @Test
    @DisplayName("출고 준비 목록 반환 메서드 테스트")
    void findCompletionOutboundList() {
        List<OutboundDTO> outboundDTOList = outboundMapper.selectCompletionOutboundList("DJ1");
        outboundDTOList.forEach(dto -> log.info("출고정보: {}", dto));
    }


    @Test
    @DisplayName("출고 제품의 보관타입 반환")
    void selectStoredType() {
        String storedType = outboundMapper.selectStoredType("OB001");
        log.info(storedType);
    }
    @Test
    @DisplayName("출고 제품의 수량 반환")
    void selectQuantity() {
        int quantity = outboundMapper.selectQuantity("OB001");
        log.info(String.valueOf(quantity));
    }

    @Test
    @DisplayName("섹션코드 존재 여부 반환 메서드 ")
    void checkSection() {
        boolean GG1R = outboundMapper.checkSection("GG1-R");
        log.info(String.valueOf(GG1R));
    }

    @Test
    @DisplayName("섹션 원복")
    void updateSection() {
        outboundMapper.updateSection("GG1-R",50);

    }



}