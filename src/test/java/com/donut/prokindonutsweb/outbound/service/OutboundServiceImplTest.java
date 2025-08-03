package com.donut.prokindonutsweb.outbound.service;

import com.donut.prokindonutsweb.outbound.dto.OutboundDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OutboundServiceImplTest {

    @Autowired
    private  OutboundService outboundService;

    @Test
    @DisplayName("Service 출고목록 조회")
    public void findOutboundList(){
        List<OutboundDTO> outboundList = outboundService.findOutboundList("DJ1");
        assertNotNull(outboundList);
        outboundList.forEach(log::info);
    }
    @Test
    @DisplayName("Service 출고요청 목록 조회")
    public void findApprovalOutboundList(){
        List<OutboundDTO> outboundList = outboundService.findApprovalOutboundList("DJ1");
        outboundList.forEach(log::info);
    }

}

