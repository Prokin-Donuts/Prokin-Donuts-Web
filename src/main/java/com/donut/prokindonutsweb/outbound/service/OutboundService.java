package com.donut.prokindonutsweb.outbound.service;

import com.donut.prokindonutsweb.outbound.dto.OutboundDTO;

import java.util.List;

public interface OutboundService {

    List<OutboundDTO> findOutboundList(String warehouseCode);
    List<OutboundDTO> findApprovalOutboundList(String warehouseCode);


    boolean checkInventory(String outboundCode);

    void approveOutbound(String outboundCode);

    void updateInventory(String outboundCode);

    String getWarehouseCode(String memberCode);
}
