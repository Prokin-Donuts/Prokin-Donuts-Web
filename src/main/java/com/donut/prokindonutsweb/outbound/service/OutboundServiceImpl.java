package com.donut.prokindonutsweb.outbound.service;

import com.donut.prokindonutsweb.outbound.dto.OutboundDTO;
import com.donut.prokindonutsweb.outbound.mapper.OutboundMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class OutboundServiceImpl implements OutboundService{

    private final OutboundMapper outboundMapper;

    //출고목록 조회
    @Override
    public List<OutboundDTO> findOutboundList(String warehouseCode) {
        return outboundMapper.selectAllOutboundList(warehouseCode);

    }

    //출고 요청 목록 조회
    @Override
    public List<OutboundDTO> findApprovalOutboundList(String warehouseCode){
        return outboundMapper.selectApprovalOutboundList(warehouseCode);
    }


    // 재고 존재 여부 확인
    @Override
    public boolean checkInventory(String outboundCode) {
        return outboundMapper.checkInventory(outboundCode);
    }

    //출고승인
    @Override
    public void approveOutbound(String outboundCode) {
        outboundMapper.approveOutbound(outboundCode);
    }

    // 재고 반영
    @Override
    public void updateInventory(String outboundCode) {
        outboundMapper.updateInventory(outboundCode);
    }

    //창고코드 조회
    @Override
    public String getWarehouseCode(String memberCode) {
        return outboundMapper.getWarehouseCode(memberCode);
    }


}
