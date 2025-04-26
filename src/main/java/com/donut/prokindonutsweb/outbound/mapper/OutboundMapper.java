package com.donut.prokindonutsweb.outbound.mapper;

import com.donut.prokindonutsweb.outbound.dto.OutboundDTO;
import com.donut.prokindonutsweb.outbound.dto.OutboundDetailDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OutboundMapper {

    List<OutboundDTO> selectAllOutboundList(String warehouseCode);

    List<OutboundDetailDTO> selectAllOutboundDetailList();

    boolean checkInventory(@Param("outboundCode") String outboundCode);

    void approveOutbound(String outboundCode);

    void updateInventory(String outboundCode);
}
